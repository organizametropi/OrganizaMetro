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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        'Historico 📝',
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
              SizedBox(
                height: 8.0,
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    UserHistoryWidget(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
