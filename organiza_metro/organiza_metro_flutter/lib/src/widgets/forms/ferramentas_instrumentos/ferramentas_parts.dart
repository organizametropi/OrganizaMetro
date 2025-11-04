// ===========================================================================
// 1. SELETOR DE MODO
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  DateTime? _modalDevolucaoDate;

  void _showRetiradaConfirmationModal(BuildContext context, Map<String, dynamic> selectedTool) {
    final int ferramentaId = selectedTool['id'] as int;
    final String ferramentaDescricao = selectedTool['descricao'] as String;
    
    // Reset da data para o padrão de 7 dias ou o valor salvo
    _modalDevolucaoDate = DateTime.now().add(const Duration(days: 7)); 

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Retirada e Devolução'),
          content: SingleChildScrollView(
            child: _RetiradaModalContent(
              ferramentaDescricao: ferramentaDescricao,
              // Captura a data selecionada do widget interno
              onDateSelected: (date) {
                _modalDevolucaoDate = date; 
                // Não precisa de setState aqui, pois o botão será reativado/confirmado no ONPRESSED
              },
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancelar')),
            ElevatedButton(
              onPressed: widget.controller.isLoading || _modalDevolucaoDate == null
                  ? null
                  : () {
                      // Usa a data capturada da variável de estado do modal
                      widget.controller.processarRetirada(
                        context, 
                        ferramentaId, 
                        dataDevolucaoEsperada: _modalDevolucaoDate,
                      );
                      Navigator.of(context).pop();
                    },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: widget.controller.isLoading 
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                  : const Text('CONFIRMAR EMPENHO'),
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
          child: Text('Nenhuma ferramenta disponível para retirada.',
              style: TextStyle(color: Colors.black54)),
        ),
      );
    }

    // 🚨 NOVO: Obtém a altura da tela e reserva um espaço para o cabeçalho e margens.
    final screenHeight = MediaQuery.of(context).size.height;
    // Define uma altura máxima razoável (por exemplo, 70% da tela)
    final double maxTableHeight = screenHeight * 0.7;

    final selectedTool = _selecteds.isNotEmpty ? _selecteds.first : null;

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
            ),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ElevatedButton.icon(
            onPressed: selectedTool != null && !widget.controller.isLoading
                ? () => _showRetiradaConfirmationModal(context, selectedTool) // 🚨 CHAMA O MODAL
                : null,
            icon: widget.controller.isLoading
                ? const SizedBox(
                    width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : const Icon(Icons.outbox, size: 16),
            label: Text(widget.controller.isLoading ? 'EMPENHANDO...' : 'CONFIRMAR RETIRADA', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ),
      ],
    );
  }
}

class _RetiradaModalContent extends StatefulWidget {
  final String ferramentaDescricao;
  
  // Callback para retornar a data selecionada
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
    // Inicializa o controller de texto com o valor padrão
    _dateController.text = DateFormat('dd/MM/yyyy').format(_dataDevolucao);
    // Notifica o pai sobre a data inicial
    widget.onDateSelected(_dataDevolucao);
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
      // Notifica o pai (o builder do AlertDialog) sobre a data final
      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Você irá empenhar a ferramenta:', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 5),
        Text(widget.ferramentaDescricao, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 15),

        // Campo de Data de Devolução Esperada
        const Text('Data de Devolução Sugerida:', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextFormField(
          controller: _dateController, // Usando o controller para exibir a data
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
