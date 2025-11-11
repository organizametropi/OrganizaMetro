import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart' as cli;
import 'package:organiza_metro_flutter/src/controllers/relatorios_controller.dart';
import 'package:organiza_metro_flutter/src/widgets/charts/bar_chart.dart';
import 'package:organiza_metro_flutter/src/widgets/charts/pie_chart.dart';
import 'package:responsive_table/responsive_table.dart';

const Map<RelatorioType, String> relatorioLabels = {
  RelatorioType.movimentacoes: 'Movimentações (3.2.1)',
  RelatorioType.consumo: 'Consumo por Período (3.2.2)',
  RelatorioType.instrumentosEmUso: 'Instrumentos em Uso (3.2.3)',
  RelatorioType.calibracoesVencidas: 'Calibrações Vencidas (3.2.4)',
};

// ===========================================================================
// SELETORES DE MODO (Seu código original, com classes renomeadas)
// ===========================================================================

class MainSelector extends StatelessWidget {
  final RelatoriosController controller;
  const MainSelector({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 2.0)),
      ),
      child: SegmentedButton<RelatorioMode>(
        segments: const [
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
        // Garante que o Row se estique para a largura máxima
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Usamos Flexible/Expanded para garantir que o botão
          // ocupe o espaço dentro do Row, se o Row tiver restrições
          Flexible(
            child: SegmentedButton<ItemType>(
              segments: const [
                ButtonSegment(
                  value: ItemType.material,
                  // Usar texto mais curto e um ícone para economizar espaço
                  icon: Icon(Icons.inventory_2_outlined),
                  label: Text('Materiais'),
                ),
                ButtonSegment(
                  value: ItemType.ferramenta,
                  // Texto mais curto e ícone
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

    // Sub-selector para Relatórios Gerenciais
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

// ===========================================================================
// VISÃO PRINCIPAL: DASHBOARD (3.1)
// ===========================================================================

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
          // PBI 3.1.3: Painel de Instrumentos (MOCK)
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

// ===========================================================================
// LAYOUTS DE DASHBOARD (Material)
// ===========================================================================

class _WideMaterialDashboard extends StatelessWidget {
  final RelatoriosController controller;
  const _WideMaterialDashboard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Coluna Esquerda: Gráficos (40%)
        Expanded(
          flex: 4,
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

        // Coluna Direita: Tabela/Inventário (60%)
        Expanded(
          flex: 6,
          child: _ReportCard(
            title: 'Inventário Consolidado (PBI 3.1.1)',
            height: 620,
            child: EstoqueMaterialTable(
                materiais: controller.materiaisEstoque), // 🚨 Sua Tabela
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
        _ReportCard(
            title: 'Inventário Consolidado (PBI 3.1.1)',
            height: 450,
            child: EstoqueFerramentaTable(ferramenta: controller.ferramentas)),
        const SizedBox(height: 20),
        _ReportCard(
          title: 'Top 10 Materiais Consumidos',
          height: 300,
          child: const Center(child: Text("Gráfico FL_CHART (Barra)")),
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
        // Coluna Esquerda: Gráficos (40%)
        Expanded(
          flex: 4,
          child: Column(
            children: [
              _ReportCard(
                title: 'Top 10 Materiais Consumidos (PBI 3.1.2)',
                height: 300,
                child: const Center(child: Text("Gráfico FL_CHART (Barra)")),
              ),
              const SizedBox(height: 20),
              _ReportCard(
                title: 'Consumo por Centro Logístico (MOCK)',
                height: 300,
                child: const Center(child: Text("Gráfico FL_CHART (Pizza)")),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),

        // Coluna Direita: Tabela/Inventário (60%)
        Expanded(
          flex: 6,
          child: _ReportCard(
            title: 'Inventário Consolidado (PBI 3.1.1)',
            height: 620,
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
        _ReportCard(
          title: 'Top 10 Materiais Consumidos',
          height: 420,
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
          title: 'Inventário Consolidado (PBI 3.1.1)',
          height: 450,
          child: EstoqueMaterialTable(materiais: controller.materiaisEstoque),
        ),
      ],
    );
  }
}

// ===========================================================================
// VISÃO PRINCIPAL: RELATÓRIOS GERENCIAIS (3.2)
// ===========================================================================

class RelatorioGerencialView extends StatelessWidget {
  final RelatoriosController controller;
  const RelatorioGerencialView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        // Placeholder de Filtros de Data (para futuros relatórios)
        Row(
          children: [
            const Text('Filtro de Período:',
                style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(width: 10),
            // TODO: Campos de data (DateTimeFormField)
          ],
        ),
        const SizedBox(height: 20),

        // Exibe o conteúdo do relatório ativo
        _ReportCard(
          title: relatorioLabels[controller.relatorioAtivo]!,
          height: 600,
          child: RelatorioDetalheWidget(
            relatorioType: controller.relatorioAtivo,
            dados: controller.movimentacoes, // Dados dinâmicos do controller
          ),
        ),
      ],
    );
  }
}

// ===========================================================================
// WIDGETS AUXILIARES (Cards, Tabelas e Lógica de Exibição)
// ===========================================================================

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
      height: 45,
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
  State<DropdownPie> createState() => _DropdownBar();
}

class _DropdownBar extends State<DropdownPie> {
  List<DropdownMenuItem<int>> _dropdownItems = [
    const DropdownMenuItem(value: 5, child: Text('5')),
    const DropdownMenuItem(value: 10, child: Text('10')),
    const DropdownMenuItem(value: 15, child: Text('15')),
    const DropdownMenuItem(value: 20, child: Text('20')),
    const DropdownMenuItem(value: 20, child: Text('30')),
  ];


  @override
  Widget build(BuildContext context) {
    final currentSelection = widget.controller.barChartLimit;

    return SizedBox(
      height: 45,
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
            SizedBox(
              height: height - 40, // Subtrai o padding/título
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
              height: height - 40, // Subtrai o padding/título
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
            const SizedBox(height: 10),
            Row(children: [
              DropdownBar(controller: controller),
            ]),
            SizedBox(height: 10),
            SizedBox(
              height: height - 40, // Subtrai o padding/título
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

  const RelatorioDetalheWidget(
      {required this.relatorioType, required this.dados});

  @override
  Widget build(BuildContext context) {
    if (dados.isEmpty) {
      return const Center(
          child: Text(
              "Nenhum dado encontrado para o período/filtro selecionado."));
    }

    // TODO: Switch/Case para renderizar a tabela correta (MovimentacaoTable, CalibracaoTable, etc.)
    return switch (relatorioType.name) {
      'movimentacoes' => Text('oi'),
      'consumo' => Text('tchau'),
      'instrumentosEmUso' => Text('beijo'),
      'calibracoesVencidas' => Text('ola'),
      _ => SizedBox.shrink()
    };
  }
}

// 🚨 Adaptação da sua tabela original para ser reutilizada aqui
class EstoqueMaterialTable extends StatefulWidget {
  final List<cli.Material>
      materiais; // Recebe a lista de objetos Material do Controller
  const EstoqueMaterialTable({super.key, required this.materiais});

  @override
  State<EstoqueMaterialTable> createState() => _EstoqueMaterialTableState();
}

class _EstoqueMaterialTableState extends State<EstoqueMaterialTable> {
  // Lógica da tabela...
  late List<DatatableHeader> _headers;
  // ... (Variáveis de estado da tabela) ...

  // TODO: Criar o método _updateSource para mapear os dados do widget.materiais para o formato Map

  @override
  void initState() {
    super.initState();
    //setHeaders (Adaptado)
    _headers = [
      DatatableHeader(
          text: "CÓD. SAP", value: "codigoSap", show: true, flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO", value: "descricao", show: true, flex: 2),
      DatatableHeader(text: "QTD", value: "quantidade", show: true),
      DatatableHeader(text: "MÍN", value: "unidadeMedida", show: true),
      DatatableHeader(text: "UNIDADE", value: "unidadeMedida", show: true),
      DatatableHeader(text: "TIPO", value: "unidadeMedida", show: true),
      DatatableHeader(text: "ORIGEM", value: "unidadeMedida", show: true),
    ];
    // TODO: Chamar o método de inicialização/população
  }

  @override
  Widget build(BuildContext context) {
    if (widget.materiais.isEmpty) {
      return const Center(
          child: Text("Sem dados de estoque para o inventário."));
    }

    // 🚨 Retorna o ResponsiveDatatable COMPLETO com todos os seus footers, actions e lógica de paginação.
    // Usamos um placeholder simples, pois o código da sua tabela é extenso e não foi fornecido
    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Card(
        child: ResponsiveDatatable(
          headers: _headers,
          source: const [], // Placeholder: usar o _source populado
          selecteds: const [],
          autoHeight: false,
          showSelect: false,
          // TODO: Adicionar toda a lógica de paginação e ordenação aqui
        ),
      ),
    );
  }
}

class EstoqueFerramentaTable extends StatefulWidget {
  final List<cli.Ferramenta>
      ferramenta; // Recebe a lista de objetos Material do Controller
  const EstoqueFerramentaTable({super.key, required this.ferramenta});

  @override
  _EstoqueFerramentaTableState createState() => _EstoqueFerramentaTableState();
}

class _EstoqueFerramentaTableState extends State<EstoqueFerramentaTable> {
  // Lógica da tabela...
  late List<DatatableHeader> _headers;
  // ... (Variáveis de estado da tabela) ...

  // TODO: Criar o método _updateSource para mapear os dados do widget.materiais para o formato Map

  @override
  void initState() {
    super.initState();
    //setHeaders (Adaptado)
    _headers = [
      DatatableHeader(
          text: "CÓD. SAP", value: "codigoSap", show: true, flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO", value: "descricao", show: true, flex: 2),
      DatatableHeader(text: "PATRÍMONIO", value: "quantidade", show: true),
      DatatableHeader(text: "DIVISAO", value: "unidadeMedida", show: true),
      DatatableHeader(text: "TIPO", value: "unidadeMedida", show: true),
      DatatableHeader(text: "STATUS", value: "unidadeMedida", show: true),
      DatatableHeader(text: "AQUISIÇÃO", value: "unidadeMedida", show: true),
      DatatableHeader(text: "ORIGEM", value: "unidadeMedida", show: true),
    ];
    // TODO: Chamar o método de inicialização/população
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.ferramenta.isEmpty) {
    //   return const Center(
    //       child: Text("Sem dados de estoque para o inventário."));
    // }

    // 🚨 Retorna o ResponsiveDatatable COMPLETO com todos os seus footers, actions e lógica de paginação.
    // Usamos um placeholder simples, pois o código da sua tabela é extenso e não foi fornecido
    return Container(
      constraints: const BoxConstraints(maxHeight: 500),
      child: Card(
        child: ResponsiveDatatable(
          headers: _headers,
          source: const [], // Placeholder: usar o _source populado
          selecteds: const [],
          autoHeight: false,
          showSelect: false,
          // TODO: Adicionar toda a lógica de paginação e ordenação aqui
        ),
      ),
    );
  }
}
