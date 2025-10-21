import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/widgets/tables/estoque_material_table.dart';

class relatoriosPage extends StatefulWidget {
  relatoriosPage({super.key});

  @override
  _relatoriosPageState createState() => _relatoriosPageState();
}

class _relatoriosPageState extends State<relatoriosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'Relatórios 📊',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Container(
                height: 65,
                margin: EdgeInsets.only(top: 8.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 4.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Container(
                        width: 180,
                        margin: EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: 'botão Materiais',
                          onPressed: () {},
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
                          onPressed: () {},
                          child: Text('Ferramentas'),
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
                          heroTag: "Botão RelatoriosGerais",
                          onPressed: () {},
                          child: Text('Relatorio Geral'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(height: 200, child: Text('Aqui vai o grafico Linear')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(width: 900, child: estoque_table_material()),
                      ],
                    ),
                  ),
                ]),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(height: 200, child: Text('Aqui vai o grafico pizza')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(height: 200,child: Text('Aqui vai o grafico barra')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(height: 200, child: Text('mais informações')),
                        ],
                      ),
                    ),
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
