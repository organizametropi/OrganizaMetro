import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart' as proto;
import 'package:serverpod_auth_server/module.dart' as auth;
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// Endpoint responsável por criar e gerenciar Movimentações.
class MovimentacaoEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Cria uma requisição de saída de itens (Materiais e/ou Ferramentas).
  ///
  /// A operação é executada dentro de uma transação atômica.
  Future<bool> criarRequisicaoSaida(
    Session session, {
    required List<proto.RequisicaoItem> itens,
    required String modalidadeEntrega,
    required DateTime dataDaMovimentacao,
    String? observacao,
    // Campos de Localização de DESTINO (Opcional, pois a saída é para o usuário)
    int? destinoBaseId,
    int? destinoVeiculoId,
  }) async {
    // Tipo de Movimentação para este endpoint é fixo
    const String tipoMovimentacao = 'Saída';

    final authenticationInfo = await session.authenticated;
    final usuarioAuthId = authenticationInfo?.userId;
    List<String> alertas = [];

    // 2. Executar a lógica dentro de uma Transação
    return await session.db.transaction((transactionSession) async {
      session.log('Itens recebidos: ${itens.map((e) => e.toJson()).toList()}');
      for (final item in itens) {
        final isMaterial = item.materialId != null;
        final isFerramenta = item.ferramentaId != null;

        if (isMaterial) {
          await _processarSaidaMaterial(
              session,
              transactionSession,
              item,
              usuarioAuthId!,
              tipoMovimentacao,
              modalidadeEntrega,
              observacao,
              dataDaMovimentacao,
              destinoBaseId,
              destinoVeiculoId,
              alertas);
        } else if (isFerramenta) {
          await _processarEmpenhamentoFerramenta(
              session,
              transactionSession,
              item,
              usuarioAuthId!,
              tipoMovimentacao,
              modalidadeEntrega,
              observacao,
              dataDaMovimentacao,
              destinoBaseId,
              destinoVeiculoId,
              alertas);
        } else {
          throw Exception(
              'Item da requisição deve ser um Material ou uma Ferramenta.');
        }
      }

      // 🚨 Enviar alertas (futuro sistema)
      if (alertas.isNotEmpty) {
        session.log('ALERTA GERAL DA REQUISIÇÃO: ${alertas.join('; ')}',
            level: LogLevel.info);
      }

      return true; // Transação concluída com sucesso
    });
  }

