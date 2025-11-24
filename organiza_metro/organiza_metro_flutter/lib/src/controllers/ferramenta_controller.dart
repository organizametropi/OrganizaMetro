import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

enum FerramentaMode { retirar, devolver }

class FerramentaController extends ChangeNotifier {
  FerramentaMode _mode = FerramentaMode.retirar;
  FerramentaMode get mode => _mode;

  // Status de carregamento
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Dados
  List<Ferramenta> _disponiveis = [];
  List<Ferramenta> get disponiveis => _disponiveis;

  List<Ferramenta> _empenhadas = [];
  List<Ferramenta> get empenhadas => _empenhadas;

  // Estado local para a ferramenta selecionada na lista de DEVOLUÇÃO
  Ferramenta? _selectedDevolucaoItem;
  Ferramenta? get selectedDevolucaoItem => _selectedDevolucaoItem;

  // -----------------------------------------------------------
  // AÇÕES DE ESTADO
  // -----------------------------------------------------------
  void setMode(FerramentaMode newMode) {
    _mode = newMode;
    notifyListeners();
    // Recarrega os dados ao mudar de modo
    fetchData();
  }

  void setSelectedDevolucaoItem(Ferramenta? item) {
    _selectedDevolucaoItem = item;
    notifyListeners();
  }

  // -----------------------------------------------------------
  // AÇÕES DE DADOS E API
  // -----------------------------------------------------------

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      if (_mode == FerramentaMode.retirar) {
        _disponiveis.clear();
        final data = await client.ferramenta.getDisponiveis();
        _disponiveis = data;
        _empenhadas.clear();
      } else {
        _empenhadas.clear();
        final data = await client.ferramenta.getMinhasFerramentas();
        _empenhadas = data;
        _disponiveis.clear();
        _selectedDevolucaoItem = null;
      }
    } catch (e) {
      print('Erro ao carregar dados de ferramentas: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // -----------------------------------------------------------
  // LÓGICA DE RETIRADA (Empenho)
  // -----------------------------------------------------------

  Future<bool> processarRetirada(BuildContext context, int ferramentaId, {DateTime? dataDevolucaoEsperada}) async {
    _isLoading = true;
    notifyListeners();

    // Simula o formato de RequisiçãoItem, embora o endpoint de Retirada de Ferramenta
    // deva ser um método próprio, vamos usar o criarRequisicaoSaida com um item.
    final item = RequisicaoItem(ferramentaId: ferramentaId, quantidade: 1.0);

    try {
      // 🚨 Chamada ao Endpoint de Saída (adaptado para apenas um item)
      final sucesso = await client.movimentacao.criarRequisicaoSaida(
          itens: [item],
          modalidadeEntrega: 'Balcão', // Retirada padrão
          observacao: 'Retirada individual rápida via app.',
          dataDaMovimentacao: DateTime.now(),
          dataDevolucao: dataDevolucaoEsperada,
          );

      if (sucesso) {
        fetchData(); // Recarrega a lista
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('✅ Ferramenta empenhada com sucesso!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('❌ Falha ao empenhar ferramenta.')));
      }
      return sucesso;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('❌ Erro: ${e.toString().replaceAll('Exception: ', '')}')));
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // -----------------------------------------------------------
  // LÓGICA DE DEVOLUÇÃO
  // -----------------------------------------------------------

  Future<bool> processarDevolucao(BuildContext context, int ferramentaId,
      int? destinoBaseId, int? destinoVeiculoId,
      {String? observacao}) async {
    _isLoading = true;
    notifyListeners();

    try {
      // 🚨 Chamada ao novo método de Devolução (envolvido em transação)
      final sucesso = await client.movimentacao.processarDevolucaoFerramenta(
        ferramentaId: ferramentaId,
        dataDaMovimentacao: DateTime.now(),
        destinoBaseId: destinoBaseId,
        destinoVeiculoId: destinoVeiculoId,
        observacao: observacao,
      );

      if (sucesso) {
        fetchData(); // Recarrega a lista
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('✅ Ferramenta devolvida com sucesso!')));
      }
      return sucesso;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              '❌ Erro na Devolução: ${e.toString().replaceAll('Exception: ', '')}')));
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    // Evita o memory leak
    super.dispose();
  }
}
