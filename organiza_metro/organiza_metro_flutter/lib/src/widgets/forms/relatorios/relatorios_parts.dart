import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart' as cli;
import 'package:organiza_metro_flutter/src/controllers/relatorios_controller.dart';
import 'package:organiza_metro_flutter/src/widgets/charts/bar_chart.dart';
import 'package:organiza_metro_flutter/src/widgets/charts/line_chart.dart';
import 'package:organiza_metro_flutter/src/widgets/charts/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/responsive_table.dart';

const Map<RelatorioType, String> relatorioLabels = {
  RelatorioType.movimentacoes: 'Movimentações',
  RelatorioType.consumo: 'Consumo por Período',
  RelatorioType.instrumentosEmUso: 'Instrumentos em Uso',
  RelatorioType.calibracoesVencidas: 'Calibrações Vencidas',
};


class MainSelector extends StatelessWidget {
  final RelatoriosController controller;
  const MainSelector({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 20, 137, 1), width: 2.0)),
      ),
      child: SegmentedButton<RelatorioMode>(
        segments: [
          ButtonSegment(
              value: RelatorioMode.dashboard,
              label: Text('Dashboard (Tempo Real)')),
          ButtonSegment(
              value: RelatorioMode.gerencial,
              label: Text('Relatórios Gerenciais')),
        ],
        selected: {controller.mode},
        onSelectionChanged: (newSelection) =>
            controller.setMode(newSelection.first),
      ),
    );
  }
}

class SubSelector extends StatelessWidget {
  final RelatoriosController controller;
  const SubSelector({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.mode == RelatorioMode.dashboard) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SegmentedButton<ItemType>(
              segments: const [
                ButtonSegment(
                  value: ItemType.material,
                  icon: Icon(Icons.inventory_2_outlined),
                  label: Text('Materiais'),
                ),
                ButtonSegment(
                  value: ItemType.ferramenta,
                  icon: Icon(Icons.handyman_outlined),
                  label: Text('Ferramentas'),
                ),
              ],
              selected: {controller.itemType},
              onSelectionChanged: (newSelection) =>
                  controller.setItemType(newSelection.first),
            ),
          ),
        ],
      );
    }


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SegmentedButton<RelatorioType>(
        segments: relatorioLabels.entries
            .map((entry) => ButtonSegment<RelatorioType>(
                value: entry.key,
                label: Text(entry.value, textAlign: TextAlign.center)))
            .toList(),
        selected: {controller.relatorioAtivo},
        onSelectionChanged: (newSelection) =>
            controller.setRelatorioAtivo(newSelection.first),
        style:
            SegmentedButton.styleFrom(selectedBackgroundColor: Colors.black12),
      ),
    );
  }
}


class DashboardView extends StatelessWidget {
  final RelatoriosController controller;
  const DashboardView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 900;

        if (controller.itemType == ItemType.material) {
          return isWide
              ? _WideMaterialDashboard(controller: controller)
              : _NarrowMaterialDashboard(controller: controller);
        }

        if (controller.itemType == ItemType.ferramenta) {
          return isWide
              ? _WideFerramentaDashboard(
                  controller: controller,
                )
              : _NarrowFerramentalDashboard(
                  controller: controller,
                );
        }

        return const SizedBox.shrink();
      },
    );
  }
}



class _WideMaterialDashboard extends StatelessWidget {
  final RelatoriosController controller;
  const _WideMaterialDashboard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 4,
          fit: FlexFit.loose,
          child: Column(
            children: [
              _barReportCard(
                height: 420,
                controller: controller,
                child: const Center(child: ConsumoBarChart()),
              ),
              const SizedBox(height: 20),
              _pieReportCard(
                height: 450,
                controller: controller,
                child: const Center(child: ConsumoPieChart()),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),


        Flexible(
          flex: 6,
          fit: FlexFit.loose,
          child: _ReportCard(
            title: 'Inventário Consolidado',
            height: 1050,
            child: EstoqueMaterialTable(
                materiais: controller.materiaisEstoque), 
          ),
        ),
      ],
    );
  }
}

class _NarrowFerramentalDashboard extends StatelessWidget {
  final RelatoriosController controller;
  const _NarrowFerramentalDashboard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _barReportCard(
          height: 420,
          controller: controller,
          child: const Center(child: ConsumoBarChart()),
        ),
        const SizedBox(height: 20),
        _pieReportCard(
          height: 450,
          controller: controller,
          child: const Center(child: ConsumoPieChart()),
        ),
        const SizedBox(height: 20),
        _ReportCard(
          title: 'Inventário Consolidado',
          height: 450,
          child: EstoqueMaterialTable(materiais: controller.materiaisEstoque),
        ),
      ],
    );
  }
}

class _WideFerramentaDashboard extends StatelessWidget {
  final RelatoriosController controller;
  const _WideFerramentaDashboard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 4,
          fit: FlexFit.loose,
          child: Column(
            children: [
              _barReportCard(
                height: 420,
                controller: controller,
                child: const Center(child: ConsumoBarChart()),
              ),
              const SizedBox(height: 20),
              _pieReportCard(
                height: 450,
                controller: controller,
                child: const Center(child: ConsumoPieChart()),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),


        Flexible(
          flex: 6,
          fit: FlexFit.loose,
          child: _ReportCard(
            title: 'Inventário Consolidado',
            height: 1050,
            child: EstoqueFerramentaTable(
                ferramenta: controller.ferramentas), // 🚨 Sua Tabela
          ),
        ),
      ],
    );
  }
}

