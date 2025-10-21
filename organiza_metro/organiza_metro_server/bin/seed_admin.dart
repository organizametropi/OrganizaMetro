import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;
import 'package:organiza_metro_server/src/generated/protocol.dart' as proto;
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

Future<void> main(List<String> args) async {
  // Inicializa o Serverpod manualmente
  final pod = Serverpod(args, proto.Protocol(), Endpoints());
  final session = await pod.createSession();

  const email = 'admin@metrosp.com';
  const password = '12345678';

  // Evita duplicar
  final existing = await auth.EmailAuth.db.findFirstRow(
    session,
    where: (t) => t.email.equals(email),
  );

  if (existing != null) {
    print('⚠️ Usuário admin já existe!');
    return;
  }

  // Cria o usuário de autenticação
  final serverpodUser =
      await auth.Emails.createUser(session, 'Administrador', email, password);

  // Atualiza nome completo e username
// Atualiza o userInfo (é ele quem tem o campo emailVerified agora)
  final userInfo = await auth.UserInfo.db.findById(session, serverpodUser!.id!);

  if (userInfo != null) {
    userInfo.fullName = 'Administrador do Sistema';
    userInfo.userName = 'Administrador';
    await auth.UserInfo.db.updateRow(session, userInfo);
  }

  // Cria registro na sua tabela customizada, linkando o mesmo id
  final localUser = proto.LocalUserInfo(
    userInfoId: serverpodUser!.id!,
    registro: '0001',
    telefone: '(11) 99999-0000',
    area: 'TI',
    isAdmin: true,
  );
  await proto.LocalUserInfo.db.insertRow(session, localUser);

  print('✅ Usuário admin criado com sucesso!');
  print('Email: $email');
  print('Senha: $password');
}
