import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:organiza_metro_flutter/src/widgets/acount_page.dart';
import 'package:organiza_metro_flutter/src/widgets/button_home.dart';
import 'package:organiza_metro_flutter/src/widgets/screen_login.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePage();
}

class _homePage extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text('home'),
        actions: [
  Padding(
      padding: const EdgeInsets.only(right: 16),
      child: PopupMenuButton<String>(
        offset: Offset(0, 50),
        tooltip: 'Menu de perfil',
        onSelected: (value) {
          if (value == 'perfil') {
            // ação perfil
          } else if (value == 'sair') {
            // ação sair
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'perfil',
            child: Text('Perfil'),
          ),
          PopupMenuItem(
            value: 'sair',
            child: Text('Sair'),
          ),
        ],
        child: CircularUserImage(
          userInfo: sessionManager.signedInUser,
          size: 42,
        ),
      ),
    )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 250,
                  width: 500,
                  child: ButtonHomeTemplate(
                    labelText: "Teste",
                    goToPage: (context) => const loginPage(),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 250,
                  width: 500,
                  child: ButtonHomeTemplate(
                    labelText: "Teste",
                    goToPage: (context) => const loginPage(),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 250,
                  width: 500,
                  child: ButtonHomeTemplate(
                    labelText: "Teste",
                    goToPage: (context) => const loginPage(),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
