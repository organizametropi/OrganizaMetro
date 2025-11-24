import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  final bool fadeEmail;
  final TextEditingController emailController;
  final bool hasError;
  final void Function()? onChangedResetError;

  const EmailField({
    super.key,
    required this.emailController,
    required this.fadeEmail,
    this.hasError = false,
    this.onChangedResetError,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField>
     with SingleTickerProviderStateMixin {
  double bottomAnimationValue = 0;
  double opacityAnimationValue = 0;
  EdgeInsets paddingAnimationValue = const EdgeInsets.only(top: 22);

  late AnimationController _animationController;
  late Animation<Color?> _animation;

  FocusNode node = FocusNode();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    final tween = ColorTween(
      begin: Colors.white,
      end: Colors.green[900],
    );

    _animation = tween.animate(_animationController)
      ..addListener(() => setState(() {}));

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
          tween: Tween(begin: 0, end: widget.fadeEmail ? 0 : 1),
          builder: (_, value, __) => Opacity(
            opacity: value,
            child: SizedBox(
              width: fieldWidth,
              child: TextFormField(
                controller: widget.emailController,
                focusNode: node,
                decoration: InputDecoration(
                  hintText: "Email",
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
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  if (widget.onChangedResetError != null) {
                    widget.onChangedResetError!();
                  }

                  if (value.isNotEmpty && isValidEmail(value)) {
                    setState(() {
                      bottomAnimationValue = 0;
                      opacityAnimationValue = 1;
                      paddingAnimationValue = const EdgeInsets.only(top: 0);
                    });
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                    setState(() {
                      bottomAnimationValue = value.isEmpty ? 0 : 1;
                      opacityAnimationValue = 0;
                      paddingAnimationValue = const EdgeInsets.only(top: 22);
                    });
                  }
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
              width: widget.fadeEmail ? 0 : fieldWidth,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: bottomAnimationValue),
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) => SizedBox(
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
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 500),
            padding: paddingAnimationValue,
            child: Opacity(
              opacity: widget.fadeEmail ? 0 : 1,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Icon(
                  Icons.check_rounded,
                  size: 27,
                  color: widget.hasError ? Colors.red : _animation.value,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@metrosp\.com$').hasMatch(email);
  }
}
