import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';
import '../utils/auth.utils.dart';

/// Endpoint para funções administrativas (acesso restrito por permissão).
class AdminEndpoint extends Endpoint {
  // 🚨 Requer que o usuário esteja logado
  @override
  bool get requireLogin => true;

  AuthUtilsEndpoint auth = AuthUtilsEndpoint();

  Future<List<Alerta>> getAdminAlerts(Session session) async {
    if (await auth.isAdmin(session) == false) {
      throw Exception('Acesso negado. Apenas administradores.');
    }
    
    return await Alerta.db.find(
      session,
      where: (t) => t.ativo.equals(true),
      orderBy: (t) => t.dataCriacao,
      orderDescending: true,
    );
  }

  // TODO: Adicionar métodos Adicionar/Editar Material, Ferramenta, Usuário
}
