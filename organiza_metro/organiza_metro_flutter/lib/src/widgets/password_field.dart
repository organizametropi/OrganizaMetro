import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final bool fadePassword;

  final bool hasError;
  final void Function()? onChangedResetError;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.fadePassword,
    this.hasError = false,
    this.onChangedResetError,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  double bottomAnimationValue = 0;
  double opacityAnimationValue = 0;
  bool obscure = true;

  FocusNode node = FocusNode();

  @override
  void initState() {
    node.addListener(() {
      setState(() {
        bottomAnimationValue = node.hasFocus ? 1 : 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double fieldWidth = 500.0;

    return Stack(
      children: [
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 300),
          tween: Tween(begin: 0, end: widget.fadePassword ? 0 : 1),
          builder: (_, value, __) => Opacity(
            opacity: value,
            child: SizedBox(
              width: fieldWidth,
              child: TextFormField(
                controller: widget.passwordController,
                focusNode: node,
                obscureText: obscure,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.hasError ? Colors.red : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: widget.hasError ? Colors.red : Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (value) {
                  if (widget.onChangedResetError != null) {
                    widget.onChangedResetError!();
                  }

                  setState(() {
                    bottomAnimationValue = value.isEmpty ? 0 : 1;
                  });
                },
              ),
            ),
          ),
        ),


        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: widget.fadePassword ? 0 : fieldWidth,
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: bottomAnimationValue),
                duration: const Duration(milliseconds: 500),
                builder: (_, value, __) => SizedBox(
                  height: 2,
                  child: LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    color:
                        widget.hasError ? Colors.red : Colors.blue[800],
                  ),
                ),
              ),
            ),
          ),
        ),

        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: Icon(
                  obscure ? Icons.visibility : Icons.visibility_off,
                  size: 27,
                  color: widget.hasError ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
