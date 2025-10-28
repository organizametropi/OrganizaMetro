// ===========================================================================
// 1. SELETOR DE MODO
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/controllers/ferramenta_controller.dart';
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

// ===========================================================================
// 2. VISÃO DE RETIRADA (Minimalista com Tabela)
// ===========================================================================
class RetiradaView extends StatefulWidget {
  final FerramentaController controller;
  const RetiradaView({required this.controller});

  @override
  State<RetiradaView> createState() => _RetiradaViewState();
}

class _RetiradaViewState extends State<RetiradaView> {
  final List<DatatableHeader> _headers = [
    DatatableHeader(
        text: "CÓD. SAP", value: "codigoSap", show: true, sortable: true),
    DatatableHeader(
        text: "PATRIMÔNIO", value: "patrimonio", show: true, sortable: true),
    DatatableHeader(
        text: "DESCRIÇÃO",
        value: "descricao",
        show: true,
        flex: 2,
        sortable: true),
    DatatableHeader(text: "TIPO", value: "tipo", show: true, sortable: false),
    DatatableHeader(text: "STATUS", value: "status", show: true, sortable: false),
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
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSource();
  }

  void _updateSource() {
    _sourceOriginal = widget.controller.disponiveis
        .map((f) => {
              "id": f.id,
              "codigoSap": f.codigoSap,
              "patrimonio": f.patrimonio,
              "descricao": f.descricao,
              "tipo": f.tipo?.nome,
              "status": f.status,
            })
        .toList();

    _sourceFiltered = _sourceOriginal;

    var _rangeTop = _currentPerPage! < _sourceFiltered.length
        ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
        : _sourceFiltered.length;
    _expanded = List.generate(_rangeTop, (index) => false);
    _source = _sourceFiltered.getRange(0, _rangeTop).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_source.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Nenhuma ferramenta disponível para retirada.',
              style: TextStyle(color: Colors.black54)),
        ),
      );
    }

    // 🚨 NOVO: Obtém a altura da tela e reserva um espaço para o cabeçalho e margens.
    final screenHeight = MediaQuery.of(context).size.height;
    // Define uma altura máxima razoável (por exemplo, 70% da tela)
    final double maxTableHeight = screenHeight * 0.7;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Selecione um item para empenhar:',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),

        // 🚨 ENVOLVIMENTO EM UM SizedBox PARA DEFINIR A ALTURA
        SizedBox(
          height: maxTableHeight, // Define um limite superior para a tabela
          child: Card(
            elevation: 2,
            child: ResponsiveDatatable(
              headers: _headers,
              source: _source,
              selecteds: _selecteds,
              showSelect: true,
              autoHeight:
                  false, // Mantido como false para usar a altura do pai (SizedBox)
              onSelect: (value, item) {
                setState(() {
                  if (item == null) {
                    _selecteds = value! ? List.from(_source) : [];
                  } else if (value!) {
                    _selecteds = [item]; // Permite apenas uma seleção
                  } else {
                    _selecteds.clear();
                  }
                });
              },
              onSort: (value) {
                setState(() => _isLoading = true);

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

                  _isLoading = false;
                });
              },
              expanded: _expanded,
              footers: [
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed:
                      _selecteds.length == 1 && !widget.controller.isLoading
                          ? () => widget.controller.processarRetirada(
                              context, _selecteds.first['id'] as int)
                          : null,
                  icon: widget.controller.isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2))
                      : const Icon(Icons.outbox, size: 16),
                  label: Text(widget.controller.isLoading
                      ? 'EMPENHANDO...'
                      : 'CONFIRMAR RETIRADA'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ===========================================================================
// 3. VISÃO DE DEVOLUÇÃO (Card com Modal)
// ===========================================================================

class DevolucaoView extends StatelessWidget {
  final FerramentaController controller;
  const DevolucaoView({required this.controller});

  @override
  Widget build(BuildContext context) {
    if (controller.empenhadas.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
              '✅ Sem ferramentas ou instrumentos empenhados para devolução.',
              style: TextStyle(color: Colors.black54, fontSize: 16)),
        ),
      );
    }

    // Lista de cards para as ferramentas empenhadas
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

// ===========================================================================
// 4. CARD DE DEVOLUÇÃO E MODAL
// ===========================================================================

class FerramentaDevolucaoCard extends StatelessWidget {
  final Ferramenta ferramenta;
  final FerramentaController controller;

  const FerramentaDevolucaoCard(
      {required this.ferramenta, required this.controller});

  void _showDevolucaoModal(BuildContext context) {
    // 🚨 Este é o modal de devolução (onde você seleciona o destino)
    int? destinoBaseId;
    int? destinoVeiculoId;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Devolver ${ferramenta.descricao}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Selecione o local de devolução (Base ou Veículo):'),
              const SizedBox(height: 10),
              // 🚨 FUTURO: Aqui você teria um Dropdown para Bases e outro para Veículos,
              // com lógica para garantir que apenas um seja selecionado.
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "ID da Base de Destino (Mock)"),
                keyboardType: TextInputType.number,
                onChanged: (v) => destinoBaseId = int.tryParse(v),
              ),
              const SizedBox(height: 10),
              // Adicione campo para observação se necessário
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar')),
            ElevatedButton(
              onPressed: destinoBaseId != null
                  ? () {
                      // controller.processarDevolucao(
                      //   context,
                      //   ferramenta.id!,
                      //   destinoBaseId!,
                      //   destinoVeiculoId,
                      // );
                      // Navigator.of(context).pop();
                    }
                  : null,
              child: const Text('Confirmar Devolução',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        );
      },
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
        title: Text(ferramenta.descricao,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
            'Patrimônio: ${ferramenta.patrimonio}\nStatus: Empenhada',
            style: const TextStyle(fontSize: 12)),
        trailing: ElevatedButton(
          onPressed:
              controller.isLoading ? null : () => _showDevolucaoModal(context),
          child: const Text('DEVOLVER'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              foregroundColor: Colors.white),
        ),
      ),
    );
  }
}
