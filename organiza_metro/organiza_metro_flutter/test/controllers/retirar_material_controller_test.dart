import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart'; // Para RequisicaoItem
import 'package:organiza_metro_flutter/src/serverpod_client.dart'; // Para acessar o client global
import '../mock/mock_movimentacao_endpoint.dart'; 


class MockClient extends Mock implements Client {}

void main() {
  late RetirarMaterialController controller;
  late MockClient mockClient;
  late MockMovimentacaoEndpoint mockEndpoint;

  setUp(() {
    
    mockClient = MockClient();
    mockEndpoint = MockMovimentacaoEndpoint();
    
  
    client = mockClient; 
    
 
    when(mockClient.movimentacao).thenReturn(mockEndpoint);

  
    controller = RetirarMaterialController();
  });
  
  
  final mockItem = {
    'id': 101, 
    'descricao': 'Fusível Teste', 
    'quantidade': 5.0, 
    'isMaterial': true,
    'codigoSap': 15000001,
  };

  group('RetirarMaterialController Unit Tests', () {
    
    test('Inicialização e manipulação de materiais', () {
      expect(controller.materialsToAdd, isEmpty);
      
      controller.addMaterials([mockItem]);
      expect(controller.materialsToAdd, isNotEmpty);
      expect(controller.materialsToAdd.length, 1);
      
      controller.clearMaterials();
      expect(controller.materialsToAdd, isEmpty);
    });

    test('Update de Quantidade', () {
      controller.addMaterials([mockItem]);
      final itemId = mockItem['id'] as int;
      
      controller.updateItemQuantity(itemId, 15.0);
      expect(controller.materialsToAdd.first['quantidade'], 15.0);
      
      controller.updateItemQuantity(itemId, 0.0);
      expect(controller.materialsToAdd, isEmpty); 
    });

    test('Mapeamento para DTO (RequisicaoItem)', () async {
      controller.addMaterials([mockItem]);
      controller.formData.modalidadeEntrega = 'Balcão'; 
      controller.formData.origemBaseId = 1;


      await controller.submitRequest(MockBuildContext());
      
     
      final captured = verify(mockEndpoint.criarRequisicaoSaida(
        itens: captureAny, 
        modalidadeEntrega: anyNamed('modalidadeEntrega'),
        origemBaseId: anyNamed('origemBaseId')
      )).captured.first as List<RequisicaoItem>;
      
      expect(captured.length, 1);
      expect(captured.first.materialId, 101);
      expect(captured.first.quantidade, 5.0);
    });
    
    test('Submit falha se não houver materiais', () async {
      controller.formData.modalidadeEntrega = 'Balcão';
      final result = await controller.submitRequest(MockBuildContext());
      expect(result, isFalse);
    });
  });
}


class MockBuildContext extends Mock implements BuildContext {}