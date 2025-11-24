import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/home_screen.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';

class GetStartedButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final void Function(String? errorMessage)? onError;

  const GetStartedButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.onError, 
  });

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  bool _loading = false;
  String? _error;
  double elementsOpacity = 1;

    Future<void> _signIn() async {
    final email = widget.emailController.text.trim();
    final pass = widget.passwordController.text.trim();

    // Validação rápida antes de chamar o servidor
    if (email.isEmpty || pass.isEmpty) {
      _triggerError("Preencha todos os campos.");
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final emailauth = EmailAuthController(client.modules.auth);
      final session = await emailauth.signIn(email, pass);

      if (session == null) {
        _triggerError("Usuário ou senha inválidos.");
      } else {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const homePage()),
          );
        }
      }
    } catch (e) {
      _triggerError("Erro ao autenticar.");
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

   void _triggerError(String message) {
    setState(() => _error = message);
    if (widget.onError != null) widget.onError!(message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _error == null
              ? const SizedBox.shrink()
              : Padding(
                  key: ValueKey(_error),
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    _error!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
