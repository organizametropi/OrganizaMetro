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
  // Variáveis para navegação da página
  RelatorioMode _mode = RelatorioMode.dashboard;
  ItemType _itemType = ItemType.material;
  RelatorioType _relatorioAtivo = RelatorioType.movimentacoes;
  bool _isLoading = false;
  RelatorioMode get mode => _mode;
  ItemType get itemType => _itemType;
  RelatorioType get relatorioAtivo => _relatorioAtivo;
  bool get isLoading => _isLoading;

  // Variáveis específicas para o BarChart
  List<cli.ConsumoMensal> _topConsumidosMaterial = [];
  List<cli.ConsumoMensal> _topConsumidosFerramenta = [];
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
  List<cli.Calibracao> _calibracoesVencidas = [];

  List<cli.Calibracao> get calibracoesVencidas => _calibracoesVencidas;
  List<cli.Material> get materiaisEstoque => _materiaisEstoque;
  List<cli.Movimentacao> get movimentacoes => _movimentacoes;
  List<cli.Ferramenta> get ferramentas => _ferramentasEstoque;
  List<cli.ConsumoMensal> get topConsumidosMaterial => _topConsumidosMaterial;
  List<cli.ConsumoMensal> get topConsumidosFerramenta =>
      _topConsumidosFerramenta;

  List<cli.ConsumoPeriodoDetalhado> _consumoPeriodoDetalhado = [];
  List<cli.ConsumoPeriodoDetalhado> get consumoPeriodoDetalhado =>
      _consumoPeriodoDetalhado;
  DateTime dataFiltroInicio = DateTime.now().subtract(const Duration(days: 30));
  DateTime dataFiltroFim = DateTime.now();
  Map<int, cli.LocalUserInfo> _localUsersMap = {};
  Map<int, cli.LocalUserInfo> get localUsersMap => _localUsersMap;

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
    fetchConsumoPorBase();
  }

  void setRelatorioAtivo(RelatorioType newType) {
    _relatorioAtivo = newType;
    notifyListeners();
    fetchData();
  }

  void setBarChartLimit(int limit) {
    _barChartLimit = limit;
    notifyListeners();
    fetchData();
  }

  void setPieChartType(BaseOrVeiculo newType) {
    _baseOrVeiculo = newType;
    notifyListeners();
    fetchData();
  }

  void setDataFiltroInicio(DateTime date) {
    dataFiltroInicio = date;
    fetchData();
  }

  void setDataFiltroFim(DateTime date) {
    dataFiltroFim = date;
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
          _materiaisEstoque = await client.admin.getTodosMateriais();
          // TODO: MOCK/Buscar os 10 mais consumidos
        } else if (_itemType == ItemType.ferramenta) {
          // PBI 3.1.3 (Busca de ferramentas em geral para filtrar no front)
          _ferramentasEstoque = await client.admin.getTodasFerramentas();
          // TODO: Mudar para endpoint que filtra calibração
        }
      } else {
        // RelatorioMode.gerencial
        // Seção Gerencial: Busca dados conforme o relatório ativo
        if (_relatorioAtivo == RelatorioType.movimentacoes) {
          // Buscar movimentações via endpoint
          _movimentacoes = await client.relatorios.getMovimentacoes();
        }
        if (_relatorioAtivo == RelatorioType.calibracoesVencidas) {
          // Buscar calibrações vencidas
          _calibracoesVencidas =
              await client.relatorios.getCalibracoesVencidas();
        }
        if (_relatorioAtivo == RelatorioType.instrumentosEmUso) {
          // Buscar instrumentos em uso (retorna Ferramenta com empenhadoPara incluído)
          _ferramentasEstoque = await client.relatorios.getInstrumentosEmUso();
          // Também trazemos as movimentações para compor o histórico por ferramenta
          _movimentacoes = await client.relatorios.getMovimentacoes();

          final Set<int> userIds = {};
          for (final f in _ferramentasEstoque) {
            if (f.empenhadoPara?.id != null) userIds.add(f.empenhadoPara!.id!);
          }
          for (final m in _movimentacoes) {
            if (m.usuario?.id != null) userIds.add(m.usuario!.id!);
          }
          final localUsers = await client.relatorios
              .getLocalUserInfosByUserIds(userIds.toList());

          final Map<int, cli.LocalUserInfo> localUsersMap = {
            for (var u in localUsers) u.userInfoId: u
          };

          _localUsersMap = localUsersMap;
        }
        if (_relatorioAtivo == RelatorioType.consumo) {
          // 🚨 Chamada ao novo endpoint
          _consumoPeriodoDetalhado =
              await client.relatorios.getConsumoDetalhadoPorPeriodo(
            dataInicio: dataFiltroInicio,
            dataFim: dataFiltroFim,
          );
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
      _topConsumidosMaterial =
          await client.relatorios.getTopConsumidosMaterial(barChartLimit);
      _topConsumidosFerramenta =
          await client.relatorios.getTopConsumidosFerramenta(barChartLimit);
    } catch (e) {
      print('Erro ao buscar Top Consumidos: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchConsumoPorBase() async {
    _isLoading = true;
    notifyListeners();
    try {
      if (_itemType == ItemType.material) {
        _consumoPorBase = await client.relatorios.getConsmuoMaterialClBase();
        _consumoPorVeiculo =
            await client.relatorios.getConsmuoMaterialClVeiculo();
      } else if (_itemType == ItemType.ferramenta) {
        _consumoPorBase = await client.relatorios.getConsmuoFerramentaClBase();
        _consumoPorVeiculo =
            await client.relatorios.getConsmuoFerramentaClVeiculo();
      }
    } catch (e) {
      print('Erro ao buscar Top Consumidos: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
