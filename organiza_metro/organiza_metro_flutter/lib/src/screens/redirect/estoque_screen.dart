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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estoque 🗄️',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  )
                ],
              ),
              Container(
                height: 65,
                margin: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 4.0))),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: 180,
                        margin: EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: 'botão Materiais',
                          onPressed: () {
                            if (!initTable) {
                              _trocaTabela();
                            }
                          },
                          child: Text('Materiais'),
                        ),
                      ),
                    ),
                    Container(
                      width: 4,
                      height: 65,
                      color: Colors.black,
                    ),
                    Flexible(
                      child: Container(
                        width: 180,
                        margin: EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: "Botão ferramentas",
                          onPressed: () {
                            if (initTable) {
                              _trocaTabela();
                            }
                          },
                          child: Text('Ferramentas'),
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
                    border: Border.all(color: Colors.black, width: 5)),
                child: initTable
                    ? estoque_table_material()
                    : estoque_table_ferramenta(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
