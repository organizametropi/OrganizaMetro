import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';

class ferramentaDetails extends StatefulWidget {
  ferramentaDetails({super.key});

  @override
  _ferramentaDetailsState createState() => _ferramentaDetailsState();
}

class _ferramentaDetailsState extends State<ferramentaDetails> {
  //params

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Alinha tudo à esquerda
                    children: [
                      Row(
                        // Esta Row é usada para o ícone e o nome do cliente
                        children: [
                          CircleAvatar(
                              // Imagem do cliente
                              ),
                          SizedBox(width: 8),
                          Column(
                            // Esta Column agrupa o nome e o email
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('v varadhaghan',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('balavardhaghan@gmail.com'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      // Agora, os outros cards não precisam de Rows para cada linha
                      Text('Contact Person',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('v varadhaghan'),
                      Text('balavardhaghan@gmail.com'),
                      Text('99148648689'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
