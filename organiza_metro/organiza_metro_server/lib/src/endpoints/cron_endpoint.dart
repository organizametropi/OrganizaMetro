import 'package:organiza_metro_server/src/utils/alertas_utils.dart';
import 'package:serverpod/serverpod.dart';


class CronEndpoint extends Endpoint {
  // Este método será chamado pelo cron configurado em cron.yaml
  Future<void> verificarAlertas(Session session) async {
    print('Executando verificação de alertas...');

    // 🔹 Verifica empréstimos próximos do prazo
    await AlertasUtils.verificarDevolucoes(session);

    // 🔹 Verifica materiais com estoque baixo
    await AlertasUtils.verificarEstoqueBaixo(session);

    print('Verificação de alertas finalizada.');
  }
}
