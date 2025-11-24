import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import '../generated/protocol.dart';
import './auth.utils.dart';

class AlertasUtils {
  static Future<void> verificarDevolucoes(Session session) async {
    final agora = DateTime.now();
    final emprestimos = await Movimentacao.db.find(
      session,
      where: (t) => t.dataDevolucao<(agora.add(Duration(hours: 24))),
      include: Movimentacao.include(usuario: UserInfo.include())
    );

    for (final e in emprestimos) {
      final existe = await Alerta.db.findFirstRow(
        session,
        where: (a) =>
            a.usuarioId.equals(e.usuarioId) &
            a.tipo.equals('DEVOLUCAO_PROXIMA') &
            a.ativo.equals(true),
      );

      if (existe == null) {
        await Alerta.db.insertRow(
          session,
          Alerta(
            usuarioId: e.usuarioId,
            tipo: 'DEVOLUCAO_PROXIMA',
            titulo: 'Prazo de devolução próximo',
            mensagem: 'A ferramenta ${e.ferramenta!.codigoSap} deve ser devolvida até ${e.dataDevolucao}.'
          ),
        );
      }
    }
  }

  static Future<void> verificarEstoqueBaixo(Session session) async {
    final materiais = await Material.db.find(
      session,
      where: (m) => m.quantidade<=(m.estoqueMinimo),
    );


    for (final mat in materiais) {
      final existe = await Alerta.db.findFirstRow(
        session,
        where: (a) =>
            a.materialId.equals(mat.id) &
            a.tipo.equals('ESTOQUE_BAIXO') &
            a.ativo.equals(true),
      );

      if (existe == null) {
        await Alerta.db.insertRow(
          session,
          Alerta(
            usuarioId: null,
            tipo: 'ESTOQUE_BAIXO',
            titulo: 'Estoque baixo',
            mensagem: 'O material ${mat.codigoSap} está com apenas ${mat.quantidade} unidades.'
          ),
        );
      }
    }
  }
}
