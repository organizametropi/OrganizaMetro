import 'package:flutter/material.dart' hide Material;
import 'package:responsive_table/responsive_table.dart';
import 'package:organiza_metro_client/organiza_metro_client.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class estoque_table_material extends StatefulWidget {
  estoque_table_material({super.key});

  @override
  _estoqueTableState createState() => _estoqueTableState();
}

class _estoqueTableState extends State<estoque_table_material> {
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

  List<Map<String, dynamic>> _convertMateriasToMap(List<Material> materiais) {
    return materiais.map((m) {
      return {
        "id": m.id,
        "codigoSap": m.codigoSap,
        "nome": m.nome,
        "descricao": m.descricao,
        "quantidade": m.quantidade,
        "unidadeMedida": m.unidadeMedida?.codigo,
        "base": m.base?.nome ?? "-",
        "veiculo": m.veiculo?.descricao ?? "-",
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
      DatatableHeader(text: "ID", value: "id", show: false, sortable: true),
      DatatableHeader(
          text: "CÓDIGO SAP",
          value: "codigoSap",
          show: true,
          sortable: true,
          flex: 1),
      DatatableHeader(
          text: "NOME",
          value: "nome",
          show: true,
          sortable: true,
          flex: 2,
          sourceBuilder: (value, row) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                value ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.w600),
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
          text: "QTD",
          value: "quantidade",
          show: true,
          sortable: true,
          sourceBuilder: (value, row) {
            final qtd = value == null
                ? 0
                : (value is double
                    ? value
                    : double.tryParse(value.toString()) ?? 0);
            return Align(
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(0.06),
                ),
                child: Text(
                  qtd % 1 == 0
                      ? qtd.toInt().toString()
                      : qtd.toStringAsFixed(2),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            );
          }),
      DatatableHeader(
          text: "UNIDADE",
          value: "unidadeMedida",
          show: true,
          sortable: false,
          flex: 2),
      DatatableHeader(
          text: "BASE",
          value: "base",
          show: true,
          flex: 2,
          sourceBuilder: (value, row) {
            return Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  value ?? '-',
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
          }),
      DatatableHeader(
          text: "VEÍCULO",
          value: "veiculo",
          show: true,
          flex: 2,
          sourceBuilder: (value, row) {
            return Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  value ?? '-',
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
          }),
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
