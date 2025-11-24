import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/controllers/ferramenta_controller.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:responsive_table/responsive_table.dart';

class ModeSelector extends StatelessWidget {
  final FerramentaController controller;
  const ModeSelector({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => controller.setMode(FerramentaMode.retirar),
            icon: const Icon(Icons.outbox),
            label: const Text('RETIRAR',
                style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.mode == FerramentaMode.retirar
                  ? Colors.red.shade700
                  : Colors.grey.shade300,
              foregroundColor: controller.mode == FerramentaMode.retirar
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => controller.setMode(FerramentaMode.devolver),
            icon: const Icon(Icons.inbox),
            label: const Text('DEVOLVER',
                style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: controller.mode == FerramentaMode.devolver
                  ? Colors.blue.shade700
                  : Colors.grey.shade300,
              foregroundColor: controller.mode == FerramentaMode.devolver
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}

class _DevolucaoModalContent extends StatefulWidget {
  final Ferramenta ferramenta;
  final FerramentaController controller;

  const _DevolucaoModalContent(
      {required this.ferramenta, required this.controller});

  @override
  State<_DevolucaoModalContent> createState() => __DevolucaoModalContentState();
}

class __DevolucaoModalContentState extends State<_DevolucaoModalContent> {
  String _tipo = 'Bases';
  List<Base> _bases = [];
  List<Veiculo> _veiculos = [];
  int? _selectedBaseId;
  int? _selectedVeiculoId;
  bool _loadingLocais = false;
  final TextEditingController _obsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchLocais();
  }

  Future<void> _fetchLocais() async {
    setState(() => _loadingLocais = true);
    try {
      final fetchedBases = await client.admin.getBases();
      final fetchedVeiculos = await client.admin.getVeiculos();
      setState(() {
        _bases = fetchedBases;
        _veiculos = fetchedVeiculos;
      });
    } catch (e) {
    } finally {
      setState(() => _loadingLocais = false);
    }
  }

  @override
  void dispose() {
    _obsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Devolver ${widget.ferramenta.nome}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Destino'),
            ),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _tipo,
                  items: const [
                    DropdownMenuItem(value: 'Bases', child: Text('Bases')),
                    DropdownMenuItem(
                        value: 'Veiculos', child: Text('Veículos')),
                  ],
                  onChanged: (v) => setState(() {
                    _tipo = v ?? 'Bases';
                    _selectedBaseId = null;
                    _selectedVeiculoId = null;
                  }),
                  decoration: const InputDecoration(labelText: 'Tipo'),
                ),
              ),
            ]),
            const SizedBox(height: 12),
            if (_loadingLocais)
              const CircularProgressIndicator(color: Colors.white)
            else
              DropdownButtonFormField<int>(
                value: _tipo == 'Bases' ? _selectedBaseId : _selectedVeiculoId,
                items: (_tipo == 'Bases'
                    ? _bases
                        .map((b) => DropdownMenuItem<int>(
                            value: b.id!, child: Text(b.nome)))
                        .toList()
                    : _veiculos
                        .map((v) => DropdownMenuItem<int>(
                            value: v.id!, child: Text(v.codigo)))
                        .toList()),
                onChanged: (val) => setState(() {
                  if (_tipo == 'Bases')
                    _selectedBaseId = val;
                  else
                    _selectedVeiculoId = val;
                }),
                decoration:
                    const InputDecoration(labelText: 'Centro Logístico'),
              ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _obsController,
              maxLines: 3,
              decoration: const InputDecoration(
                  labelText: 'Observação (opcional)',
                  border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar', style: TextStyle(color: Colors.red))),
        ElevatedButton(
          onPressed: ((_tipo == 'Bases' && _selectedBaseId != null) ||
                      (_tipo == 'Veiculos' && _selectedVeiculoId != null)) &&
                  !widget.controller.isLoading
              ? () async {
                  Navigator.of(context).pop();
                  final ok = await widget.controller.processarDevolucao(
                    context,
                    widget.ferramenta.id!,
                    _tipo == 'Bases' ? _selectedBaseId : null,
                    _tipo == 'Veiculos' ? _selectedVeiculoId : null,
                    observacao: _obsController.text.isEmpty
                        ? null
                        : _obsController.text,
                  );
                  if (!ok) {}
                }
              : null,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: widget.controller.isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 2))
              : const Text('Confirmar Devolução',
                  style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class RetiradaView extends StatefulWidget {
  final FerramentaController controller;
  const RetiradaView({required this.controller});

  @override
  State<RetiradaView> createState() => _RetiradaViewState();
}

class _RetiradaViewState extends State<RetiradaView> {
  final List<DatatableHeader> _headers = [
    DatatableHeader(
        text: "CÓD. SAP",
        value: "codigoSap",
        show: true,
        sortable: true,
        flex: 1,
        sourceBuilder: (value, row) {
          return Center(
            child: Text(
              value.toString() ?? '-',
              style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 13),
            ),
          );
        }),
    DatatableHeader(
        text: "NOME",
        value: "nome",
        show: true,
        sortable: true,
        flex: 1,
        sourceBuilder: (value, row) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              value ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          );
        }),
    DatatableHeader(
        text: "PATRIMÔNIO",
        value: "patrimonio",
        show: true,
        sortable: true,
        sourceBuilder: (value, row) {
          final display = (value == null || value.toString().isEmpty)
              ? '-'
              : value.toString();
          return Tooltip(
            message: display,
            child: Center(
                child: Text(display,
                    style: const TextStyle(fontWeight: FontWeight.w600))),
          );
        }),
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
    DatatableHeader(
        text: "TIPO",
        value: "tipo",
        show: true,
        sortable: false,
        sourceBuilder: (value, row) {
          return Center(child: Text((value ?? '').toString().toUpperCase()));
        }),
    DatatableHeader(
      text: "Origem",
      value: "origem",
      show: true,
      flex: 2,
      sourceBuilder: (value, row) {
        final base = row['base'];
        final veiculo = row['veiculo'];

        String displayText;
        if (base != null && base.isNotEmpty) {
          displayText = base;
        } else if (veiculo != null && veiculo.isNotEmpty) {
          displayText = veiculo;
        } else {
          displayText = "Não informado";
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              displayText,
              style: const TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        );
      },
    )
  ];

  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  int? _currentPerPage = 20;
  int _currentPage = 1;
  List<bool>? _expanded;
  String? _searchKey = "id";
  String? _sortColumn;
  bool _sortAscending = true;

  void initState() {
    super.initState();
    _updateSource();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _updateSource();
    });
  }

  void _updateSource() {
    _sourceOriginal = widget.controller.disponiveis
        .map((f) => {
              "id": f.id,
              "codigoSap": f.codigoSap,
              "patrimonio": f.patrimonio,
              "nome": f.nome,
              "descricao": f.descricao,
              "tipo": f.tipo?.nome,
              "base": f.base?.nome,
              "veiculo": f.veiculo?.descricao,
            })
        .toList();

    _sourceFiltered = _sourceOriginal;

    var _rangeTop = _currentPerPage! < _sourceFiltered.length
        ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
        : _sourceFiltered.length;
    _expanded = List.generate(_rangeTop, (index) => false);
    _source = _sourceFiltered.getRange(0, _rangeTop).toList();
  }

  DateTime? _modalDevolucaoDate;

  void _showRetiradaConfirmationModal(
      BuildContext context, Map<String, dynamic> selectedTool) {
    final int ferramentaId = selectedTool['id'] as int;
    final String ferramentaDescricao = selectedTool['nome'] as String;

    _modalDevolucaoDate = DateTime.now().add(const Duration(days: 7));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Retirada e Devolução'),
          content: SingleChildScrollView(
            child: _RetiradaModalContent(
              ferramentaDescricao: ferramentaDescricao,
              onDateSelected: (date) {
                _modalDevolucaoDate = date;
              },
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar', style: TextStyle(color: Colors.red))),
            ElevatedButton(
              onPressed:
                  widget.controller.isLoading || _modalDevolucaoDate == null
                      ? null
                      : () {
                          widget.controller.processarRetirada(
                            context,
                            ferramentaId,
                            dataDevolucaoEsperada: _modalDevolucaoDate,
                          );
                          Navigator.of(context).pop();
                        },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, textStyle: const TextStyle(color: Colors.white)),
              child: widget.controller.isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2))
                  : const Text('CONFIRMAR EMPENHO', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_source.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SizedBox(
            height: 700,
            child: Center(
              child: Text('Nenhuma ferramenta disponível para retirada.',
                  style: TextStyle(color: Colors.black54)),
            ),
          ),
        ),
      );
    }

    final screenHeight = MediaQuery.of(context).size.height;

    final double maxTableHeight = screenHeight * 0.7;

    final selectedTool = _selecteds.isNotEmpty ? _selecteds.first : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Selecione um item para empenhar:',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        SizedBox(
          height: maxTableHeight,
          child: Card(
            elevation: 2,
            child: ResponsiveDatatable(
              headers: _headers,
              source: _source,
              selecteds: _selecteds,
              showSelect: true,
              autoHeight: false,
              onSelect: (value, item) {
                setState(() {
                  if (item == null) {
                    _selecteds = value! ? List.from(_source) : [];
                  } else if (value!) {
                    _selecteds = [item];
                  } else {
                    _selecteds.clear();
                  }
                });
              },
              onSort: (value) {
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

                  var _rangeTop = _currentPerPage! < _sourceFiltered.length
                      ? _currentPage!
                      : _sourceFiltered.length;

                  _source = _sourceFiltered.getRange(0, _rangeTop).toList();

                  _searchKey = value;
                });
              },
              expanded: _expanded,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 280,
              margin:
                  const EdgeInsets.only(bottom: 10.0, right: 5.0, top: 20.0),
              child: ElevatedButton.icon(
                onPressed: selectedTool != null && !widget.controller.isLoading
                    ? () =>
                        _showRetiradaConfirmationModal(context, selectedTool)
                    : null,
                icon: widget.controller.isLoading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2))
                    : const Icon(
                        Icons.outbox,
                        size: 16,
                        color: Colors.white,
                      ),
                label: Text(
                    widget.controller.isLoading
                        ? 'EMPENHANDO...'
                        : 'CONFIRMAR RETIRADA',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RetiradaModalContent extends StatefulWidget {
  final String ferramentaDescricao;

  final Function(DateTime) onDateSelected;

  const _RetiradaModalContent({
    required this.ferramentaDescricao,
    required this.onDateSelected,
  });

  @override
  State<_RetiradaModalContent> createState() => __RetiradaModalContentState();
}

class __RetiradaModalContentState extends State<_RetiradaModalContent> {
  DateTime _dataDevolucao = DateTime.now().add(const Duration(days: 7));
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _dateController.text = DateFormat('dd/MM/yyyy').format(_dataDevolucao);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.onDateSelected(_dataDevolucao);
      }
    });
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _dataDevolucao,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        _dataDevolucao = pickedDate;
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });

      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Você irá empenhar a ferramenta:',
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 5),
        Text(widget.ferramentaDescricao,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 15),
        const Text('Data de Devolução Sugerida:',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextFormField(
          controller: _dateController,
          readOnly: true,
          decoration: const InputDecoration(
            labelText: "Devolução Esperada",
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today),
          ),
          onTap: () => _selectDate(context),
        ),
      ],
    );
  }
}

