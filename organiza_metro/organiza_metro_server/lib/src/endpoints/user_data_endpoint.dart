import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';

class UserDataEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Retorna as notificações ATIVAS destinadas a este usuário ou gerais.
  Future<List<Alerta>> getMyAlerts(Session session) async {
    final authenticationInfo = await session.authenticated;
    final userId = authenticationInfo?.userId;

    // Busca alertas destinados ao usuário logado OU alertas gerais (usuarioIdId == null)
    return await Alerta.db.find(
      session,
      where: (t) =>
          t.ativo.equals(true) &
          (t.usuarioId.equals(userId)),
      orderBy: (t) => t.dataCriacao,
      orderDescending: true,
    );
  }

  /// Retorna o histórico de movimentações do usuário logado.
  Future<List<Movimentacao>> getMyHistory(Session session) async {
    final authenticationInfo = await session.authenticated;
    final userId = authenticationInfo?.userId;

    // Busca movimentações onde o usuário logado é o responsável
    return await Movimentacao.db.find(
      session,
      where: (t) => t.usuarioId.equals(userId),
      orderBy: (t) => t.dataMovimentacao,
      orderDescending: true,
      limit: 20, // Limita o histórico para não sobrecarregar
    );
  }
}
