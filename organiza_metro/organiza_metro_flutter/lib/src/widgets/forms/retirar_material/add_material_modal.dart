// Modal de seleção com a tabela do ResponsiveDatatable
import 'package:flutter/material.dart' hide Material;
import 'package:responsive_table/responsive_table.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class AddMaterialModal extends StatefulWidget {
  final Function(List<Map<String, dynamic>>) onMaterialsSelected;

  const AddMaterialModal({required this.onMaterialsSelected});

  @override
  State<AddMaterialModal> createState() => __AddMaterialModalState();
}

class __AddMaterialModalState extends State<AddMaterialModal> {
  // Variáveis de estado para a tabela no modal
  List<DatatableHeader> _headers = [];
  List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  bool _isLoading = true;
  int _total = 0;
  String? _sortColumn;
  bool _sortAscending = true;
  String? _searchKey = "id";
  int? _currentPerPage = 20;
  int _currentPage = 1;
  List<bool>? _expanded;

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
      print("Materiais recebidos: ${materiais.length}");

      _sourceOriginal.clear();
      _sourceOriginal.addAll(_convertMateriasToMap(materiais));

      _sourceFiltered = _sourceOriginal;
      _total = _source.length;

      var _rangeTop = _currentPerPage! < _sourceFiltered.length
          ? _sourceFiltered.length - (_sourceFiltered.length - _currentPerPage!)
          : _sourceFiltered.length;
      _expanded = List.generate(_rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, _rangeTop).toList();

      print("Lista materias: $_source");
    } catch (e) {
      print("Erro ao buscar os dados no estoque: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();

    //setHeaders
    _headers = [
      DatatableHeader(
          text: "ID",
          value: "id",
          show: false,
          sortable: false), // Adicionado sortable
      DatatableHeader(
          text: "CÓDIGO SAP",
          value: "codigoSap",
          show: true,
          sortable: false,
          flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO",
          value: "descricao",
          show: true,
          flex: 2,
          sortable: false),
      DatatableHeader(
          text: "QTD", value: "quantidade", show: true, sortable: true),
      DatatableHeader(
          text: "UNIDADE", value: "unidadeMedida", show: true, sortable: false),
    ];

    _initializeData();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Selecionar Materiais Disponíveis'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            Expanded(
              child: _source.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ResponsiveDatatable(
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
                            _selecteds.add(item);
                          } else {
                            _selecteds
                                .removeWhere((map) => map["id"] == item["id"]);
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
                          var _rangeTop =
                              _currentPerPage! < _sourceFiltered.length
                                  ? _currentPage!
                                  : _sourceFiltered.length;
                          _source =
                              _sourceFiltered.getRange(0, _rangeTop).toList();
                          _searchKey = value;

                          _isLoading = false;
                        });
                      },
                      expanded: _expanded,
                      footers: [
                        Text('Total de ${_total} materiais.'),
                      ]),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          // Botão que chama o callback e retorna os dados
          onPressed: _selecteds.isEmpty
              ? null
              : () => widget.onMaterialsSelected(_selecteds),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text('Adicionar (${_selecteds.length})',
              style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
