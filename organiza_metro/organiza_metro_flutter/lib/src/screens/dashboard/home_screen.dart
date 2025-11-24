import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/admin_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/estoque_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/ferramenta_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/historico_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/relatorios_screen.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/retirar_material_screen.dart';
import 'package:organiza_metro_flutter/src/widgets/button_home.dart';
import 'package:organiza_metro_flutter/src/widgets/cards/user_notifications_home.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/services/auth_service.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  final AuthService _auth = AuthService();

  bool _isAdmin = false;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final isAdmin = await _auth.getIsAdmin();
    final userName = await _auth.getUserName();

    if (!mounted) return;

    setState(() {
      _isAdmin = isAdmin;
      _userName = userName;
    });
  }

  @override
  void dispose() {
    super.dispose();
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
                'Bem-Vindo ${_userName ?? ""}!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: isWide ? 20 : 18,
                    color: Colors.black54),
              );

              final adminButtons = [
                Container(
                  height: 160,
                  margin: const EdgeInsets.all(8),
                  child: ButtonHomeTemplate(
                    labelText: "Relatórios",
                    goToPage: (context) => relatoriosPage(),
                    color: Color.fromRGBO(125, 85, 199, 1),
                    assetImage: 'lib/assets/images/dataChart.png',
                  ),
                ),
                Container(
                  height: 160,
                  margin: const EdgeInsets.all(8),
                  child: ButtonHomeTemplate(
                      labelText: "Administração",
                      goToPage: (context) => const AdminPage(),
                      color: const Color.fromRGBO(0, 26, 144, 1),
                      assetImage:
                          'lib/assets/images/admin-settings-male-removebg-preview.png'),
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
                              assetImage: 'lib/assets/images/8256654.png',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                                labelText: "Ferramentas e Instrumentos",
                                goToPage: (context) => const FerramentaPage(),
                                color: const Color.fromRGBO(255, 199, 44, 1),
                                assetImage: 'lib/assets/images/1935672.png'),
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
                              labelText: "Estoque",
                              goToPage: (context) => estoquePage(),
                              color: Color.fromRGBO(0, 52, 28, 1),
                              assetImage: 'lib/assets/images/storage-files-icon-outline-storage-files-vector-icon-color-flat-isolated_96318-114906-removebg-preview.png',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 160,
                            margin: const EdgeInsets.all(8),
                            child: ButtonHomeTemplate(
                              labelText: "Histórico",
                              goToPage: (context) => historicoPage(),
                              color: Color.fromRGBO(229, 110, 51, 1),
                              assetImage: 'lib/assets/images/download-digital-book-icon-color-outline-vector-removebg-preview.png',
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        height: 15,
                      ),
                      UserNotificationsArea(),
                      SizedBox(
                        height: 25,
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
                        assetImage: 'lib/assets/images/8256654.png',
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                          labelText: "Ferramentas e Instrumentos",
                          goToPage: (context) => const FerramentaPage(),
                          color: const Color.fromRGBO(255, 199, 44, 1),
                          assetImage: 'lib/assets/images/1935672.png'),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Estoque",
                        goToPage: (context) => estoquePage(),
                        color: Color.fromRGBO(0, 52, 28, 1),
                        assetImage: 'lib/assets/images/storage-files-icon-outline-storage-files-vector-icon-color-flat-isolated_96318-114906-removebg-preview.png',
                      ),
                    ),
                    Container(
                      height: 160,
                      margin: const EdgeInsets.all(8),
                      child: ButtonHomeTemplate(
                        labelText: "Histórico",
                        goToPage: (context) => historicoPage(),
                        color: Color.fromRGBO(229, 110, 51, 1),
                        assetImage: 'lib/assets/images/download-digital-book-icon-color-outline-vector-removebg-preview.png',
                      ),
                    ),
                    if (_isAdmin) ...[
                      Container(
                        height: 160,
                        margin: const EdgeInsets.all(8),
                        child: adminButtons[0].child,
                      ),
                      Container(
                        height: 160,
                        margin: const EdgeInsets.all(8),
                        child: adminButtons[1].child,
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
                        height: 15,
                      ),
                      UserNotificationsArea(),
                      SizedBox(
                        height: 25,
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
