import 'package:serverpod/serverpod.dart';
import 'package:organiza_metro_server/src/generated/protocol.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

/// Endpoint para utilidades de autenticação e permissão
class AuthUtilsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  // Retorna se o usuário autenticado é admin
  Future<bool> isAdmin(Session session) async {
    final authenticationInfo = await session.authenticated;
    final userId = authenticationInfo?.userId;

    print('authenticationInfo: $authenticationInfo');
    print('userId: $userId');

    // Busca na sua tabela UserInfo (custom)
    final localInfo = await UserInfo.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userId),
    );

    print('localinfo: $localInfo');

    return localInfo?.isAdmin ?? false;
  }

  // Retorna o nome do usuário logado
  Future<String?> getUserName(Session session) async {
    final authenticationInfo = await session.authenticated;
    final userId = authenticationInfo?.userId;

    print('authenticationInfo: $authenticationInfo');
    print('userId: $userId');

    final info = await auth.UserInfo.db.findById(session, userId!);

    print('info: $info');

    return info?.userName;
  }
}
