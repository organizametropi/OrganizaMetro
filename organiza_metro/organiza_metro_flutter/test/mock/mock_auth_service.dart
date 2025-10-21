import 'package:organiza_metro_flutter/src/services/auth_service.dart';

class MockAuthService extends AuthService {
  bool shouldSucceed;

  MockAuthService({this.shouldSucceed = true});

  @override
  Future<bool> login(String email, String password) async {
    return shouldSucceed;
  }
}
