import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/cards/user_history.dart';
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
              UserHistoryWidget()
            ],
          ),
        )));
  }
}