class DevolucaoView extends StatelessWidget {
  final FerramentaController controller;
  const DevolucaoView({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.empenhadas.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: SizedBox(
            height: 700,
            child: Center(
              child: Text(
                  '✅ Sem ferramentas ou instrumentos empenhados para devolução.',
                  style: TextStyle(color: Colors.black54, fontSize: 16)),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Suas ferramentas empenhadas:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 10),
        ...controller.empenhadas.map((ferramenta) {
          return FerramentaDevolucaoCard(
              ferramenta: ferramenta, controller: controller);
        }).toList(),
      ],
    );
  }
}

class FerramentaDevolucaoCard extends StatelessWidget {
  final Ferramenta ferramenta;
  final FerramentaController controller;

  const FerramentaDevolucaoCard(
      {required this.ferramenta, required this.controller});

  void _showDevolucaoModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => _DevolucaoModalContent(
          ferramenta: ferramenta, controller: controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
            ferramenta.tipo == 'Instrumento'
                ? Icons.precision_manufacturing
                : Icons.handyman,
            color: Colors.blueGrey),
        title: Text(ferramenta.nome ?? '-',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
            'Código Sap: ${ferramenta.codigoSap}\nPatrimônio: ${ferramenta.patrimonio ?? '-'}\nDescrição: ${ferramenta.descricao}\nHora de Empenho: ${ferramenta.dataUltimaMovimentacao?.hour}:${ferramenta.dataUltimaMovimentacao?.minute.toString().padLeft(2, '0')} em ${ferramenta.dataUltimaMovimentacao != null ? DateFormat('dd/MM/yyyy').format(ferramenta.dataUltimaMovimentacao!) : '-'}',
            style: const TextStyle(fontSize: 12)),
        trailing: ElevatedButton(
          onPressed:
              controller.isLoading ? null : () => _showDevolucaoModal(context),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white),
          child: const Text('DEVOLVER'),
        ),
      ),
    );
  }
}
