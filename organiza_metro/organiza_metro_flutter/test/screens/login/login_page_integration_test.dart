import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/entrar_button.dart';
import '../../mock/mock_auth_service.dart';

void main() {
  testWidgets('Login com sucesso exibe SnackBar de sucesso',
      (WidgetTester tester) async {
    final mockAuth = MockAuthService(shouldSucceed: true);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GetStartedButton(
            emailController: emailController,
            passwordController: passwordController,
            onLogin: (email, password) async {
              final success = await mockAuth.login(email, password);
              if (success) {
                ScaffoldMessenger.of(tester.element(find.byType(ElevatedButton)))
                    .showSnackBar(
                  const SnackBar(content: Text('Login bem-sucedido')),
                );
              } else {
                ScaffoldMessenger.of(tester.element(find.byType(ElevatedButton)))
                    .showSnackBar(
                  const SnackBar(content: Text('Falha no login')),
                );
              }
            },
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField).first, 'admin@metrosp.com');
    await tester.enterText(find.byType(TextField).last, '12345678');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Login bem-sucedido'), findsOneWidget);
  });

  testWidgets('Login falha exibe SnackBar de erro',
      (WidgetTester tester) async {
    final mockAuth = MockAuthService(shouldSucceed: false);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GetStartedButton(
            emailController: emailController,
            passwordController: passwordController,
            onLogin: (email, password) async {
              final success = await mockAuth.login(email, password);
              if (success) {
                ScaffoldMessenger.of(tester.element(find.byType(ElevatedButton)))
                    .showSnackBar(
                  const SnackBar(content: Text('Login bem-sucedido')),
                );
              } else {
                ScaffoldMessenger.of(tester.element(find.byType(ElevatedButton)))
                    .showSnackBar(
                  const SnackBar(content: Text('Falha no login')),
                );
              }
            },
          ),
        ),
      ),
    );


    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Falha no login'), findsOneWidget);
  });
}
