import 'package:flutter/material.dart' hide Material;
import 'package:responsive_table/responsive_table.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class estoque_table_ferramenta extends StatefulWidget {
  estoque_table_ferramenta({super.key});

  @override
  _estoqueTableState createState() => _estoqueTableState();
}

class _estoqueTableState extends State<estoque_table_ferramenta> {
  late List<DatatableHeader> _headers;

  List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 20;
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

  List<Map<String, dynamic>> _convertFerramentasToMap(
      List<Ferramenta> ferramenta) {
    return ferramenta.map((m) {
      return {
        "id": m.id,
        "codigoSap": m.codigoSap,
        "patrimonio": m.patrimonio,
        "nome": m.nome,
        "descricao": m.descricao,
        "emUso": m.emUso,
        "tipo": m.tipo?.nome,
        "status": m.status,
        "base": m.base?.nome,
        "veiculo": m.veiculo?.descricao //Fazer serverpod generate
      };
    }).toList();
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    setState(() => _isLoading = true);
    try {
      final List<Ferramenta> ferramenta = await client.ferramenta.getEstoque();

      _sourceOriginal.clear();
      _sourceOriginal.addAll(_convertFerramentasToMap(ferramenta));

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
          text: "ID",
          value: "id",
          show: false,
          sortable: true), // Adicionado sortable
      DatatableHeader(
          text: "CÓDIGO SAP",
          value: "codigoSap",
          show: true,
          sortable: true,
          flex: 1,
          sourceBuilder: (value, row) {
            return Center(
              child: Text(
                value.toString() ?? "-",
                style: const TextStyle(
                  fontFamily: 'RobotoMono',
                  fontSize: 13,
                  color: Colors.black87,
                ),
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
          text: "NOME",
          value: "nome",
          show: true,
          flex: 2,
          sortable: true,
          sourceBuilder: (value, row) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                value ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
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
        text: "Em uso",
        value: "emUso",
        show: true,
        sortable: false,
        flex: 2,
        sourceBuilder: (value, row) {
          final bool emUso = value == true;

          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: emUso ? Colors.green : Colors.red,
                width: 2,
              ),
              color: (emUso ? Colors.green : Colors.red).withOpacity(0.1),
            ),
            child: Center(
              child: Text(
                emUso ? "Sim" : "Não",
                style: TextStyle(
                  color: emUso ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
      DatatableHeader(
        text: "Tipo",
        value: "tipo",
        show: true,
        sortable: false,
        flex: 2,
        sourceBuilder: (value, row) {
          return Center(
            child: Text(
              value.toUpperCase() ?? "",
              style: const TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14,
                color: Colors.black87,
                height: 1.3,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          );
        },
      ),
      DatatableHeader(
        text: "Status",
        value: "status",
        show: true,
        sortable: false,
        flex: 2,
        sourceBuilder: (value, row) {
          final String status = (value ?? "").toString();

          Color borderColor;
          Color textColor;
          Color backgroundColor;

          switch (status) {
            case "Disponível":
              borderColor = Colors.green.shade600;
              textColor = Colors.green.shade800;
              backgroundColor = Colors.green.withOpacity(0.1);
              break;
            case "Em calibração":
              borderColor = Colors.blue.shade600;
              textColor = Colors.blue.shade800;
              backgroundColor = Colors.blue.withOpacity(0.1);
              break;
            case "Em reposição":
              borderColor = Colors.blue.shade600;
              textColor = Colors.blue.shade800;
              backgroundColor = Colors.blue.withOpacity(0.1);
              break;
            case "Empenhada":
              borderColor = Colors.orange.shade600;
              textColor = Colors.orange.shade800;
              backgroundColor = Colors.orange.withOpacity(0.1);
              break;
            default:
              borderColor = Colors.grey.shade500;
              textColor = Colors.grey.shade800;
              backgroundColor = Colors.grey.withOpacity(0.1);
          }

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor, width: 1.5),
              color: backgroundColor,
            ),
            child: Center(
              child: Text(
                value ?? "-",
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: textColor,
                ),
              ),
            ),
          );
        },
      ),
      DatatableHeader(
        text: "Origem",
        value: "origem",
        show: true,
        flex: 3,
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

          return Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                displayText,
                softWrap: true,
                maxLines: 10,
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

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
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
                              reponseScreenSizes: [ScreenSize.xs],
                              actions: [
                                if (_isSearch)
                                  Expanded(
                                      child: TextField(
                                    decoration: InputDecoration(
                                        hintText:
                                            'Enter search term based on ${_searchKey!.replaceAll(RegExp('[\\W_]+'), ' ').toUpperCase()}',
                                        prefixIcon: IconButton(
                                            icon: Icon(Icons.cancel),
                                            onPressed: () {
                                              setState(() {
                                                _isSearch = false;
                                              });
                                              _initializeData();
                                            }),
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.search),
                                            onPressed: () {})),
                                    onSubmitted: (value) {
                                      _filterData(value);
                                    },
                                  )),
                                if (!_isSearch)
                                  IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {
                                        setState(() {
                                          _isSearch = true;
                                        });
                                      })
                              ],
                              headers: _headers,
                              source: _source,
                              selecteds: _selecteds,
                              showSelect: _showSelected,
                              autoHeight: false,
                              onChangedRow: (value, header) {},
                              onSubmittedRow: (value, header) {},
                              onTabRow: (data) {},
                              onSort: (value) {
                                setState(() => _isLoading = true);

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

                                  _isLoading = false;
                                });
                              },
                              expanded: _expanded,
                              sortAscending: _sortAscending,
                              sortColumn: _sortColumn,
                              isLoading: _isLoading,
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
                    isLoading: _isLoading,
                    selecteds: _selecteds,
                    expanded: _expanded,
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

                        _isLoading = false;
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
