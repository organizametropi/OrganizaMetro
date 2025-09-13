import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/acount_page.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class GetStartedButton extends StatefulWidget {
 final TextEditingController emailController;
final TextEditingController passwordController;

  const GetStartedButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  bool _loading = false;
  String? _error;
  double elementsOpacity = 1; 

  Future<void> _signIn() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final emailauth = EmailAuthController(client.modules.auth);
      final session = await emailauth.signIn(widget.emailController.text
      , widget.passwordController.text); 

      if (session == null) {
        setState(() => _error = "Falha ao autenticar");
      } else {
        // Aqui você já pode navegar para a Home, por exemplo
        if (mounted) {
          AccountPage();
        }
      }
    } catch (e) {
      setState(() => _error = "Erro: $e");
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 1, end: elementsOpacity),
      builder: (_, value, __) => Opacity(
        opacity: value,
        child: SizedBox(
          width: 230,
          height: 75,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(0, 20, 137, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _loading ? null : _signIn,
            child: _loading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Entrar",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
