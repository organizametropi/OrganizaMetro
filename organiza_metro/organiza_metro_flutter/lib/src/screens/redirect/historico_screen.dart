import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';

class historicoPage extends StatefulWidget {
  historicoPage({super.key});

  @override
  _historicoPageState createState() => _historicoPageState();
}

class _historicoPageState extends State<historicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Historico 📝',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  )
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Divider(color: const Color.fromRGBO(0, 20, 137, 1)),
              SizedBox(
                height: 8.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meu Histórico: ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )
                ],
              ),
              Row(
                children: [
                  Flexible(
                  child: Text(
                    'Suas ultimas movimentações apareceram aqui',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: 500.0, minWidth: 500.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sem movimentações no momento',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
