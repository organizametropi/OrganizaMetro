// import 'package:serverpod/serverpod.dart';
// import '../generated/protocol.dart';

// class AlertasUtils {
//   static Future<void> verificarDevolucoes(Session session) async {
//     final agora = DateTime.now();
//     final emprestimos = await Emprestimo.db.find(
//       session,
//       where: (t) => t.dataDevolucaoPrevista.lessThan(agora.add(Duration(hours: 24))),
//     );

//     for (final e in emprestimos) {
//       // Evita criar alerta duplicado
//       final existe = await Alerta.db.findFirstRow(
//         session,
//         where: (a) =>
//             a.usuarioId.equals(e.usuarioId) &
//             a.tipo.equals('DEVOLUCAO_PROXIMA') &
//             a.relacionadoId.equals(e.id) &
//             a.ativo.equals(true),
//       );

//       if (existe == null) {
//         await Alerta.db.insertRow(
//           session,
//           Alerta(
//             usuarioId: e.usuarioId,
//             tipo: 'DEVOLUCAO_PROXIMA',
//             titulo: 'Prazo de devolução próximo',
//             mensagem: 'A ferramenta ${e.ferramentaNome} deve ser devolvida até ${e.dataDevolucaoPrevista}.',
//             relacionadoId: e.id,
//           ),
//         );
//       }
//     }
//   }

//   static Future<void> verificarEstoqueBaixo(Session session) async {
//     final materiais = await Material.db.find(
//       session,
//       where: (m) => m.quantidadeAtual.lessThanOrEquals(m.quantidadeMinima),
//     );

//     for (final mat in materiais) {
//       final existe = await Alerta.db.findFirstRow(
//         session,
//         where: (a) =>
//             a.tipo.equals('ESTOQUE_BAIXO') &
//             a.relacionadoId.equals(mat.id) &
//             a.ativo.equals(true),
//       );

//       if (existe == null) {
//         await Alerta.db.insertRow(
//           session,
//           Alerta(
//             usuarioId: null, // alerta global para admins
//             tipo: 'ESTOQUE_BAIXO',
//             titulo: 'Estoque baixo',
//             mensagem: 'O material ${mat.nome} está com apenas ${mat.quantidadeAtual} unidades.',
//             relacionadoId: mat.id,
//           ),
//         );
//       }
//     }
//   }
// }
