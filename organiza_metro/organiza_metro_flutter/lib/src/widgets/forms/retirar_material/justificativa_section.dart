import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';

class JustificativaSection extends StatelessWidget {
  final RetirarMaterialController controller;

  const JustificativaSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: TextFormField(
            onChanged: controller.updateJustificativa,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 5,
            maxLength: 2000,
            decoration: const InputDecoration(
              labelText: 'Descrição detalhada',
              hintText: 'Digite aqui a sua descrição...',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0)),
              alignLabelWithHint: true,
            ),
          ),
        ),
        Positioned(
          top: -15,
          left: -8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: const Text(
              'Justificativa:',
              style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}