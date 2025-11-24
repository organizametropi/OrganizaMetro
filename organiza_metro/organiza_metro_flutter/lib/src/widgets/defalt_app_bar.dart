import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/home_screen.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize;
    double toolbarH;

    if (screenWidth >= 1400) {
      titleFontSize = 30;
      toolbarH = 96;
    } else if (screenWidth >= 1000) {
      titleFontSize = 26;
      toolbarH = 80;
    } else if (screenWidth >= 700) {
      titleFontSize = 22;
      toolbarH = 72;
    } else {
      titleFontSize = 18;
      toolbarH = kToolbarHeight;
    }

    return AppBar(
      toolbarHeight: toolbarH,
      backgroundColor: const Color.fromRGBO(0, 20, 137, 1),
      shadowColor: Colors.black,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => homePage()),
            (route) => false,
          );
        },
        child: Text(
          'Organiza Metrô 📦',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Helvetica',
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: const [
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
      ),


      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: PopupMenuButton<String>(
            offset: const Offset(0, 50),
            tooltip: "Menu de usuário",

            onSelected: (value) async {
              if (value == "sair") {
                await sessionManager.signOutDevice();
              }
            },

            itemBuilder: (context) => [
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

            // avatar vira botão do PopupMenu
            child: CircularUserImage(
              userInfo: sessionManager.signedInUser,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
