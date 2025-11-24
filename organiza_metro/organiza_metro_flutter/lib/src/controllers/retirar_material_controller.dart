import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart' as cli;
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

// 1. Dados da Requisição
class RetiradaFormData {
  late DateTime dataRequisicao;
  DateTime? dataDevolucao;
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

  // Bases / Veículos (para dropdowns)
  List<cli.Base> _bases = [];
  List<cli.Veiculo> _veiculos = [];
  String _centroTipo = 'Bases'; // 'Bases' ou 'Veiculos'
  int? _selectedCentroId;

  List<cli.Base> get bases => _bases;
  List<cli.Veiculo> get veiculos => _veiculos;
  String get centroTipo => _centroTipo;
  int? get selectedCentroId => _selectedCentroId;

  // Materiais disponíveis na localização selecionada (para o modal)
  List<cli.Material> _materiaisDisponiveis = [];
  List<cli.Material> get materiaisDisponiveis => _materiaisDisponiveis;

  Future<void> fetchBasesVeiculos() async {
    try {
      _bases = await client.admin.getBases();
      _veiculos = await client.admin.getVeiculos();
      notifyListeners();
    } catch (e) {
      debugPrint('Erro ao buscar bases/veiculos: $e');
    }
  }

  void setCentroTipo(String tipo) {
    _centroTipo = tipo;
    // reset selected centro when changing type
    _selectedCentroId = null;
    notifyListeners();
  }

  void setSelectedCentroId(int? id) {
    _selectedCentroId = id;
    // When a centro is selected, fetch the materials for that location
    fetchMateriaisByLocation();
    notifyListeners();
  }

  // Busca materiais disponíveis para a base/veículo selecionado
  Future<void> fetchMateriaisByLocation() async {
    try {
      _materiaisDisponiveis = [];
      notifyListeners();
      if (_centroTipo == 'Bases' && _selectedCentroId != null) {
        _materiaisDisponiveis = await client.material
            .getMateriaisByLocation(baseId: _selectedCentroId);
      } else if (_centroTipo == 'Veiculos' && _selectedCentroId != null) {
        _materiaisDisponiveis = await client.material
            .getMateriaisByLocation(veiculoId: _selectedCentroId);
      } else {
        _materiaisDisponiveis = await client.material.getEstoque();
      }
    } catch (e) {
      debugPrint('Erro ao buscar materiais por localização: $e');
    }
    notifyListeners();

    print('Centro id: $selectedCentroId');
    print('Centro tipo: $centroTipo');
  }

  void updateCentroLogisticoById(dynamic v) {
    // v can be String id or int
    if (v == null) return;
    int? parsed;
    if (v is String) {
      parsed = int.tryParse(v);
    } else if (v is int) {
      parsed = v;
    }
    if (parsed != null) {
      setSelectedCentroId(parsed);
    }
  }

  void updateItemQuantity(int itemId, double newQuantity) {
    final index = _materialsToAdd.indexWhere((item) => item['id'] == itemId);
    if (index != -1) {
      if (newQuantity > 0) {
        _materialsToAdd[index]['quantidade'] = newQuantity;
      } else {
        _materialsToAdd.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeItem(int itemId) {
    _materialsToAdd.removeWhere((item) => item['id'] == itemId);
    notifyListeners();
  }

  void clearMaterials() {
    _materialsToAdd.clear();
    notifyListeners();
  }


  void updateDataRequisicao(DateTime? date) {
    formData.dataRequisicao = date!; 
  }

  void updateDataDevolucao(DateTime? date) {
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

  List<cli.RequisicaoItem> _mapItemsToDto() {
    return _materialsToAdd.map((item) {

      return cli.RequisicaoItem(
        materialId: item['id'],
        ferramentaId: null,
        quantidade: (item['quantidade'] as double),
      );
    }).toList();
  }


  Future<bool> submitRequest(BuildContext context) async {
    if (_materialsToAdd.isEmpty || formData.modalidadeEntrega == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Por favor, selecione os materiais e a modalidade de entrega.', style: TextStyle(color: Colors.white),), backgroundColor: Colors.yellow,),
      );
      return false;
    }

    _isSubmitting = true;
    notifyListeners();
    bool sucesso = false;

    try {
      final itensDto = _mapItemsToDto();
      print(itensDto);

      
      sucesso = await client.movimentacao.criarRequisicaoSaida(
        itens: itensDto,
        modalidadeEntrega: formData.modalidadeEntrega!,
        observacao: formData.justificativa,
        dataDaMovimentacao: formData.dataRequisicao,
        dataDevolucao: formData.dataDevolucao,

        
        destinoBaseId: formData.destinoBaseId,
        destinoVeiculoId: formData.destinoVeiculoId,
      );

      if (sucesso) {
        clearMaterials();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Requisição enviada com sucesso!', style: TextStyle(color: Colors.white)),backgroundColor: Colors.green,),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Falha no envio da requisição.', style: TextStyle(color: Colors.white)), backgroundColor: Colors.red),
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