class _NarrowMaterialDashboard extends StatelessWidget {
  final RelatoriosController controller;
  const _NarrowMaterialDashboard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _barReportCard(
          height: 420,
          controller: controller,
          child: const Center(child: ConsumoBarChart()),
        ),
        const SizedBox(height: 20),
        _pieReportCard(
          height: 450,
          controller: controller,
          child: const Center(child: ConsumoPieChart()),
        ),
        const SizedBox(height: 20),
        _ReportCard(
          title: 'Inventário Consolidado',
          height: 450,
          child: EstoqueMaterialTable(materiais: controller.materiaisEstoque),
        ),
      ],
    );
  }
}


class RelatorioGerencialView extends StatelessWidget {
  final RelatoriosController controller;
  const RelatorioGerencialView({required this.controller});

  Widget _buildDateFilter(
      BuildContext context, RelatoriosController controller, bool isInicio) {
    DateTime initialDate =
        isInicio ? controller.dataFiltroInicio : controller.dataFiltroFim;

    return Flexible(
      child: Container(
        width: 180, 
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          readOnly: true,
          controller: TextEditingController(
              text: DateFormat('dd/MM/yyyy').format(initialDate)),
          decoration: InputDecoration(
            labelText: isInicio ? 'Data Início' : 'Data Fim',
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today, size: 18),
          ),
          onTap: () async {
            final newDate = await showDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: DateTime(2023),
              lastDate: DateTime.now(),
            );
            if (newDate != null) {
              isInicio
                  ? controller.setDataFiltroInicio(newDate)
                  : controller.setDataFiltroFim(newDate);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final isConsumoReport = controller.relatorioAtivo == RelatorioType.consumo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        if (isConsumoReport)
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: [
                _buildDateFilter(context, controller, true), // Data Início
                const SizedBox(width: 10),
                _buildDateFilter(context, controller, false), // Data Fim
              ],
            ),
          ),

        _ReportCard(
          title: relatorioLabels[controller.relatorioAtivo]!,
          height: 600, 
          child: RelatorioDetalheWidget(
            relatorioType: controller.relatorioAtivo,
            dados: controller.relatorioAtivo == RelatorioType.consumo
                ? controller.consumoPeriodoDetalhado
                : controller.relatorioAtivo == RelatorioType.instrumentosEmUso
                    ? controller.ferramentas
                    : controller.relatorioAtivo ==
                            RelatorioType.calibracoesVencidas
                        ? controller.calibracoesVencidas
                        : controller.movimentacoes,
            controller: controller,
          ),
        ),
      ],
    );
  }
}


class DropdownPie extends StatefulWidget {
  final RelatoriosController controller;

  DropdownPie({super.key, required this.controller});

  @override
  State<DropdownPie> createState() => _DropdownPie();
}

class _DropdownPie extends State<DropdownPie> {
  List<DropdownMenuItem<BaseOrVeiculo>> _dropdownItems = [
    const DropdownMenuItem(value: BaseOrVeiculo.base, child: Text('Bases')),
    const DropdownMenuItem(
        value: BaseOrVeiculo.veiculo, child: Text('Veículos')),
  ];

  @override
  Widget build(BuildContext context) {
    final currentSelection = widget.controller.baseOrVeiculo;

    return SizedBox(
      height: 60,
      width: 200,
      child: DropdownButtonFormField<BaseOrVeiculo>(
        value: currentSelection,
        items: _dropdownItems,
        onChanged: (BaseOrVeiculo? newValue) {
          if (newValue != null) {
            widget.controller.setPieChartType(newValue);
          }
        },
        decoration: const InputDecoration(
          labelText: "Centro Logístico",
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0)),
        ),
      ),
    );
  }
}

class DropdownBar extends StatefulWidget {
  final RelatoriosController controller;

  DropdownBar({super.key, required this.controller});

  @override
  State<DropdownBar> createState() => _DropdownBar();
}

class _DropdownBar extends State<DropdownBar> {
  final List<DropdownMenuItem<int>> _dropdownItems = [
    const DropdownMenuItem(value: 5, child: Text('5')),
    const DropdownMenuItem(value: 10, child: Text('10')),
    const DropdownMenuItem(value: 15, child: Text('15')),
    const DropdownMenuItem(value: 20, child: Text('20')),
    const DropdownMenuItem(value: 30, child: Text('30')),
  ];

