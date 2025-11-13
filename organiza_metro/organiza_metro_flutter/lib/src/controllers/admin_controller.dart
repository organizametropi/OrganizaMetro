import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class AdminController extends ChangeNotifier {
  // Dados brutos das tabelas de edição
  List<Material> _materiais = [];
  List<Ferramenta> _ferramentas = [];
  bool _isLoading = false;

  List<Material> get materiais => _materiais;
  List<Ferramenta> get ferramentas => _ferramentas;
  bool get isLoading => _isLoading;

  // Variável para armazenar o estado dos Dropdowns da modal de adição
  String? selectedUnidade;
  String? selectedTipoMaterial;
  String? selectedToolType;
  
  // Controllers para o modal AddEmployee (Mantidos aqui para encapsulamento)
  final firstNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final registryController = TextEditingController();
  final areaController = TextEditingController();
  final passwordController = TextEditingController();

  // MOCK: Opções de Dropdown
  final List<String> unidadeOptions = ['UN', 'CJ', 'KG', 'L'];
  final List<String> tipoMaterialOptions = ['Consumo', 'Giro'];
  final List<String> toolTypeOptions = ['Instrumento', 'Ferramenta'];

  // -----------------------------------------------------------
  // LÓGICA DE ADMINISTRAÇÃO DE DADOS
  // -----------------------------------------------------------

  Future<void> fetchAllData() async {
    _isLoading = true;
    notifyListeners();
    try {
      // 🚨 TODO: Chamar Endpoints de Listagem Admin (A serem criados)
      // _materiais = await client.admin.getTodosMateriais();
      // _ferramentas = await client.admin.getTodasFerramentas();

      // MOCK DATA SIMULATION
      _materiais = [
        Material(id: 1, codigoSap: 1500001, descricao: 'Fusivel 10A', quantidade: 50, estoqueMinimo: 10, unidadeMedidaId: 1),
        Material(id: 2, codigoSap: 1500002, descricao: 'Fita Isolante', quantidade: 120, estoqueMinimo: 50, unidadeMedidaId: 1),
      ];
      _ferramentas = [
        Ferramenta(id: 10, codigoSap: 1600001, descricao: 'Multimetro P-100', patrimonio: 'PAT101', emUso: false, divisao: 'Instrumento', status: 'Disponível', unidadeMedidaId: 1, dataAquisicao: DateTime.now()),
        Ferramenta(id: 11, codigoSap: 1700001, descricao: 'Alicate Universal', patrimonio: 'PAT102', emUso: true, divisao: 'Ferramenta Manual', status: 'Empenhada', unidadeMedidaId: 1, dataAquisicao: DateTime.now()),
      ];
    } catch (e) {
      print('Erro ao buscar dados de edição: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 🚨 LÓGICA DE EDIÇÃO: Simula a atualização do modelo no Serverpod
  Future<bool> updateMaterial(Map<String, dynamic> updatedRow) async {
    // 1. Mapear o Map de volta para o objeto Material
    // 2. Chamar o client.admin.updateMaterial(novoMaterial)
    print('ATUALIZANDO MATERIAL ID ${updatedRow["id"]}: ${updatedRow["descricao"]}');
    
    // TODO: Implementar chamada real de update
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Atualizar a lista localmente para refletir a mudança
    final index = _materiais.indexWhere((m) => m.id == updatedRow['id']);
    if (index != -1) {
        _materiais[index].descricao = updatedRow['descricao'];
        _materiais[index].quantidade = updatedRow['quantidade'];
        notifyListeners();
    }
    return true; // Simular sucesso
  }
  
  Future<bool> updateFerramenta(Map<String, dynamic> updatedRow) async {
    print('ATUALIZANDO FERRAMENTA ID ${updatedRow["id"]}: ${updatedRow["patrimonio"]}');
    // TODO: Implementar chamada real de update
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Atualizar a lista localmente
    final index = _ferramentas.indexWhere((f) => f.id == updatedRow['id']);
    if (index != -1) {
        _ferramentas[index].patrimonio = updatedRow['patrimonio'];
        _ferramentas[index].status = updatedRow['status'];
        notifyListeners();
    }
    return true;
  }
  
  // Opcional: Para manter os controllers limpos e na memória do Controller
  @override
  void dispose() {
    firstNameController.dispose();
    // ...
    super.dispose();
  }
}