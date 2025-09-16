import 'package:flutter/material.dart';

class ButtonHomeTemplate extends StatefulWidget {
  final String labelText;
  final Widget Function(BuildContext) goToPage;
  final Color color;
  final String?
      assetImage; // caminho opcional de uma imagem local (ex: assets/img.png)

  const ButtonHomeTemplate({
    super.key,
    required this.labelText,
    required this.goToPage,
    required this.color,
    this.assetImage,
  });

  @override
  State<ButtonHomeTemplate> createState() => _ButtonHomeTemplateState();
}

class _ButtonHomeTemplateState extends State<ButtonHomeTemplate> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: widget.color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: widget.goToPage),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.assetImage != null) // só mostra se houver imagem
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Image.asset(
                widget.assetImage!,
                width: 28, // ajuste do tamanho
                height: 28,
              ),
            ),
          Text(
            widget.labelText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Helvetica',
              fontSize: 19,
              color: Colors.white,
            ),
          ),
          const Spacer(), // empurra o ícone para a extrema direita
          const Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
            size: 26,
          ),
        ],
      ),
    );
  }
}
