import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/widgets/tables/estoque_ferramenta_table.dart';
import 'package:organiza_metro_flutter/src/widgets/tables/estoque_material_table.dart';

class estoquePage extends StatefulWidget {
  estoquePage({super.key});

  @override
  _estoquePageState createState() => _estoquePageState();
}

class _estoquePageState extends State<estoquePage> {
  bool initTable =
      true; // tabela-1 TRUE (MATERIAIS), tabela-2 FALSE (Ferramentas)

  void _trocaTabela() {
    setState(() {
      initTable = !initTable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minHeight: 95),
              color: const Color.fromRGBO(0, 20, 137, 0.7),
              child: SizedBox(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 16.0),
                    child: Text(
                      'Estoque 🗄️',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(1.5, 1.5),
                              blurRadius: 3.0,
                              color: Colors.black45,
                            ),
                            Shadow(
                              offset: Offset(-1.0, -1.0),
                              blurRadius: 2.0,
                              color: Colors.black26,
                            ),
                          ]),
                    ),
                  )
                ],
              )),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        height: 65,
                        margin: EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color:
                                        const Color.fromRGBO(0, 20, 137, 0.7),
                                    width: 4.0))),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (!initTable) {
                                    _trocaTabela();
                                  }
                                },
                                icon: const Icon(
                                  Icons.inbox,
                                  color: Colors.white,
                                ),
                                label: const Text('Materiais',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(239, 51, 64, 1),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (initTable) {
                                    _trocaTabela();
                                  }
                                },
                                icon: const Icon(
                                  Icons.handyman,
                                  color: Colors.white,
                                ),
                                label: const Text('Ferramentas',
                                    softWrap: false,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(229, 110, 51, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        // margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(0, 20, 137, 0.7),
                                width: 5)),
                        child: initTable
                            ? estoque_table_material()
                            : estoque_table_ferramenta(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