//   // -------------------------------------------------------------------------
//   // MÉTODOS PRIVADOS DE LÓGICA DE NEGÓCIO
//   // -------------------------------------------------------------------------

  Future<void> _processarSaidaMaterial(
    Session session,
    Transaction transactionSession,
    proto.RequisicaoItem item,
    int usuarioAuthId,
    String tipoMovimentacao,
    String modalidadeEntrega,
    String? observacao,
    DateTime dataDaMovimentacao,
    int? destinoBaseId,
    int? destinoVeiculoId,
    List<String> alertas,
  ) async {
    session.log('DEBUG -> materialId: ${item.materialId}',
        level: LogLevel.debug);
    final material = await proto.Material.db.findFirstRow(session,
        where: (t) => t.id.equals(item.materialId),
        include: proto.Material.include(),
        transaction: transactionSession);

    if (material == null) {
      throw Exception('Material não encontrado (ID: ${item.materialId}).');
    }

    final double? estoqueAtual = material.quantidade;
    final double quantidadeRequerida = item.quantidade;

    if (quantidadeRequerida <= 0) {
      throw Exception('A quantidade requerida deve ser maior que zero.');
    }
    if (quantidadeRequerida > estoqueAtual!) {
      throw Exception('Estoque insuficiente para ${material.descricao}.');
    }

    // Atualiza Estoque
    final double novoEstoque = estoqueAtual - quantidadeRequerida;

    if (novoEstoque < (material.estoqueMinimo ?? 0)) {
      alertas.add(
          '⚠️ Estoque de ${material.descricao} (${novoEstoque}) está abaixo do mínimo.');
    }

    material.quantidade = novoEstoque;
    material.dataUltimaMovimentacao = DateTime.now();
    await proto.Material.db
        .updateRow(session, material, transaction: transactionSession);

    // 🚨 REGISTRO DA MOVIMENTAÇÃO (Utilizando todos os campos do modelo)
    final movimentacao = proto.Movimentacao(
      usuarioId: usuarioAuthId,
      materialId: material.id,
      material: material,
      ferramentaId: null, // Sem Ferramenta

      quantidade: quantidadeRequerida,
      tipoMovimentacao: tipoMovimentacao,
      dataRequisicao: DateTime.now(),
      dataMovimentacao: dataDaMovimentacao,
      modalidadeEntrega: modalidadeEntrega,
      observacao: observacao,

      origemBaseId: material.baseId,
      origemBase: material.base,
      origemVeiculoId: material.veiculoId,
      origemVeiculo: material.veiculo,
      destinoBaseId: destinoBaseId, // Usa o destino (se fornecido)
      destinoVeiculoId: destinoVeiculoId, // Usa o destino (se fornecido)
      dataDevolucao: null, // Não se aplica
    );
    await proto.Movimentacao.db
        .insertRow(session, movimentacao, transaction: transactionSession);
  }

  Future<void> _processarEmpenhamentoFerramenta(
    Session session,
    Transaction transactionSession,
    proto.RequisicaoItem item,
    int usuarioAuthId,
    String tipoMovimentacao,
    String modalidadeEntrega,
    String? observacao,
    DateTime dataDaMovimentacao,
    int? destinoBaseId,
    int? destinoVeiculoId,
    List<String> alertas,
  ) async {
    if (item.quantidade != 1) {
      throw Exception('Ferramentas devem ser empenhadas individualmente.');
    }

    var ferramenta = await proto.Ferramenta.db.findFirstRow(session,
        where: (t) => t.id.equals(item.ferramentaId),
        transaction: transactionSession);

    if (ferramenta == null) throw Exception('Ferramenta não encontrada.');
    if (ferramenta.emUso) {
      throw Exception('Ferramenta ${ferramenta.descricao} já está empenhada.');
    }

    // Validação de Calibração (mantida a lógica de Instrumentos)
    if (ferramenta.tipo == 'Instrumento' && ferramenta.status == 'Vencido') {
      alertas.add(
          '⚠️ Instrumento ${ferramenta.descricao} está com calibração vencida. Empenhamento realizado, mas requer atenção.');
    }

    // Atualiza status da Ferramenta
    ferramenta.emUso = true;
    ferramenta.empenhadoParaId = usuarioAuthId;
    ferramenta.status = 'Empenhada';
    ferramenta.dataUltimaMovimentacao = DateTime.now().toUtc();
    await proto.Ferramenta.db
        .updateRow(session, ferramenta, transaction: transactionSession);

    // 🚨 REGISTRO DA MOVIMENTAÇÃO (Utilizando todos os campos do modelo)
    final movimentacao = proto.Movimentacao(
      usuarioId: usuarioAuthId,
      materialId: null,
      ferramentaId: ferramenta.id,

      quantidade: 1.0,
      tipoMovimentacao: tipoMovimentacao,
      dataRequisicao: DateTime.now(),
      dataMovimentacao: dataDaMovimentacao,
      modalidadeEntrega: modalidadeEntrega,
      observacao: observacao,

      origemBaseId: null,
      origemVeiculoId: null,
      destinoBaseId: destinoBaseId, // Usa o destino (se fornecido)
      destinoVeiculoId: destinoVeiculoId, // Usa o destino (se fornecido)
      dataDevolucao: null, // A devolução será outra movimentação
    );
    await proto.Movimentacao.db
        .insertRow(session, movimentacao, transaction: transactionSession);
  }

  Future<bool> processarDevolucaoFerramenta(Session session,
      {required int ferramentaId,
      required DateTime dataDaMovimentacao,
      int? destinoBaseId,
      int? destinoVeiculoId,
      String? observacao}) async {
    // Row Locking (usando queryModifier como no Saída de Material)
    final List<proto.Ferramenta> ferramentas = await proto.Ferramenta.db
        .find(session, where: (t) => t.id.equals(ferramentaId));

    final ferramenta = ferramentas.isEmpty ? null : ferramentas.first;

    if (ferramenta == null) throw Exception('Ferramenta não encontrada.');
    if (!ferramenta.emUso) throw Exception('Ferramenta já está disponível.');

    final authenticationInfo = await session.authenticated;
    final usuarioAuthId = authenticationInfo?.userId;

    // 1. Atualiza status da Ferramenta para 'Disponível'
    ferramenta.emUso = false;
    ferramenta.empenhadoParaId = null;
    ferramenta.status = 'Disponível';
    ferramenta.dataUltimaMovimentacao = DateTime.now();

    // 🚨 ATENÇÃO: A Ferramenta volta para o estoque de destino (Base ou Veículo)
    ferramenta.baseId = destinoBaseId;
    ferramenta.veiculoId = destinoVeiculoId;

    await proto.Ferramenta.db.updateRow(session, ferramenta);

    // 2. Registro da Movimentação de Devolução
    final movimentacao = proto.Movimentacao(
      usuarioId: usuarioAuthId!,
      materialId: null,
      ferramentaId: ferramenta.id,

      quantidade: 1.0,
      tipoMovimentacao: 'Devolução', // Tipo específico
      dataRequisicao: DateTime.now(),
      dataMovimentacao: dataDaMovimentacao,
      modalidadeEntrega:
          'Balcão', // Assumimos que devolução é sempre no balcão/local
      observacao: observacao,

      origemBaseId: ferramenta
          .baseId, // Origem é o local onde estava antes da devolução (se houver)
      origemVeiculoId: ferramenta.veiculoId,
      destinoBaseId: destinoBaseId, // Destino final
      destinoVeiculoId: destinoVeiculoId,
      dataDevolucao: DateTime.now(),
    );
    await proto.Movimentacao.db.insertRow(session, movimentacao);

    return true;
  }
}