  @override
  Widget build(BuildContext context) {
    final currentSelection = widget.controller.barChartLimit;

    return SizedBox(
      height: 60,
      width: 200,
      child: DropdownButtonFormField<int>(
        value: currentSelection,
        items: _dropdownItems,
        onChanged: (int? newValue) {
          if (newValue != null) {
            widget.controller.setBarChartLimit(newValue);
          }
        },
        decoration: const InputDecoration(
          labelText: "Limite de busca",
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0)),
        ),
      ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  final String title;
  final Widget child;
  final double height;

  const _ReportCard({
    required this.title,
    required this.child,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Container(
              height: height - 40, 
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class _pieReportCard extends StatelessWidget {
  final Widget child;
  final double height;
  final RelatoriosController controller;

  const _pieReportCard({
    required this.child,
    required this.controller,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Consumo por Centro Logístico',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(children: [
              DropdownPie(controller: controller),
            ]),
            SizedBox(height: 10),
            SizedBox(
              height: height - 40, 
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class _barReportCard extends StatelessWidget {
  final Widget child;
  final double height;
  final RelatoriosController controller;

  const _barReportCard({
    required this.child,
    required this.controller,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Materiais Consumidos',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 15),
            Row(children: [
              DropdownBar(controller: controller),
            ]),
            SizedBox(height: 30),
            SizedBox(
              height: height - 40, 
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class RelatorioDetalheWidget extends StatelessWidget {
  final RelatorioType relatorioType;
  final List<dynamic> dados;
  final RelatoriosController controller;

  const RelatorioDetalheWidget(
      {required this.relatorioType,
      required this.dados,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    if ((dados.isEmpty) && relatorioType != RelatorioType.instrumentosEmUso) {
      return const Center(
          child: Text(
              "Nenhum dado encontrado."));
    }

    return switch (relatorioType.name) {
      'movimentacoes' =>
        MovimentacoesTable(movimentacoes: dados.cast<cli.Movimentacao>()),
      'consumo' => ConsumoLineChart(),
      'instrumentosEmUso' => InstrumentosEmUsoTable(
          ferramentas: controller.ferramentas,
          movimentacoes: controller.movimentacoes,
          localUsersMap: controller.localUsersMap),
      'calibracoesVencidas' =>
        CalibracoesTable(calibracoes: dados.cast<cli.Calibracao>()),
      _ => SizedBox.shrink()
    };
  }
}


class EstoqueMaterialTable extends StatefulWidget {
  final List<cli.Material>
      materiais; 
  const EstoqueMaterialTable({super.key, required this.materiais});

  @override
  State<EstoqueMaterialTable> createState() => _EstoqueMaterialTableState();
}

class _EstoqueMaterialTableState extends State<EstoqueMaterialTable> {
  late List<DatatableHeader> _headers;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  List<bool>? _expanded;
  String? _sortColumn;
  bool _sortAscending = true;
  int? _currentPerPage = 20;
  int _currentPage = 1;
  String? _searchKey = "codigoSap";
  int _total = 0;
  bool _isLoadingLocal = false;
  List<int> _perPages = [10, 20, 50, 100];

  @override
  void initState() {
    super.initState();
    _headers = [
      DatatableHeader(
          text: "CÓD. SAP", value: "codigoSap", show: true, flex: 1),
      DatatableHeader(
          text: "NOME", value: "nome", show: true, editable: true, flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO",
          value: "descricao",
          show: true,
          flex: 3,
          sortable: true,
          sourceBuilder: (value, row) {
            return Expanded(
              child: Text(
                value ?? '',
                maxLines: 20,
                softWrap: true,
              ),
            );
          }),
      DatatableHeader(text: "QTD", value: "quantidade", show: true),
      DatatableHeader(text: "MÍN", value: "estoqueMinimo", show: true),
      DatatableHeader(text: "UNIDADE", value: "unidadeMedida", show: true),
      DatatableHeader(text: "TIPO", value: "tipo", show: true, flex: 2),
      DatatableHeader(text: "BASE", value: "base", show: true, flex: 2),
      DatatableHeader(text: "VEÍCULO", value: "veiculo", show: true, flex: 2),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller =
        Provider.of<RelatoriosController>(context, listen: false);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData(controller);
    });
  }

  Future<void> _initData(RelatoriosController controller) async {
    setState(() => _isLoadingLocal = true);
    try {
      if (widget.materiais.isEmpty) {
        await controller.fetchData();
      }
      _source = _convertMateriasToMap(controller.materiaisEstoque);

      _sourceOriginal.clear();
      _sourceOriginal
          .addAll(_convertMateriasToMap(controller.materiaisEstoque));

      _sourceFiltered = _sourceOriginal;
      _total = _sourceOriginal.length;

      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      debugPrint('Erro ao inicializar dados do modal: $e');
    } finally {
      setState(() => _isLoadingLocal = false);
    }
  }

  List<Map<String, dynamic>> _convertMateriasToMap(List materiais) {
    return materiais.map<Map<String, dynamic>>((m) {
      return {
        'nome': m.nome ?? '',
        "codigoSap": m.codigoSap,
        "descricao": m.descricao,
        "quantidade": m.quantidade ?? 0,
        "estoqueMinimo": m.estoqueMinimo ?? 0,
        "unidadeMedida": m.unidadeMedida?.codigo ?? "-",
        "tipo": m.tipo?.nome ?? "-",
        "base": m.base?.nome ?? "-",
        "veiculo": m.veiculo?.descricao ?? "-",
      };
    }).toList();
  }

  _resetData({start = 0}) async {
    setState(() => _isLoadingLocal = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoadingLocal = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoadingLocal
        ? SizedBox(
            height: 700,
            child: const Center(
                child: CircularProgressIndicator(color: Colors.blueGrey)))
        : LayoutBuilder(builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final bool isLargeScreen = screenWidth > 800;

            if (isLargeScreen) {
              final double baseColWidth = 120.0;
              final visibleHeaders =
                  _headers.where((h) => h.show == true).toList();
              final double checkboxWidth = 60.0;
              final double minWidth = visibleHeaders.fold<double>(
                      0.0,
                      (sum, h) =>
                          sum + ((h.flex <= 0 ? 1 : h.flex) * baseColWidth)) +
                  checkboxWidth;

              final maxTableHeight = MediaQuery.of(context).size.height;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: minWidth,
                  ),
                  child: SizedBox(
                    width: minWidth,
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: maxTableHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 12),
                            child: ResponsiveDatatable(
                              headers: _headers,
                              source: _source,
                              selecteds: _selecteds,
                              showSelect: false,
                              autoHeight: false,
                              onChangedRow: (value, header) {},
                              onSubmittedRow: (value, header) {},
                              onTabRow: (data) {},
                              onSort: (value) {
                                setState(() => _isLoadingLocal = true);

                                setState(() {
                                  _sortColumn = value;
                                  _sortAscending = !_sortAscending;
                                  if (_sortAscending) {
                                    _sourceFiltered.sort((a, b) =>
                                        b["$_sortColumn"]
                                            .compareTo(a["$_sortColumn"]));
                                  } else {
                                    _sourceFiltered.sort((a, b) =>
                                        a["$_sortColumn"]
                                            .compareTo(b["$_sortColumn"]));
                                  }
                                  var _rangeTop =
                                      _currentPerPage! < _sourceFiltered.length
                                          ? _currentPage!
                                          : _sourceFiltered.length;
                                  _source = _sourceFiltered
                                      .getRange(0, _rangeTop)
                                      .toList();
                                  _searchKey = value;

                                  _isLoadingLocal = false;
                                });
                              },
                              expanded: _expanded,
                              sortAscending: _sortAscending,
                              sortColumn: _sortColumn,
                              isLoading: _isLoadingLocal,
                              onSelect: (value, item) {
                                if (value!) {
                                  setState(() => _selecteds = _source
                                      .map((entry) => entry)
                                      .toList()
                                      .cast());
                                } else {
                                  setState(() => _selecteds.clear());
                                }
                              },
                              footers: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text("Rows per page"),
                                ),
                                if (_perPages.isNotEmpty)
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: DropdownButton<int>(
                                      value: _currentPerPage,
                                      items: _perPages
                                          .map((e) => DropdownMenuItem<int>(
                                                value: e,
                                                child: Text("$e"),
                                              ))
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _currentPerPage = value;
                                          _currentPage = 1;
                                          _resetData();
                                        });
                                      },
                                      isExpanded: false,
                                    ),
                                  ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                      "$_currentPage - $_currentPerPage of $_total"),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 16,
                                  ),
                                  onPressed: _currentPage == 1
                                      ? null
                                      : () {
                                          var _nextSet =
                                              _currentPage - _currentPerPage!;
                                          setState(() {
                                            _currentPage =
                                                _nextSet > 1 ? _nextSet : 1;
                                            _resetData(start: _currentPage - 1);
                                          });
                                        },
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_forward_ios, size: 16),
                                  onPressed: _currentPage +
                                              _currentPerPage! -
                                              1 >
                                          _total
                                      ? null
                                      : () {
                                          var _nextSet =
                                              _currentPage + _currentPerPage!;

                                          setState(() {
                                            _currentPage = _nextSet < _total
                                                ? _nextSet
                                                : _total - _currentPerPage!;
                                            _resetData(start: _nextSet - 1);
                                          });
                                        },
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ResponsiveDatatable(
                    headers: _headers,
                    source: _source,
                    autoHeight: true,
                    showSelect: true,
                    isLoading: _isLoadingLocal,
                    selecteds: _selecteds,
                    expanded: _expanded,
                    onSort: (value) {
                      setState(() => _isLoadingLocal = true);

                      setState(() {
                        _sortColumn = value;
                        _sortAscending = !_sortAscending;
                        if (_sortAscending) {
                          _sourceFiltered.sort((a, b) =>
                              b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                        } else {
                          _sourceFiltered.sort((a, b) =>
                              a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                        }
                        var _rangeTop =
                            _currentPerPage! < _sourceFiltered.length
                                ? _currentPage!
                                : _sourceFiltered.length;
                        _source =
                            _sourceFiltered.getRange(0, _rangeTop).toList();

                        _isLoadingLocal = false;
                      });
                    },
                    footers: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Total: ${_source.length} registros'),
                      ),
                    ],
                  ),
                ),
              );
            }
          });
  }
}

class EstoqueFerramentaTable extends StatefulWidget {
  final List<cli.Ferramenta>
      ferramenta; 
  const EstoqueFerramentaTable({super.key, required this.ferramenta});

  @override
  _EstoqueFerramentaTableState createState() => _EstoqueFerramentaTableState();
}

class _EstoqueFerramentaTableState extends State<EstoqueFerramentaTable> {
  late List<DatatableHeader> _headers;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  List<bool>? _expanded;
  String? _sortColumn;
  bool _sortAscending = true;
  int? _currentPerPage = 20;
  int _currentPage = 1;
  String? _searchKey = "codigoSap";
  int _total = 0;
  bool _isLoadingLocal = false;
  List<int> _perPages = [10, 20, 50, 100];

  @override
  void initState() {
    super.initState();
    _headers = [
      DatatableHeader(
          text: "CÓD. SAP", value: "codigoSap", show: true, flex: 1),
      DatatableHeader(
          text: "NOME", value: "nome", show: true, editable: true, flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO", value: "descricao", show: true, flex: 2),
      DatatableHeader(text: "PATRIMÔNIO", value: "patrimonio", show: true),
      DatatableHeader(text: "DIVISÃO", value: "divisao", show: true),
      DatatableHeader(text: "TIPO", value: "tipo", show: true, flex: 2),
      DatatableHeader(text: "STATUS", value: "status", show: true),
      DatatableHeader(
          text: "AQUISIÇÃO", value: "dataAquisicao", show: true, flex: 2),
      DatatableHeader(text: "BASE", value: "base", show: true),
      DatatableHeader(text: "VEÍCULO", value: "veiculo", show: true),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller =
        Provider.of<RelatoriosController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData(controller);
    });
  }

  Future<void> _initData(RelatoriosController controller) async {
    setState(() => _isLoadingLocal = true);
    try {
      if (widget.ferramenta.isEmpty) {
        await controller.fetchData();
      }
      _source = _convertFerramentasToMap(controller.ferramentas);

      _sourceOriginal.clear();
      _sourceOriginal.addAll(_convertFerramentasToMap(controller.ferramentas));

      _sourceFiltered = _sourceOriginal;
      _total = _sourceOriginal.length;

      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      debugPrint('Erro ao inicializar dados do modal: $e');
    } finally {
      setState(() => _isLoadingLocal = false);
    }
  }

  List<Map<String, dynamic>> _convertFerramentasToMap(List ferramentas) {
    return ferramentas.map<Map<String, dynamic>>((f) {
      return {
        'nome': f.nome ?? '',
        "codigoSap": f.codigoSap,
        "descricao": f.descricao,
        "patrimonio": f.patrimonio ?? '-',
        "divisao": f.divisao,
        "tipo": f.tipo?.nome ?? "-",
        "status": f.status,
        "dataAquisicao": DateFormat('dd/MM/yyyy').format(f.dataAquisicao),
        "base": f.base?.nome ?? "-",
        "veiculo": f.veiculo?.descricao ?? "-",
      };
    }).toList();
  }

  _resetData({start = 0}) async {
    setState(() => _isLoadingLocal = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoadingLocal = false);
    });
  }

