import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();



  bool? isAdmin;
  String? userName;

  /// Retorna o nome do usuário logado, buscando no servidor se necessário
  Future<String?> getUserName() async {
    userName ??= await client.authUtils.getUserName();
    return userName;
  }

  /// Retorna true se o usuário for admin
  Future<bool> getIsAdmin() async {
    isAdmin ??= await client.authUtils.isAdmin();
    print('Admin encontrado: $isAdmin'); 
    return isAdmin!;
  }

  /// Atualiza manualmente os dados (ex: após login/logout)
  Future<void> refreshUserInfo() async {
    userName = await client.authUtils.getUserName();
    isAdmin = await client.authUtils.isAdmin();
  }

  /// Limpa cache local (ex: no logout)
  void clearCache() {
    isAdmin = null;
    userName = null;
  }


}
