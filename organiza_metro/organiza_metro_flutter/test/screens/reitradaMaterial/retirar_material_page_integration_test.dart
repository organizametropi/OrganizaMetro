import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/retirar_material_screen.dart'; // Sua página principal
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart'; 
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import '../../mock/mock_movimentacao_endpoint.dart'; 


class MockClient extends Mock implements Client {}

void main() {
  late MockClient mockClient;
  late MockMovimentacaoEndpoint mockEndpoint;


  Widget createWidgetForTesting({required Widget child}) {
   
    mockClient = MockClient();
    mockEndpoint = MockMovimentacaoEndpoint();
    client = mockClient;
    when(mockClient.movimentacao).thenReturn(mockEndpoint);

   
    return MaterialApp(
      home: Builder(builder: (context) {
        return child;
      }),
    );
  }

  group('RetirarMaterialPage Integration Test', () {
    
    testWidgets('Botão FINALIZAR é desabilitado sem itens', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: const retirarMaterialPage()));
      await tester.pumpAndSettle(); 

    
      final finalizarButton = find.widgetWithText(ElevatedButton, 'FINALIZAR REQUISIÇÃO');
      
      
      expect(tester.widget<ElevatedButton>(finalizarButton).onPressed, isNull);
    });

    testWidgets('Fluxo completo de adição e submissão', (WidgetTester tester) async {
      
      await tester.pumpWidget(createWidgetForTesting(child: const retirarMaterialPage()));
      await tester.pumpAndSettle();
      
     
      when(mockEndpoint.criarRequisicaoSaida(itens: anyNamed('itens'), modalidadeEntrega: anyNamed('modalidadeEntrega'), origemBaseId: anyNamed('origemBaseId'))).thenAnswer((_) async => true);


      final addButton = find.widgetWithText(TextButton, 'Adicionar material');
      await tester.tap(addButton);
      await tester.pumpAndSettle(); 

      final controller = tester.element(find.byType(Consumer<RetirarMaterialController>)).widget as Consumer<RetirarMaterialController>;
      final mockSelectedItems = [{'id': 101, 'descricao': 'Fusível', 'quantidade': 5.0, 'isMaterial': true, 'codigoSap': 15000001}];
      

      controller.builder(tester.element(find.byType(Scaffold)), tester.get.context, null).controller.addMaterials(mockSelectedItems);
      await tester.pumpAndSettle(); 

  
      final radioOption = find.text('Balcão (retirada no centro de atendimento)');
      await tester.tap(radioOption);
      await tester.pumpAndSettle();
      
     
      final finalizarButton = find.widgetWithText(ElevatedButton, 'FINALIZAR REQUISIÇÃO');
      
   
      expect(tester.widget<ElevatedButton>(finalizarButton).onPressed, isNotNull);
      

      await tester.tap(finalizarButton);
      await tester.pumpAndSettle(const Duration(seconds: 1)); 


      expect(find.text('✅ Requisição enviada com sucesso!'), findsOneWidget);
      

      final controllerInstance = tester.element(find.byType(Consumer<RetirarMaterialController>)).widget as Consumer<RetirarMaterialController>;
      expect(controllerInstance.builder(tester.element(find.byType(Scaffold)), tester.get.context, null).controller.materialsToAdd, isEmpty);
    });
  });
}