 @override
  Widget build(BuildContext context) {
    return _isLoadingLocal
        ? SizedBox(
            height: 700,
            child: const Center(
                child: CircularProgressIndicator(color: Colors.blueGrey)))
        : LayoutBuilder(builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final bool isLargeScreen = screenWidth > 800;

            if (isLargeScreen) {
              final double baseColWidth = 120.0;
              final visibleHeaders =
                  _headers.where((h) => h.show == true).toList();
              final double checkboxWidth = 60.0;
              final double minWidth = visibleHeaders.fold<double>(
                      0.0,
                      (sum, h) =>
                          sum + ((h.flex <= 0 ? 1 : h.flex) * baseColWidth)) +
                  checkboxWidth;

              final maxTableHeight = MediaQuery.of(context).size.height;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: minWidth,
                  ),
                  child: SizedBox(
                    width: minWidth,
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: maxTableHeight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DefaultTextStyle(
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 12),
                            child: ResponsiveDatatable(
                              headers: _headers,
                              source: _source,
                              selecteds: _selecteds,
                              showSelect: false,
                              autoHeight: false,
                              onChangedRow: (value, header) {},
                              onSubmittedRow: (value, header) {},
                              onTabRow: (data) {},
                              onSort: (value) {
                                setState(() => _isLoadingLocal = true);

                                setState(() {
                                  _sortColumn = value;
                                  _sortAscending = !_sortAscending;
                                  if (_sortAscending) {
                                    _sourceFiltered.sort((a, b) =>
                                        b["$_sortColumn"]
                                            .compareTo(a["$_sortColumn"]));
                                  } else {
                                    _sourceFiltered.sort((a, b) =>
                                        a["$_sortColumn"]
                                            .compareTo(b["$_sortColumn"]));
                                  }
                                  var _rangeTop =
                                      _currentPerPage! < _sourceFiltered.length
                                          ? _currentPage!
                                          : _sourceFiltered.length;
                                  _source = _sourceFiltered
                                      .getRange(0, _rangeTop)
                                      .toList();
                                  _searchKey = value;

                                  _isLoadingLocal = false;
                                });
                              },
                              expanded: _expanded,
                              sortAscending: _sortAscending,
                              sortColumn: _sortColumn,
                              isLoading: _isLoadingLocal,
                              onSelect: (value, item) {
                                if (value!) {
                                  setState(() => _selecteds = _source
                                      .map((entry) => entry)
                                      .toList()
                                      .cast());
                                } else {
                                  setState(() => _selecteds.clear());
                                }
                              },
                              footers: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text("Rows per page"),
                                ),
                                if (_perPages.isNotEmpty)
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: DropdownButton<int>(
                                      value: _currentPerPage,
                                      items: _perPages
                                          .map((e) => DropdownMenuItem<int>(
                                                value: e,
                                                child: Text("$e"),
                                              ))
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _currentPerPage = value;
                                          _currentPage = 1;
                                          _resetData();
                                        });
                                      },
                                      isExpanded: false,
                                    ),
                                  ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Text(
                                      "$_currentPage - $_currentPerPage of $_total"),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 16,
                                  ),
                                  onPressed: _currentPage == 1
                                      ? null
                                      : () {
                                          var _nextSet =
                                              _currentPage - _currentPerPage!;
                                          setState(() {
                                            _currentPage =
                                                _nextSet > 1 ? _nextSet : 1;
                                            _resetData(start: _currentPage - 1);
                                          });
                                        },
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_forward_ios, size: 16),
                                  onPressed: _currentPage +
                                              _currentPerPage! -
                                              1 >
                                          _total
                                      ? null
                                      : () {
                                          var _nextSet =
                                              _currentPage + _currentPerPage!;

                                          setState(() {
                                            _currentPage = _nextSet < _total
                                                ? _nextSet
                                                : _total - _currentPerPage!;
                                            _resetData(start: _nextSet - 1);
                                          });
                                        },
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ResponsiveDatatable(
                    headers: _headers,
                    source: _source,
                    autoHeight: true,
                    showSelect: true,
                    isLoading: _isLoadingLocal,
                    selecteds: _selecteds,
                    expanded: _expanded,
                    onSort: (value) {
                      setState(() => _isLoadingLocal = true);

                      setState(() {
                        _sortColumn = value;
                        _sortAscending = !_sortAscending;
                        if (_sortAscending) {
                          _sourceFiltered.sort((a, b) =>
                              b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                        } else {
                          _sourceFiltered.sort((a, b) =>
                              a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                        }
                        var _rangeTop =
                            _currentPerPage! < _sourceFiltered.length
                                ? _currentPage!
                                : _sourceFiltered.length;
                        _source =
                            _sourceFiltered.getRange(0, _rangeTop).toList();

                        _isLoadingLocal = false;
                      });
                    },
                    footers: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Total: ${_source.length} registros'),
                      ),
                    ],
                  ),
                ),
              );
            }
          });
  }
}

