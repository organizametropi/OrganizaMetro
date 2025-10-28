import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/admin_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/estoque_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/ferramenta_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/historico_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/relatorios_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/retirar_material_screen.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:organiza_metro_flutter/src/widgets/button_home.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/screens/auth/login_screen.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  bool _isAdmin = false;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    try {
      final isAdmin = await client.authUtils.isAdmin();
      final name = await client.authUtils.getUserName();
      setState(() {
        _isAdmin = isAdmin;
        _userName = name ?? 'Usuário';
      });
    } catch (e) {
      print('Erro ao buscar info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 600;

              final welcomeText = Text(
                // 🚨 Usa o nome carregado
                'Bem-Vindo ${_userName ?? ""}!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isWide ? 20 : 18,
                    color: Colors.black54),
              );

              // 3. Define os botões de Admin que serão usados nos dois layouts
              final adminButtons = [
                // 🚨 Botão Relatórios (visível SOMENTE para Admin)

                Container(
                  height: 160,
                  margin: const EdgeInsets.all(8),
                  child: ButtonHomeTemplate(
                    labelText: "Relatórios",
                    goToPage: (context) => relatoriosPage(),
                    color: const Color.fromRGBO(255, 199, 44, 1),
                    assetImage: 'lib/assets/images/dataChart.png',
                  ),
                ),

                // 🚨 Botão Administração (visível SOMENTE para Admin)

                Container(
                  height: 160,
                  margin: const EdgeInsets.all(8),
                  child: ButtonHomeTemplate(
                    labelText: "Administração",
                    goToPage: (context) =>
                        const AdminPage(), // Altere para a tela de admin correta
                    color: const Color.fromRGBO(0, 26, 144, 1),
                  ),
                ),
              ];

              if (isWide) {
                return Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [welcomeText]),
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
                              color: Color.fromRGBO(0, 52, 28, 1),
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
                                goToPage: (context) => const FerramentaPage(),
                                color: Color.fromRGBO(229, 110, 51, 1),
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
                    if (_isAdmin)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: adminButtons
                            .map((btn) => Expanded(child: btn))
                            .toList(),
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
                          Text(
                              'Sem alertas/notificações no momento', //caso Vazio
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
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        welcomeText,
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
                        color: Color.fromRGBO(0, 52, 28, 1),
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                          labelText: "Instrumentos Técnicos",
                          goToPage: (context) => const FerramentaPage(),
                          color: Color.fromRGBO(229, 110, 51, 1),
                          assetImage: 'lib/assets/images/dataChart.png'),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Meu Histórico",
                        goToPage: (context) => historicoPage(),
                        color: Color.fromRGBO(125, 85, 199, 1),
                      ),
                    ), // A partir daqui apenas para admins
                    if (_isAdmin) ...[
                      Container(
                        height: 160,
                        margin: const EdgeInsets.all(8),
                        child: adminButtons[0].child, // Relatórios
                      ),
                      Container(
                        height: 160,
                        margin: const EdgeInsets.all(8),
                        child: adminButtons[1].child, // Administração
                      ),
                    ],
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
                          Text(
                              'Sem alertas/notificações no momento', //caso Vazio
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
