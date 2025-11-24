import 'package:flutter/material.dart';

class PageSubtitleBar extends StatelessWidget {
  final String title;

  const PageSubtitleBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Tamanhos responsivos
    double fontSize = 42;
    if (width < 350) {
      fontSize = 22;
    } else if (width < 500) {
      fontSize = 28;
    } else if (width < 800) {
      fontSize = 34;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width < 500 ? 18 : 22,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 20, 137, 0.7),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 6,
          )
        ],
      ),
      child: Text(
        title,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: Colors.white,
          height: 1.1,
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
    );
  }
}
