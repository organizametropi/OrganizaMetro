import '../utils/auth.utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

// Nota: O campo 'nome' não está no modelo Ferramenta que você forneceu,
// mas a query usará 'descricao' como o campo amigável para exibição.
// Se você adicionar o campo 'nome' ao modelo Ferramenta, substitua f.descricao por f.nome.

class RelatoriosEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  AuthUtils Auth = AuthUtils();

  // --- PBI 3.1.2: Gráfico dos 10 materiais mais consumidos no último mês ---
  Future<List<ConsumoMensal>> getTopConsumidos(
      Session session, int LIMIT) async {
    if (await Auth.isAdmin(session) == false) {
      throw Exception('Acesso negado. Apenas administradores.');
    }

    final now = DateTime.now().toUtc();
    final oneMonthAgo = DateTime(now.year, now.month - 1, 1).toUtc();
    final startOfCurrentMonth = DateTime(now.year, now.month, 1).toUtc();
    final limite = LIMIT;

    final parameters = QueryParameters.named({
      // 'oneMonthAgo': oneMonthAgo,
      // 'startOfCurrentMonth': startOfCurrentMonth,
      'limite': limite
    });

    // 🚨 QUERY SQL NATIVO - Material
    final sql = """
      SELECT
          m.descricao AS materialDescricao,
          SUM(mov.quantidade) AS totalConsumido
      FROM movimentacao mov
      JOIN material m ON mov."materialId" = m.id
      WHERE 
          mov."tipoMovimentacao" = 'Saída' 
      GROUP BY
          m.descricao
      ORDER BY
          totalConsumido DESC
      LIMIT @limite;
    """;

    final List<List<dynamic>> result =
        await session.db.unsafeQuery(sql, parameters: parameters);

    return result.map((row) {
      return ConsumoMensal(
        nome: row[0] as String,
        total: (row[1] as num).toDouble(),
      );
    }).toList();
  }

  // -----------------------------------------------------------------------
  // 🚀 NOVO: Top Ferramentas Utilizadas/Empenhadas
  // --- PBI 3.1.2 (Ferramentas): Gráfico das 10 ferramentas mais empenhadas no último mês ---
  // -----------------------------------------------------------------------
  Future<List<ConsumoMensal>> getTopFerramentasUtilizadas(
      Session session, int LIMIT) async {
    if (await Auth.isAdmin(session) == false) {
      throw Exception('Acesso negado. Apenas administradores.');
    }

    final now = DateTime.now().toUtc();
    final oneMonthAgo = DateTime(now.year, now.month - 1, 1).toUtc();
    final startOfCurrentMonth = DateTime(now.year, now.month, 1).toUtc();
    final limite = LIMIT;

    // Parâmetros (reutilizamos os parâmetros de data do ConsumoMensal)
    final parameters = QueryParameters.named({
      'oneMonthAgo': oneMonthAgo,
      'startOfCurrentMonth': startOfCurrentMonth,
      'limite': limite
    });

    // 🚨 QUERY SQL NATIVO - Ferramenta
    final sql = """
      SELECT
          f.descricao AS ferramentaDescricao,
          COUNT(mov.id) AS totalUsos 
      FROM movimentacao mov
      JOIN ferramenta f ON mov."materialId"= f.id
      WHERE 
          mov."tipoMovimentacao" = 'Saída'  AND
          mov."dataMovimentacao" >= \$1 AND 
          mov."dataMovimentacao" < \$2
      GROUP BY
          f.descricao
      ORDER BY
          totalUsos DESC
      LIMIT \$3;
    """;

    // Executa a query e mapeia o resultado
    final List<List<dynamic>> result =
        await session.db.unsafeQuery(sql, parameters: parameters);

    return result.map((row) {
      return ConsumoMensal(
        nome: row[0] as String,
        // COUNT retorna BIGINT no PostgreSQL, que é mapeado para int ou num/double
        total: (row[1] as num).toDouble(),
      );
    }).toList();
  }

  Future<List<ConsumoMensal>> getConsmuoClBase(Session session) async {
    if (await Auth.isAdmin(session) == false) {
      throw Exception('Acesso negado. Apenas administradores.');
    }

    final sql = """
     SELECT
  b.nome AS nome_base,
  COUNT(mov."origemBaseId") AS aparicoes
FROM movimentacao mov
JOIN base b ON mov."origemBaseId" = b.id
WHERE 
  mov."tipoMovimentacao" = 'Saída' AND
  mov."materialId" IS NOT NULL
GROUP BY
  b.nome
ORDER BY
  aparicoes DESC
    """;

    // Executa a query e mapeia o resultado
    final List<List<dynamic>> result = await session.db.unsafeQuery(sql);

    return result.map((row) {
      return ConsumoMensal(
        nome: row[0] as String,
        // COUNT retorna BIGINT no PostgreSQL, que é mapeado para int ou num/double
        total: (row[1] as num).toDouble(),
      );
    }).toList();
  }

  // --- PBI 3.1.3 e 3.2.4: Painel de Instrumentos com Calibração Vencida/A Vencer ---
  Future<List<Ferramenta>> getInstrumentosCalibracao(Session session) async {
    if (await Auth.isAdmin(session) == false) {
      throw Exception('Acesso negado. Apenas administradores.');
    }

    final today = DateTime.now().toUtc();
    final soonToExpire = today.add(const Duration(days: 30)).toUtc();

    // 1. Encontra a última calibração válida/vencida para cada instrumento.
    // 🚨 Usamos a tabela Calibracao para filtrar as datas diretamente no banco.
    final List<Calibracao> calibracoesRelevantes = await Calibracao.db.find(
      session,
      // Filtra por calibrações que VENCERAM OU VENCEM NOS PRÓXIMOS 30 DIAS
      where: (t) => t.validadeCalibracao > (soonToExpire),
      // Inclui a Ferramenta para ter todos os dados necessários no objeto retornado
      include: Calibracao.include(
        ferramenta: Ferramenta.include(), // Inclui a Ferramenta completa
      ),
      // Ordena pela data de validade para priorizar as mais antigas/vencidas
      orderBy: (t) => t.validadeCalibracao,
    );

    // 2. Processamento e Remoção de Duplicatas
    // O filtro acima pode trazer múltiplas calibrações (antigas e novas) para a mesma ferramenta.
    // Precisamos garantir que apenas a calibração MAIS RECENTE seja considerada.

    final Map<int, Calibracao> latestCalibrations = {};

    for (final calib in calibracoesRelevantes) {
      final ferramentaId = calib.ferramenta?.id;
      if (ferramentaId == null) continue;

      if (!latestCalibrations.containsKey(ferramentaId) ||
          calib.dataCalibracao
              .isAfter(latestCalibrations[ferramentaId]!.dataCalibracao)) {
        latestCalibrations[ferramentaId] = calib;
      }
    }

    // 3. Filtro Final no Dart para garantir que só Instrumentos sejam retornados
    final List<Ferramenta> instrumentosComAlerta = latestCalibrations.values
        .where((calib) => calib.ferramenta != null)
        .map((calib) => calib.ferramenta!)
        .toList();

    // 4. Se a calibração mais recente (já filtrada pelo loop) for a que atende
    // ao critério de tempo, retornamos o objeto Ferramenta.
    return instrumentosComAlerta;
  }

  // --- PBI 3.2.3: Relatório de instrumentos em uso e responsáveis ---
  Future<List<Ferramenta>> getInstrumentosEmUso(Session session) async {
    if (await Auth.isAdmin(session) == false) {
      throw Exception('Acesso negado. Apenas administradores.');
    }

    // Busca ferramentas em uso, incluindo o usuário empenhado
    return await Ferramenta.db.find(
      session,
      where: (t) =>
          t.emUso.equals(true) &
          t.divisao
              .equals('Instrumento'), // 🚨 Ajustado para usar o campo 'divisao'
      include: Ferramenta.include(
        empenhadoPara:
            auth.UserInfo.include(), // Busca o usuário do módulo auth
      ),
    );
  }
}
