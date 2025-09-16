import 'package:flutter/material.dart';

class ButtonHomeTemplate extends StatefulWidget {
  final String labelText;
  final Widget Function(BuildContext) goToPage;
  final Color color;

  const ButtonHomeTemplate({
    super.key,
    required this.labelText,
    required this.goToPage,
    required this.color,
  });

  @override
  State<ButtonHomeTemplate> createState() => _ButtonHomeTemplateState();
}

class _ButtonHomeTemplateState extends State<ButtonHomeTemplate> {
  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: widget.color),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: widget.goToPage),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.labelText,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Helvica',
                fontSize: 19,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 26,
            )
          ],
        ),
      ),
    ));
  }
}
