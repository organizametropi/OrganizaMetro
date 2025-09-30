import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/button_home.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/screens/auth/login_screen.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePage();
}

class _homePage extends State<homePage> {
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                              labelText: "Estoque de Materiais",
                              goToPage: (context) => const loginPage(),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                              labelText: "Instrumentos Técnicos",
                              goToPage: (context) => const loginPage(),
                              color: Colors.green,
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
                              labelText: "Relatórios & Dashboards",
                              goToPage: (context) => const loginPage(),
                              color: Colors.orange,
                              assetImage: 'lib/assets/images/dataChart.png'
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                              labelText: "Configurações / Administração",
                              goToPage: (context) => const loginPage(),
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                // 👉 Em telas menores → todos empilhados
                return Column(
                  children: [
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Estoque de Materiais",
                        goToPage: (context) => const loginPage(),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Instrumentos Técnicos",
                        goToPage: (context) => const loginPage(),
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Relatórios & Dashboards",
                        goToPage: (context) => const loginPage(),
                        color: Colors.orange,
                        assetImage: 'lib/assets/images/dataChart.png'
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Configurações / Administração",
                        goToPage: (context) => const loginPage(),
                        color: Colors.red,
                      ),
                    ),
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
