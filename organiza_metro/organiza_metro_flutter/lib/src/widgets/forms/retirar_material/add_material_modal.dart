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
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  bool _isLoading = true;
  int _total = 0;

  @override
  void initState() {
    super.initState();
    _setHeaders();
    _loadAvailableMaterials();
  }

  void _setHeaders() {
    _headers = [
      DatatableHeader(
          text: "CÓDIGO SAP", value: "codigoSap", show: true, sortable: true),
      DatatableHeader(
          text: "DESCRIÇÃO",
          value: "descricao",
          show: true,
          flex: 2,
          sortable: true),
      DatatableHeader(
          text: "QTD", value: "quantidade", show: true, sortable: true),
    ];
  }

  Future<void> _loadAvailableMaterials() async {
    setState(() => _isLoading = true);
    try {
      // 🚨 CHAMADA AO SERVERPOD (usando o cliente global)
      final List<Material> materials = await client.material.getEstoque();

      // Converte objetos Serverpod para o formato Map
      _source = materials
          .map((m) => {
                "id": m.id,
                "codigoSap": m.codigoSap,
                "descricao": m.descricao,
                "quantidade": m.quantidade,
              })
          .toList();

      _total = _source.length;
    } catch (e) {
      // Adicione um feedback visual para o usuário em caso de erro real
      print("Erro ao carregar materiais para o modal: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Lista: $_source fim'); // ta puxando uma lista vazia e depois enche
    return AlertDialog(
      title: const Text('Selecionar Materiais Disponíveis'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            Expanded(
              child: ResponsiveDatatable(
                  headers: _headers,
                  source: _source,
                  selecteds: _selecteds,
                  showSelect: true,
                  isLoading: _isLoading,
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
