import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/email_field.dart';

void main() {
  testWidgets('EmailField renderiza e aceita entrada de texto',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: EmailField(
          fadeEmail: false,
          emailController: controller,
        ),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'teste@exemplo.com');
    expect(controller.text, 'teste@exemplo.com');
  });
}
