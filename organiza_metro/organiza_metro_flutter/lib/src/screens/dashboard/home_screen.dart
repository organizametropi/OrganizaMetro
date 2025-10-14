import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/estoque_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/historico_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/relatorios_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/retirar_material_screen.dart';
import 'package:organiza_metro_flutter/src/widgets/button_home.dart';
import 'package:organiza_metro_flutter/src/widgets/cards/notification_card.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/screens/auth/login_screen.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide =
                  constraints.maxWidth > 600; // breakpoint (ajuste se quiser)
              if (isWide) {
                // 👉 2 botões por linha
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Bem-Vindo _User_Name!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black54),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                              labelText: "Retirar Materiais",
                              goToPage: (context) => retirarMaterialPage(),
                              color: Color.fromRGBO(239, 51, 64, 1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                              labelText: "Estoque",
                              goToPage: (context) => estoquePage(),
                              color: Color.fromRGBO(0,52,28,1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                                labelText: "Instrumentos Técnicos",
                                goToPage: (context) => const loginPage(),
                                color: Color.fromRGBO(229,110,51,1),
                                assetImage: 'lib/assets/images/dataChart.png'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                              labelText: "Meu Histórico",
                              goToPage: (context) => historicoPage(),
                              color: Color.fromRGBO(125, 85, 199, 1),
                            ),
                          ),
                        ),
                      ],
                    ), // A partir daqui apenas para admins
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                                labelText: "Relatórios",
                                goToPage: (context) => relatoriosPage(),
                                color: Color.fromRGBO(255,199,44,1),
                                assetImage: 'lib/assets/images/dataChart.png'),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                              labelText: "Administração",
                              goToPage: (context) => const loginPage(),
                              color: Color.fromRGBO(0,26,144,1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                              color: const Color.fromRGBO(0, 20, 137, 1)),
                        ),
                      ],
                    ),
                    Column(children: [
                      Row(
                        children: [
                          Text(
                            'Alertas/notificações',
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                color: Colors.black54),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 105,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sem alertas/notificações no momento', //caso Vazio
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black38)),
                        ],
                      ),
                       SizedBox(
                        height: 105,
                      )
                    ])
                  ],
                );
              } else {
                // 👉 Em telas menores → todos empilhados
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Bem-Vindo _User_Name!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black54),
                        )
                      ],
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Retirar Materiais",
                        goToPage: (context) => retirarMaterialPage(),
                        color: Color.fromRGBO(239, 51, 64, 1),
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Estoque",
                        goToPage: (context) => estoquePage(),
                        color: Color.fromRGBO(0,52,28,1),
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                          labelText: "Instrumentos Técnicos",
                          goToPage: (context) => const loginPage(),
                          color: Color.fromRGBO(229,110,51,1),
                          assetImage: 'lib/assets/images/dataChart.png'),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Meu Histórico",
                        goToPage: (context) => historicoPage(),
                        color:Color.fromRGBO(125, 85, 199, 1),
                      ),
                    ), // A partir daqui apenas para admins
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Relátorios",
                        goToPage: (context) => const loginPage(),
                        color: Color.fromRGBO(255,199,44,1),
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Administração",
                        goToPage: (context) => const loginPage(),
                        color: Color.fromRGBO(0,26,144,1),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                              color: const Color.fromRGBO(0, 20, 137, 1)),
                        ),
                      ],
                    ),
                     Column(children: [
                      Row(
                        children: [
                          Text(
                            'Alertas/notificações',
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                                color: Colors.black54),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 52,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sem alertas/notificações no momento', //caso Vazio
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black38)),
                        ],
                      ),
                       SizedBox(
                        height: 52,
                      )
                    ])
                  ],
                );
              }
            },
          ),
        ),
      ),
    ));
  }
}
