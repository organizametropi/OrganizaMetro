import 'package:organiza_metro_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/utils/alertas_utils.dart';

class VerificarAlertasFutureCall extends FutureCall<Alerta> {
  @override
  Future<void> invoke(Session session, Alerta? data) async {
    print('[CRON] Executando verificação de alertas...');

    await AlertasUtils.verificarDevolucoes(session);
    await AlertasUtils.verificarEstoqueBaixo(session);

    print('[CRON] Verificação de alertas finalizada.');

    // Auto-reagendar para daqui a 1 hora
     await session.serverpod.futureCallWithDelay(
      'verificarAlertasFutureCall', 
      null,
      const Duration(hours: 1),
    );
  }
}
