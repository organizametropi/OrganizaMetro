import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/acount_page.dart';
import 'package:organiza_metro_flutter/src/widgets/email_field.dart';
import 'package:organiza_metro_flutter/src/widgets/password_field.dart';
import 'package:organiza_metro_flutter/src/widgets/entrar_button.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _tlogin();
}

class _tlogin extends State<loginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  double _elementsOpacity = 1;
  bool loadingBallAppear = false;
  double loadingBallSize = 1;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              'lib/assets/images/metrosp-linha2-verde-anarosa.jpg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: loadingBallAppear
              ? const AccountPage()
              : SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        "lib/assets/images/logo.png",
                        height: 250,
                      ),
                    ),
                    Container(
                      width: 400, // largura fixa ou use maxWidth
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Bem Vindo!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvica'),
                          ),
                          Text(
                            "Faça login para continuar",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 18,
                                fontFamily: 'Helvica'),
                          ),
                          const SizedBox(height: 20),
                          EmailField(
                            fadeEmail: _elementsOpacity == 0,
                            emailController: emailController,
                          ),
                          const SizedBox(height: 20),
                          PasswordField(
                            fadePassword: _elementsOpacity == 0,
                            passwordController: passwordController,
                          ),
                          const SizedBox(height: 30),
                          GetStartedButton(
                            emailController: emailController,
                            passwordController: passwordController,
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
        ),
      ),
    );
  }
}