class _DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  const _DropDownContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = data.entries.map<Widget>((entry) {
      Widget w = Row(
        children: [
          Text(entry.key.toString()),
          const Spacer(),
          Text(entry.value.toString()),
        ],
      );
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: w,
      );
    }).toList();

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: _children),
    );
  }
}

class MovimentacoesTable extends StatefulWidget {
  final List<cli.Movimentacao> movimentacoes;
  const MovimentacoesTable({super.key, required this.movimentacoes});

  @override
  State<MovimentacoesTable> createState() => _MovimentacoesTableState();
}

class _MovimentacoesTableState extends State<MovimentacoesTable> {
  late List<DatatableHeader> _headers;
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  String? _searchKey = "codigoSap";
  String? _sortColumn;
  bool _sortAscending = true;
  List<bool>? _expanded;
  bool _isLoadingLocal = false;
  int? _currentPerPage = 20;
  int _currentPage = 1;
  int _total = 0;
  List<int> _perPages = [10, 20, 50, 100];

  @override
  void initState() {
    super.initState();
    _headers = [
      DatatableHeader(text: "USUÁRIO", value: "usuario", show: true, flex: 1),
      DatatableHeader(text: "MATERIAL", value: "material", show: true, flex: 2),
      DatatableHeader(
          text: "FERRAMENTA", value: "ferramenta", show: true, flex: 2),
      DatatableHeader(text: "QTD", value: "quantidade", show: true),
      DatatableHeader(text: "TIPO", value: "tipoMovimentacao", show: true),
      DatatableHeader(text: "DATA MOV.", value: "dataMovimentacao", show: true),
      DatatableHeader(text: "DATA DEV.", value: "dataDevolucao", show: true),
      DatatableHeader(text: "ORIGEM BASE", value: "origemBase", show: true),
      DatatableHeader(text: "DESTINO BASE", value: "destinoBase", show: true),
      DatatableHeader(text: "ORIGEM VEÍC.", value: "origemVeiculo", show: true),
      DatatableHeader(
          text: "DESTINO VEÍC.", value: "destinoVeiculo", show: true),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller =
        Provider.of<RelatoriosController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData(controller);
    });
  }

  Future<void> _initData(RelatoriosController controller) async {
    setState(() => _isLoadingLocal = true);
    try {
      if (widget.movimentacoes.isEmpty) {
        await controller.fetchData();
      }
      _source = _convertMovimentacaoToMap(controller.movimentacoes);

      _sourceOriginal.clear();
      _sourceOriginal
          .addAll(_convertMovimentacaoToMap(controller.movimentacoes));

      _sourceFiltered = _sourceOriginal;
      _total = _sourceOriginal.length;

      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      debugPrint('Erro ao inicializar dados do modal: $e');
    } finally {
      setState(() => _isLoadingLocal = false);
    }
  }

  List<Map<String, dynamic>> _convertMovimentacaoToMap(List movimentacao) {
    return widget.movimentacoes.map((m) {
      String fmt(DateTime? d) =>
          d == null ? '-' : DateFormat('dd/MM/yyyy HH:mm').format(d);
      return {
        'usuario':
            m.usuario?.email?.toString() ?? '-', 
        'material': m.material?.nome ?? '-',
        'ferramenta': m.ferramenta?.nome ?? '-',
        'quantidade': m.quantidade ?? 0,
        'tipoMovimentacao': m.tipoMovimentacao ?? '-',
        'dataMovimentacao': fmt(m.dataMovimentacao),
        'dataDevolucao': fmt(m.dataDevolucao),
        'origemBase': m.origemBase?.nome ?? '-',
        'destinoBase': m.destinoBase?.nome ?? '-',
        'origemVeiculo': m.origemVeiculo?.descricao ?? '-',
        'destinoVeiculo': m.destinoVeiculo?.descricao ?? '-',
      };
    }).toList();
  }

  _resetData({start = 0}) async {
    setState(() => _isLoadingLocal = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoadingLocal = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movimentacoes.isEmpty) {
      return const Center(child: Text("Sem movimentações para exibir."));
    }

    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Card(
        child: SingleChildScrollView(
          child: ResponsiveDatatable(
            headers: _headers,
            source: _source,
            selecteds: _selecteds,
            autoHeight: true,
            showSelect: false,
            expanded: _expanded,
            onSort: (value) {
              setState(() => _isLoadingLocal = true);

              setState(() {
                _sortColumn = value;
                _sortAscending = !_sortAscending;
                if (_sortAscending) {
                  _sourceFiltered.sort(
                      (a, b) => b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                } else {
                  _sourceFiltered.sort(
                      (a, b) => a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                }
                var _rangeTop = _currentPerPage! < _sourceFiltered.length
                    ? _currentPage!
                    : _sourceFiltered.length;
                _source = _sourceFiltered.getRange(0, _rangeTop).toList();
                _searchKey = value;

                _isLoadingLocal = false;
              });
            },
            footers: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Rows per page"),
              ),
              if (_perPages.isNotEmpty)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton<int>(
                    value: _currentPerPage,
                    items: _perPages
                        .map((e) => DropdownMenuItem<int>(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        _currentPerPage = value;
                        _currentPage = 1;
                        _resetData();
                      });
                    },
                    isExpanded: false,
                  ),
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("$_currentPage - $_currentPerPage of $_total"),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                ),
                onPressed: _currentPage == 1
                    ? null
                    : () {
                        var _nextSet = _currentPage - _currentPerPage!;
                        setState(() {
                          _currentPage = _nextSet > 1 ? _nextSet : 1;
                          _resetData(start: _currentPage - 1);
                        });
                      },
                padding: EdgeInsets.symmetric(horizontal: 15),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: _currentPage + _currentPerPage! - 1 > _total
                    ? null
                    : () {
                        var _nextSet = _currentPage + _currentPerPage!;

                        setState(() {
                          _currentPage = _nextSet < _total
                              ? _nextSet
                              : _total - _currentPerPage!;
                          _resetData(start: _nextSet - 1);
                        });
                      },
                padding: EdgeInsets.symmetric(horizontal: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CalibracoesTable extends StatefulWidget {
  final List<cli.Calibracao> calibracoes;
  const CalibracoesTable({super.key, required this.calibracoes});

  @override
  State<CalibracoesTable> createState() => _CalibracoesTableState();
}

class _CalibracoesTableState extends State<CalibracoesTable> {
  late List<DatatableHeader> _headers;
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  String? _searchKey = "codigoSap";
  String? _sortColumn;
  bool _sortAscending = true;
  List<bool>? _expanded;
  bool _isLoadingLocal = false;
  int? _currentPerPage = 20;
  int _currentPage = 1;
  int _total = 0;
  List<int> _perPages = [10, 20, 50, 100];

  @override
  void initState() {
    super.initState();
    _headers = [
      DatatableHeader(
          text: "FERRAMENTA", value: "ferramenta", show: true, flex: 2),
      DatatableHeader(text: "DATA CAL.", value: "dataCalibracao", show: true),
      DatatableHeader(
          text: "VALIDADE", value: "validadeCalibracao", show: true),
      DatatableHeader(text: "STATUS", value: "status", show: true),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller =
        Provider.of<RelatoriosController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData(controller);
    });
  }

  Future<void> _initData(RelatoriosController controller) async {
    setState(() => _isLoadingLocal = true);
    try {
      if (widget.calibracoes.isEmpty) {
        await controller.fetchData();
      }
      _source = _convertCalibracaoToMap(controller.calibracoesVencidas);

      _sourceOriginal.clear();
      _sourceOriginal
          .addAll(_convertCalibracaoToMap(controller.calibracoesVencidas));

      _sourceFiltered = _sourceOriginal;
      _total = _sourceOriginal.length;

      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      debugPrint('Erro ao inicializar dados do modal: $e');
    } finally {
      setState(() => _isLoadingLocal = false);
    }
  }

  List<Map<String, dynamic>> _convertCalibracaoToMap(List calibracoes) {
    return widget.calibracoes.map((c) {
      String fmt(DateTime? d) =>
          d == null ? '-' : DateFormat('dd/MM/yyyy').format(d);
      return {
        'ferramenta': c.ferramenta?.descricao ?? '-',
        'dataCalibracao': fmt(c.dataCalibracao),
        'validadeCalibracao': fmt(c.validadeCalibracao),
        'status': c.status ?? '-',
      };
    }).toList();
  }

  _resetData({start = 0}) async {
    setState(() => _isLoadingLocal = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoadingLocal = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.calibracoes.isEmpty) {
      return const Center(child: Text("Sem calibrações vencidas."));
    }

    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Card(
        child: SingleChildScrollView(
          child: ResponsiveDatatable(
            headers: _headers,
            source: _source,
            autoHeight: true,
            showSelect: false,
            expanded: _expanded,
            onSort: (value) {
              setState(() => _isLoadingLocal = true);

              setState(() {
                _sortColumn = value;
                _sortAscending = !_sortAscending;
                if (_sortAscending) {
                  _sourceFiltered.sort(
                      (a, b) => b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                } else {
                  _sourceFiltered.sort(
                      (a, b) => a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                }
                var _rangeTop = _currentPerPage! < _sourceFiltered.length
                    ? _currentPage!
                    : _sourceFiltered.length;
                _source = _sourceFiltered.getRange(0, _rangeTop).toList();
                _searchKey = value;

                _isLoadingLocal = false;
              });
            },
            footers: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Rows per page"),
              ),
              if (_perPages.isNotEmpty)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton<int>(
                    value: _currentPerPage,
                    items: _perPages
                        .map((e) => DropdownMenuItem<int>(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        _currentPerPage = value;
                        _currentPage = 1;
                        _resetData();
                      });
                    },
                    isExpanded: false,
                  ),
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("$_currentPage - $_currentPerPage of $_total"),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                ),
                onPressed: _currentPage == 1
                    ? null
                    : () {
                        var _nextSet = _currentPage - _currentPerPage!;
                        setState(() {
                          _currentPage = _nextSet > 1 ? _nextSet : 1;
                          _resetData(start: _currentPage - 1);
                        });
                      },
                padding: EdgeInsets.symmetric(horizontal: 15),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: _currentPage + _currentPerPage! - 1 > _total
                    ? null
                    : () {
                        var _nextSet = _currentPage + _currentPerPage!;

                        setState(() {
                          _currentPage = _nextSet < _total
                              ? _nextSet
                              : _total - _currentPerPage!;
                          _resetData(start: _nextSet - 1);
                        });
                      },
                padding: EdgeInsets.symmetric(horizontal: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InstrumentosEmUsoTable extends StatefulWidget {
  final List<cli.Ferramenta> ferramentas;
  final List<cli.Movimentacao> movimentacoes;
  final Map<int, cli.LocalUserInfo> localUsersMap;

  const InstrumentosEmUsoTable(
      {super.key,
      required this.ferramentas,
      required this.movimentacoes,
      required this.localUsersMap});

  @override
  State<InstrumentosEmUsoTable> createState() => _InstrumentosEmUsoTableState();
}

class _InstrumentosEmUsoTableState extends State<InstrumentosEmUsoTable> {
  late List<DatatableHeader> _headers;
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  String? _searchKey = "codigoSap";
  String? _sortColumn;
  bool _sortAscending = true;
  List<bool>? _expanded;
  bool _isLoadingLocal = false;
  int? _currentPerPage = 20;
  int _currentPage = 1;
  int _total = 0;
  List<int> _perPages = [10, 20, 50, 100];

  @override
  void initState() {
    super.initState();
    _headers = [
      DatatableHeader(
          text: "CÓD. SAP", value: "codigoSap", show: true, flex: 1),
      DatatableHeader(text: "NOME", value: "nome", show: true, flex: 2),
           DatatableHeader(
          text: "DESCRIÇÃO",
          value: "descricao",
          show: true,
          flex: 3,
          sortable: true,
          sourceBuilder: (value, row) {
            return Expanded(
              child: Text(
                value ?? '',
                maxLines: 20,
                softWrap: true,
              ),
            );
          }),
      DatatableHeader(text: "PATRIMÔNIO", value: "patrimonio", show: true),
      DatatableHeader(text: "EMPENHADO", value: "empenhado", show: true),
      DatatableHeader(text: "AQUISIÇÃO", value: "dataAquisicao", show: true),
      DatatableHeader(text: "BASE", value: "base", show: true),
      DatatableHeader(text: "VEÍCULO", value: "veiculo", show: true),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller =
        Provider.of<RelatoriosController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData(controller);
    });
  }

  Future<void> _initData(RelatoriosController controller) async {
    setState(() => _isLoadingLocal = true);
    try {
      if (widget.movimentacoes.isEmpty) {
        await controller.fetchData();
      }
      _source = _convertFerramentasEmUsoToMap(
          controller.ferramentas, controller.movimentacoes);

      _sourceOriginal.clear();
      _sourceOriginal.addAll(_convertFerramentasEmUsoToMap(
          controller.ferramentas, controller.movimentacoes));

      _sourceFiltered = _sourceOriginal;
      _total = _sourceOriginal.length;

      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      debugPrint('Erro ao inicializar dados do modal: $e');
    } finally {
      setState(() => _isLoadingLocal = false);
    }
  }

  List<Map<String, dynamic>> _convertFerramentasEmUsoToMap(
      List ferramentasEmUso, List movimentacoes) {
    return widget.ferramentas.map((f) {
      final histUsers = widget.movimentacoes
          .where((m) => m.ferramenta?.id == f.id)
          .map((m) {
            final userId = m.usuario?.id;
            if (userId == null) return '-';
            final local = widget.localUsersMap[userId];
            return local?.registro ??
                userId.toString(); 
          })
          .toSet()
          .toList();

      final empenhado = () {
        final empId = f.empenhadoPara?.id;
        if (empId == null) return '-';
        final localEmp = widget.localUsersMap[empId];
        return localEmp?.registro ?? empId.toString();
      }();

      return {
        'nome': f.nome ?? '',
        'codigoSap': f.codigoSap,
        'descricao': f.descricao,
        'patrimonio': f.patrimonio ?? '-',
        'empenhado': empenhado,
        'dataAquisicao': DateFormat('dd/MM/yyyy').format(f.dataAquisicao),
        'base': f.base?.nome ?? '-',
        'veiculo': f.veiculo?.descricao ?? '-',
 
        'dropData': {
          'Empenhado Para': empenhado,
          'Histórico': histUsers.isEmpty ? '-' : histUsers.join(', '),
          'Patrimônio': f.patrimonio ?? '-',
        }
      };
    }).toList();
  }

  _resetData({start = 0}) async {
    setState(() => _isLoadingLocal = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoadingLocal = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ferramentas.isEmpty) {
      return const Center(child: Text('Sem instrumentos em uso.'));
    }

    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Card(
        child: SingleChildScrollView(
          child: ResponsiveDatatable(
            headers: _headers,
            source: _source,
            selecteds: _selecteds,
            autoHeight: true,
            showSelect: false,
            expanded: _expanded,
            onSort: (value) {
              setState(() => _isLoadingLocal = true);

              setState(() {
                _sortColumn = value;
                _sortAscending = !_sortAscending;
                if (_sortAscending) {
                  _sourceFiltered.sort(
                      (a, b) => b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                } else {
                  _sourceFiltered.sort(
                      (a, b) => a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                }
                var _rangeTop = _currentPerPage! < _sourceFiltered.length
                    ? _currentPage!
                    : _sourceFiltered.length;
                _source = _sourceFiltered.getRange(0, _rangeTop).toList();
                _searchKey = value;

                _isLoadingLocal = false;
              });
            },
            dropContainer: (row) {
              final Map<String, dynamic> data = row['dropData'] ?? {};
              return _DropDownContainer(data: data.cast<String, dynamic>());
            },
            footers: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("Rows per page"),
              ),
              if (_perPages.isNotEmpty)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton<int>(
                    value: _currentPerPage,
                    items: _perPages
                        .map((e) => DropdownMenuItem<int>(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        _currentPerPage = value;
                        _currentPage = 1;
                        _resetData();
                      });
                    },
                    isExpanded: false,
                  ),
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("$_currentPage - $_currentPerPage of $_total"),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                ),
                onPressed: _currentPage == 1
                    ? null
                    : () {
                        var _nextSet = _currentPage - _currentPerPage!;
                        setState(() {
                          _currentPage = _nextSet > 1 ? _nextSet : 1;
                          _resetData(start: _currentPage - 1);
                        });
                      },
                padding: EdgeInsets.symmetric(horizontal: 15),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: _currentPage + _currentPerPage! - 1 > _total
                    ? null
                    : () {
                        var _nextSet = _currentPage + _currentPerPage!;

                        setState(() {
                          _currentPage = _nextSet < _total
                              ? _nextSet
                              : _total - _currentPerPage!;
                          _resetData(start: _nextSet - 1);
                        });
                      },
                padding: EdgeInsets.symmetric(horizontal: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
