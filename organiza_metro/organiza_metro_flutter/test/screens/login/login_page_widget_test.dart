import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/screens/auth/login_screen.dart';



void main() {
  testWidgets('LoginPage exibe logo, campos e botão de login',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: loginPage()),
    );

    expect(find.text('Bem Vindo!'), findsOneWidget);
    expect(find.text('Faça login para continuar'), findsOneWidget);
    expect(find.byType(Image), findsWidgets);
    expect(find.byType(TextField), findsNWidgets(2)); 
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
