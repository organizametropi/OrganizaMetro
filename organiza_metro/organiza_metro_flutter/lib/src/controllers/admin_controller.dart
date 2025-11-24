import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart' as cli;
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class AdminController extends ChangeNotifier {
    Future<String?> addEmployee({
      required String nome,
      required String email,
      required String senha,
      required String registro,
      required String telefone,
      required String area,
      required bool isAdmin,
    }) async {
      // Validação
      if (nome.isEmpty || email.isEmpty || senha.isEmpty || registro.isEmpty || telefone.isEmpty || area.isEmpty) {
        return 'Todos os campos são obrigatórios.';
      }
      try {
        final result = await client.admin.addEmployee(nome, email, senha, registro, telefone, area, isAdmin);
        if (result == null) return 'Falha ao criar funcionário.';
        return null;
      } catch (e) {
        return 'Erro: $e';
      }
    }

    Future<String?> addMaterial(Map<String, dynamic> row) async {
      // Validação
      if (row['codigoSap'] == null || row['descricao'] == null || row['unidadeMedidaId'] == null || row['tipoMaterialId'] == null) {
        return 'Campos obrigatórios ausentes para Material.';
      }
      try {
        final dto = MaterialEditDto(
          nome: row['nome'],
          codigoSap: row['codigoSap'],
          descricao: row['descricao'],
          quantidade: row['quantidade'],
          estoqueMinimo: row['estoqueMinimo'],
          unidadeMedidaId: row['unidadeMedidaId'],
          tipoMaterialId: row['tipoMaterialId'],
          baseId: row['baseId'],
          veiculoId: row['veiculoId'],
          id: 0, // Ignorado na criação
        );
        await client.admin.addMaterial(dto);
        return null;
      } catch (e) {
        return 'Erro: $e';
      }
    }

    Future<String?> addFerramenta(Map<String, dynamic> row) async {
      // Validação
      if (row['codigoSap'] == null || row['descricao'] == null || row['unidadeMedidaId'] == null || row['tipoMaterialId'] == null || row['divisao'] == null || row['status'] == null || row['dataAquisicao'] == null) {
        return 'Campos obrigatórios ausentes para Ferramenta.';
      }
      try {
        final dto = FerramentaEditDto(
          nome: row['nome'],
          codigoSap: row['codigoSap'],
          descricao: row['descricao'],
          patrimonio: row['patrimonio'],
          quantidade: row['quantidade'],
          divisao: row['divisao'],
          tipoMaterialId: row['tipoMaterialId'],
          status: row['status'],
          dataAquisicao: DateTime.tryParse(row['dataAquisicao']),
          unidadeMedidaId: row['unidadeMedidaId'],
          baseId: row['baseId'],
          veiculoId: row['veiculoId'],
          id: 0, // Ignorado na criação
        );
        await client.admin.addFerramenta(dto);
        return null;
      } catch (e) {
        return 'Erro: $e';
      }
    }
  // Dados principais
  List<cli.Material> _materiais = [];
  List<cli.Ferramenta> _ferramentas = [];
  // Ferramentas que possuem patrimônio (calibráveis)
  List<cli.Ferramenta> _ferramentasCalibraveis = [];
  List<cli.TipoMaterial> _tipos = [];
  List<cli.UnidadeMedida> _unidades = [];
  List<cli.Base> _bases = [];
  List<cli.Veiculo> _veiculos = [];
  // Calibrações ativas
  List<cli.Calibracao> _calibracoesAtivas = [];

  bool _isLoading = false;

  List<cli.Material> get materiais => _materiais;
  List<cli.Ferramenta> get ferramentas => _ferramentas;
  List<cli.Ferramenta> get ferramentasCalibraveis => _ferramentasCalibraveis;
  List<cli.TipoMaterial> get tipos => _tipos;
  List<cli.UnidadeMedida> get unidades => _unidades;
  List<cli.Base> get bases => _bases;
  List<cli.Veiculo> get veiculos => _veiculos;
  List<cli.Calibracao> get calibracoesAtivas => _calibracoesAtivas;
  bool get isLoading => _isLoading;
  

  Future<void> fetchAllData() async {
    _isLoading = true;
    notifyListeners();
    try {
      _materiais = await client.admin.getTodosMateriais();
      _ferramentas = await client.admin.getTodasFerramentas();
      _tipos = await client.admin.getTiposMateriais();
      _unidades = await client.admin.getUnidadesMedida();
      _bases = await client.admin.getBases();
      _veiculos = await client.admin.getVeiculos();
      try {
        _ferramentasCalibraveis = await client.admin.getFerramentasComPatrimonio();
      } catch (_) {}
      try {
        _calibracoesAtivas = await client.admin.getCalibracoesAtivas();
      } catch (_) {}
    } catch (e, st) {
      debugPrint('Erro ao buscar dados administrativos: $e\n$st');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchFerramentasPaginadas(int page, int perPage) async {
  final offset = (page - 1) * perPage;

  _ferramentas = await client.admin.getFerramentasPaginadas(offset, perPage);


  notifyListeners();
}

  Future<void> fetchCalibracoesData() async {
    _isLoading = true;
    notifyListeners();
    try {
      _ferramentasCalibraveis = await client.admin.getFerramentasComPatrimonio();
      _calibracoesAtivas = await client.admin.getCalibracoesAtivas();
    } catch (e) {
      debugPrint('Erro ao buscar dados de calibração: $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> addCalibracao({required int ferramentaId, required DateTime dataCalibracao, required DateTime validadeCalibracao, required String status}) async {
    try {
      await client.admin.addCalibracao(ferramentaId, dataCalibracao, validadeCalibracao, status);
      await fetchCalibracoesData();
      return true;
    } catch (e) {
      debugPrint('Erro ao adicionar calibração: $e');
      return false;
    }
  }

  Future<bool> removeCalibracao(int id) async {
    try {
      final ok = await client.admin.removeCalibracao(id);
      if (ok == true) await fetchCalibracoesData();
      return ok == true;
    } catch (e) {
      debugPrint('Erro ao remover calibração: $e');
      return false;
    }
  }

  Future<bool> updateMaterial(Map<String, dynamic> row) async {
    try {
      final update = MaterialEditDto(
        id: row['id'],
        nome: row['nome'],
        codigoSap: row['codigoSap'],
        descricao: row['descricao'],
        quantidade: row['quantidade'],
        estoqueMinimo: row['estoqueMinimo'],
        unidadeMedidaId: row['unidadeMedidaId'],
        tipoMaterialId: row['tipoMaterialId'],
        baseId: row['baseId'],
        veiculoId: row['veiculoId'],
      );
      print('>>> DTO enviado para API: ${update.toJson()}');
      return await client.admin.updateMaterial(update);
    } catch (e, st) {
      print('ERRO updateMaterial: $e\n$st');
      return false;
    }
  }

  Future<bool> deleteMaterial(int id) async {
    try {
      final result = await client.admin.deleteMaterial(id);
      return result;
    } catch (e) {
      print("Erro ao deletar material: $e");
      return false;
    }
  }

  
  Future<bool> updateFerramenta(Map<String, dynamic> row) async {
    try {
      final update = FerramentaEditDto(
        id: row['id'],
        nome: row['nome'],
        codigoSap: row['codigoSap'],
        descricao: row['descricao'],
        patrimonio: row['patrimonio'],
        divisao: row['divisao'],
        tipoMaterialId: row['tipoMaterialId'],
        status: row['status'],
        dataAquisicao: row['dataAquisicao'] != null
            ? DateTime.tryParse(row['dataAquisicao'])
            : null,
        unidadeMedidaId: row['unidadeMedidaId'],
        baseId: row['baseId'],
        veiculoId: row['veiculoId'],
      );
      return await client.admin.updateFerramenta(update);
    } catch (e, st) {
      print('ERRO updateFerramenta: $e\n$st');
      return false;
    }
  }

  Future<bool> deleteFerramenta(int id) async {
    try {
      final result = await client.admin.deleteFerramenta(id);
      return result;
    } catch (e) {
      print("Erro ao deletar ferramenta: $e");
      return false;
    }
  }

  // --- Employees helpers ---
  Future<List<cli.LocalUserInfo>> getAllEmployees() async {
    try {
      return await client.admin.getAllEmployees();
    } catch (e) {
      debugPrint('Erro getAllEmployees: $e');
      return [];
    }
  }

  Future<List<dynamic>> getAuthUsersByIds(List<int> ids) async {
    try {
      if (ids.isEmpty) return [];
      return await client.admin.getAuthUsersByIds(ids);
    } catch (e) {
      debugPrint('Erro getAuthUsersByIds: $e');
      return [];
    }
  }

  Future<bool> removeEmployeeLocal(int localUserInfoId) async {
    try {
      return await client.admin.removeEmployee(localUserInfoId);
    } catch (e) {
      debugPrint('Erro removeEmployee: $e');
      return false;
    }
  }

}
