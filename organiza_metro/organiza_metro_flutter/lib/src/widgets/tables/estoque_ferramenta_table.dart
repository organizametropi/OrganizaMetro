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

  List<Map<String, dynamic>> _convertFerramentasToMap(
      List<Ferramenta> ferramenta) {
    return ferramenta.map((m) {
      return {
        "id": m.id,
        "codigoSap": m.codigoSap,
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
          flex: 1),
      DatatableHeader(
          text: "DESCRIÇÃO",
          value: "descricao",
          show: true,
          flex: 2,
          sortable: false,
          sourceBuilder: (value, row) {
            return Center(
              child: Text(
                value ?? "",
                style: const TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.3,
                ),
                overflow:
                    TextOverflow.ellipsis, // corta com "..." se for muito longo
                maxLines: 2, // evita quebrar layout
              ),
            );
          }),
      DatatableHeader(
        text: "Em uso",
        value: "emUso",
        show: true,
        sortable: false,
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
        sourceBuilder: (value, row) {
          final String status = (value ?? "").toString().toLowerCase();

          Color borderColor;
          Color textColor;
          Color backgroundColor;

          switch (status) {
            case "em uso":
              borderColor = Colors.green.shade600;
              textColor = Colors.green.shade800;
              backgroundColor = Colors.green.withOpacity(0.1);
              break;
            case "em movimentação":
              borderColor = Colors.blue.shade600;
              textColor = Colors.blue.shade800;
              backgroundColor = Colors.blue.withOpacity(0.1);
              break;
            case "empenhada":
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
            child: Text(
              displayText,
              style: const TextStyle(
                fontFamily: 'Helvetica',
                fontSize: 14,
                color: Colors.black87,
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
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              maxHeight: 700,
            ),
            child: Card(
              elevation: 1,
              shadowColor: Colors.black,
              clipBehavior: Clip.none,
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
                              icon: Icon(Icons.search), onPressed: () {})),
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
                dropContainer: (data) {
                  if (int.tryParse(data['id'].toString())!.isEven) {
                    return Text("is Even");
                  }
                  return _DropDownContainer(data: data);
                },
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
                sortAscending: _sortAscending,
                sortColumn: _sortColumn,
                isLoading: _isLoading,
                onSelect: (value, item) {
                  if (value!) {
                    setState(() => _selecteds =
                        _source.map((entry) => entry).toList().cast());
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
        ]));
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
          Spacer(),
          Text(entry.value.toString()),
        ],
      );
      return w;
    }).toList();

    return Container(
      /// height: 100,
      child: Column(
        /// children: [
        ///   Expanded(
        ///       child: Container(
        ///     color: Colors.red,
        ///     height: 50,
        ///   )),

        /// ],
        children: _children,
      ),
    );
  }
}
