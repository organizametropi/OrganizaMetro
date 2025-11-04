// lib/src/controllers/retirar_material_controller.dart
import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

// 1. Dados da Requisição
class RetiradaFormData {
  late DateTime dataRequisicao;
  late DateTime dataDevolucao;
  String? centroCusto;
  String? centroLogistico;
  String? modalidadeEntrega; // Ex: 'Balcão', 'Veículo'
  String? justificativa;
  int? destinoBaseId;
  int? destinoVeiculoId;
}

// 2. Controlador principal com lógica de estado
class RetirarMaterialController extends ChangeNotifier {
  // Lista de materiais a serem incluídos na requisição (Estado reativo)
  List<Map<String, dynamic>> _materialsToAdd = [];
  List<Map<String, dynamic>> get materialsToAdd => _materialsToAdd;

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  // Dados do formulário (Para simplificar, podemos agrupar)
  RetiradaFormData formData = RetiradaFormData();

  // Lógica de Estado
  void addMaterials(List<Map<String, dynamic>> newMaterials) {
    _materialsToAdd.addAll(newMaterials);
    notifyListeners(); // Notifica os widgets para reconstruir (ex: a lista)
  }

  void updateItemQuantity(int itemId, double newQuantity) {
    final index = _materialsToAdd.indexWhere((item) => item['id'] == itemId);
    if (index != -1) {
      if (newQuantity > 0) {
        _materialsToAdd[index]['quantidade'] = newQuantity;
      } else {
        // Se a quantidade for zero ou negativa, removemos (opcional, mas limpa)
        _materialsToAdd.removeAt(index);
      }
      notifyListeners();
    }
  }

  // 🚨 NOVO: Remove um item específico
  void removeItem(int itemId) {
    _materialsToAdd.removeWhere((item) => item['id'] == itemId);
    notifyListeners();
  }

  void clearMaterials() {
    _materialsToAdd.clear();
    notifyListeners();
  }

  // Sinks/Atualizadores de Formulário (Lógica de BINDING)
  void updateDataRequisicao(DateTime? date) {
    formData.dataRequisicao = date!; // Talvevz quebre a lógica
  }

  void updateDataDevolucao(DateTime? date){
    formData.dataDevolucao = date!; 
  }

  void updateCentroCusto(String? value) {
    formData.centroCusto = value;
  }

  void updateCentroLogistico(String? value) {
    formData.centroLogistico = value;
  }

  void updateJustificativa(String? value) {
    formData.justificativa = value;
  }

  void updateModalidadeEntrega(String value) {
    formData.modalidadeEntrega = value;
    notifyListeners();
  }

  List<RequisicaoItem> _mapItemsToDto() {
    return _materialsToAdd.map((item) {
      // Assumimos que o map tem os campos 'id' (do material/ferramenta) e 'quantidade'

      print(item); 

      return RequisicaoItem(
        materialId: item['id'],
        ferramentaId: null,
        quantidade: (item['quantidade'] as double),
      );
    }).toList();
  }

  // Envio final dos dados
  Future<bool> submitRequest(BuildContext context) async {
    if (_materialsToAdd.isEmpty || formData.modalidadeEntrega == null) {
      // Exibe um alerta visual se o contexto estiver disponível
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Por favor, selecione os materiais e a modalidade de entrega.')),
      );
      return false;
    }

    _isSubmitting = true;
    notifyListeners();
    bool sucesso = false;

    try {
      final itensDto = _mapItemsToDto();
      print(itensDto);
    

      // 🚨 CHAMADA FINAL AO ENDPOINT
      sucesso = await client.movimentacao.criarRequisicaoSaida(
        itens: itensDto,
        modalidadeEntrega: formData.modalidadeEntrega!,
        observacao: formData.justificativa,
        dataDaMovimentacao: formData.dataRequisicao,

        // Destino
        destinoBaseId: formData.destinoBaseId,
        destinoVeiculoId: formData.destinoVeiculoId,
      );

      if (sucesso) {
        clearMaterials();
        // Mostrar sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Requisição enviada com sucesso!')),
        );
      } else {
        // Mostrar falha
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('❌ Falha no envio da requisição.')),
        );
      }
    } on Exception catch (e) {
      // Captura e exibe a exceção lançada pelo Serverpod (ex: Estoque Insuficiente)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                '❌ Erro de Negócio: ${e.toString().replaceAll('Exception: ', '')}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Erro inesperado: $e')),
      );
    } finally {
      _isSubmitting = false;
      notifyListeners();
      return sucesso;
    }
  }
}
