import 'package:flutter/material.dart';
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
      title: const Text('home'),
      backgroundColor: const Color.fromRGBO(0, 20, 137, 0.6),
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
