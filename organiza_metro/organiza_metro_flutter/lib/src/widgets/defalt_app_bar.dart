import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/home_screen.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/acount_page.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homePage()),
              );
            },
            icon: Image.asset(
              "lib/assets/images/logocfundo.png",
              width: 75.0,
              height: 56.0,
            ),
          )),
      shadowColor: Colors.black,
      title: const Text(
        'Organiza Metrô',
        style: TextStyle(
          fontFamily: 'Helvetica',
          fontSize: 24,
          fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(0, 20, 137, 1),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: PopupMenuButton<String>(
            offset: const Offset(0, 50),
            tooltip: 'Menu de perfil',
            onSelected: (value) {
              if (value == 'perfil') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountPage(),
                    ));
              } else if (value == 'sair') {
                sessionManager.signOutDevice();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'perfil',
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.black54),
                  title: const Text(
                    'Perfil',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'sair',
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.redAccent),
                  title: const Text(
                    'Sair',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
            child: CircularUserImage(
              userInfo: sessionManager.signedInUser,
              size: 42,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
