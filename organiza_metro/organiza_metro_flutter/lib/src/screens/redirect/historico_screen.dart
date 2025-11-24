import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/page_subtitle.dart';
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
              PageSubtitleBar(title: 'Historico'),
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
