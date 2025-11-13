import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart' as cli;

enum RelatorioMode { dashboard, gerencial }

enum ItemType { material, ferramenta, geral }

enum RelatorioType {
  movimentacoes,
  consumo,
  instrumentosEmUso,
  calibracoesVencidas
}

enum BaseOrVeiculo { base, veiculo }

class RelatoriosController extends ChangeNotifier {
  RelatorioMode _mode = RelatorioMode.dashboard;
  ItemType _itemType = ItemType.material;
  RelatorioType _relatorioAtivo = RelatorioType.movimentacoes;
  bool _isLoading = false;

  RelatorioMode get mode => _mode;
  ItemType get itemType => _itemType;
  RelatorioType get relatorioAtivo => _relatorioAtivo;
  bool get isLoading => _isLoading;

  // Variáveis específicas para o BarChart
  List<cli.ConsumoMensal> _topConsumidos = [];
  int _barChartLimit = 5;
  int get barChartLimit => _barChartLimit;

  // Variáveis específicas para o PieChart
  List<cli.ConsumoMensal> _consumoPorBase = [];
  List<cli.ConsumoMensal> get consumoPorBase => _consumoPorBase;

  List<cli.ConsumoMensal> _consumoPorVeiculo = [];
  List<cli.ConsumoMensal> get consumoPorVeiculo => _consumoPorVeiculo;

  // Variaveis especificas para os DropDowns

  BaseOrVeiculo _baseOrVeiculo = BaseOrVeiculo.base;
  BaseOrVeiculo get baseOrVeiculo => _baseOrVeiculo;

  // Dados para Gráficos/Tabelas
  List<cli.Material> _materiaisEstoque = [];
  List<cli.Movimentacao> _movimentacoes = [];
  List<cli.Ferramenta> _ferramentasEstoque = [];

  List<cli.Material> get materiaisEstoque => _materiaisEstoque;
  List<cli.Movimentacao> get movimentacoes => _movimentacoes;
  List<cli.Ferramenta> get ferramentas => _ferramentasEstoque;
  List<cli.ConsumoMensal> get topConsumidos => _topConsumidos;


  RelatoriosController() {
    fetchData();
    fetchTopConsumoData();
    fetchConsumoPorBase();
  }

  void setMode(RelatorioMode newMode) {
    _mode = newMode;
    // Reset o tipo para o padrão do modo
    _itemType =
        newMode == RelatorioMode.dashboard ? ItemType.material : ItemType.geral;
    _relatorioAtivo = RelatorioType.movimentacoes;
    notifyListeners();
    fetchData();
  }

  void setItemType(ItemType newType) {
    _itemType = newType;
    notifyListeners();
    fetchData();
  }

  void setRelatorioAtivo(RelatorioType newType) {
    _relatorioAtivo = newType;
    notifyListeners();
    fetchData();
  }

  void setBarChartLimit(int limit){
    _barChartLimit = limit; 
    notifyListeners();
    fetchData(); 
  }

  void setPieChartType(BaseOrVeiculo newType){
    _baseOrVeiculo = newType; 
    notifyListeners();
    fetchData(); 
  }

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    // Simulação de busca de dados
    try {
      if (_mode == RelatorioMode.dashboard) {
        if (_itemType == ItemType.material) {
          // PBI 3.1.1
          _materiaisEstoque =
              (await client.material.getEstoque()).cast<cli.Material>();
          // TODO: MOCK/Buscar os 10 mais consumidos
        } else if (_itemType == ItemType.ferramenta) {
          // PBI 3.1.3 (Busca de ferramentas em geral para filtrar no front)
          // _ferramentas = await client.movimentacao.getFerramentasDisponiveis();
          // TODO: Mudar para endpoint que filtra calibração
        }
      } else {
        // RelatorioMode.gerencial
        // Seção Gerencial: Busca dados conforme o relatório ativo
        if (_relatorioAtivo == RelatorioType.movimentacoes) {
          // TODO: Buscar movimentações com filtros de data
          _movimentacoes = [];
        }
        if (_relatorioAtivo == RelatorioType.calibracoesVencidas) {
          // TODO: Buscar ferramentas com calibração vencida/próxima
          _ferramentasEstoque = [];
        }
      }
    } catch (e) {
      print('Erro ao buscar dados de relatórios: $e');
    }

    await Future.delayed(const Duration(milliseconds: 500)); // Simula loading
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchTopConsumoData() async {
    _isLoading = true;
    notifyListeners();

    try {
      // 🚨 Chamada usando o limite do Controller
      _topConsumidos = await client.relatorios.getTopConsumidos(barChartLimit);
    } catch (e) {
      print('Erro ao buscar Top Consumidos: $e');
    }

    await Future.delayed(const Duration(milliseconds: 500)); // Simula loading
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchConsumoPorBase() async {
    _isLoading = true;
    notifyListeners();

    try {
      // 🚨 Chamada usando o limite do Controller
      _consumoPorBase = await client.relatorios.getConsmuoClBase();
      // _consumoPorVeiculo = await client.relatorios.getConsmuoClVeiculo();
    } catch (e) {
      print('Erro ao buscar Top Consumidos: $e');
    }

    await Future.delayed(const Duration(milliseconds: 500)); // Simula loading
    _isLoading = false;
    notifyListeners();
  }

}
