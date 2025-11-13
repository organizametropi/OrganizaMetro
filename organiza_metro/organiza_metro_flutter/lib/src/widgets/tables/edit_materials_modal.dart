import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class EditMaterialsModal extends StatefulWidget {
  const EditMaterialsModal({super.key});

  @override
  State<EditMaterialsModal> createState() => _EditMaterialsModalState();
}

class _EditMaterialsModalState extends State<EditMaterialsModal> {
  late List<DatatableHeader> _headers;

  List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 10;
  List<bool>? _expanded;
  String? _searchKey = "id";

  int _currentPage = 1;
  bool _isSearch = false;
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  bool _showSelected = false;

  List<Map<String, dynamic>> _convertMateriasToMap(List<Material> materiais) {
    return materiais.map((m) {
      return {
        "id": m.id,
        "codigoSap": m.codigoSap,
        "descricao": m.descricao,
        "quantidade": m.quantidade,
        "unidadeMedida": m.unidadeMedida?.codigo,
      };
    }).toList();
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    setState(() => _isLoading = true);
    try {
      final List<Material> materiais = await client.material.getEstoque();

      _sourceOriginal.clear();
      _sourceOriginal.addAll(_convertMateriasToMap(materiais));

      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;

      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      print("Erro ao buscar os dados no estoque: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  _resetData({start = 0}) async {
    setState(() => _isLoading = true);
    var _expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(Duration(seconds: 0)).then((value) {
      _expanded = List.generate(_expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + _expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var _rangeTop = _total < _currentPage! ? _total : _currentPage!;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    //setHeaders
    _headers = [
      DatatableHeader(
          text: "ID", value: "id", show: false), // Adicionado sortable
      DatatableHeader(
          text: "CÓDIGO SAP",
          value: "codigoSap",
          show: true,
          sortable: true,
          editable: true,
          flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO",
          value: "descricao",
          show: true,
          flex: 2,
          sortable: true,
          editable: true),
      DatatableHeader(
          text: "QTD",
          value: "quantidade",
          show: true,
          sortable: true,
          editable: true),
      DatatableHeader(
        text: "UNIDADE",
        value: "unidadeMedida",
        show: true,
        sortable: false,
        editable: true,
        sourceBuilder: (value, row) {
          // valor atual da unidade
          final unidadeAtual = value ?? 'UN';

          // lista de opções (pode vir do serverpod futuramente)
          const unidades = ['UN', 'KG', 'LT', 'CX'];

          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: unidadeAtual,
              isDense: true,
              onChanged: (novaUnidade) {
                if (novaUnidade == null) return;
                setState(() {
                  row['unidadeMedida'] = novaUnidade;
                });
              },
              items: unidades
                  .map((u) => DropdownMenuItem(
                        value: u,
                        child: Text(
                          u,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ))
                  .toList(),
            ),
          );
        },
      ),
    ];

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _saveChanges() async {
    final editedRows = _source.where((e) => e['modified'] == true).toList();

    for (final row in editedRows) {
      await client.material.updateFromMap(row);
      row['modified'] = false;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${editedRows.length} registros salvos!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Materiais"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveChanges,
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: ResponsiveDatatable(
                headers: _headers,
                source: _source,
                showSelect: false,
                autoHeight: false,
                isLoading: _isLoading,
                onChangedRow: (value, header) {
                  final index =
                      _source.indexWhere((e) => e['id'] == value['id']);
                  if (index != -1) {
                    setState(() {
                      _source[index][header.value] = value[header.value];
                      _source[index]['modified'] = true;
                    });
                  }
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
                onSubmittedRow: (value, header) async {
                  debugPrint(
                      "Edição confirmada para ${header.value}: ${value[header.value]}");
                },
                footers: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Total: ${_source.length} registros'),
                  )
                ],
              ),
            ),
    );
  }
}


// Afazeres:

//  Essa semana
//  - Tabelas editaveis do material e ferramenta
//  - Adição de material e ferramenta logica serverpod
//  - Reformulação do modelo calibracao, relação esta errada 
//  - Reformulação do seed já que alguns campos foram atualizados
//  - Tabelas/graficos da pagina relatorios
//  - Rever campos exibidos por algumas Tabelas

//  Pós prova
// - Deixar paginas e tabelas mais bonitas
// - Testar e já deixar um seed para a apresetação
// - Reformular e remover comentários 
// - Se possível criar alguns tests 

// !!!!Sem funcinalidades adicionais nem novas logicas!!!