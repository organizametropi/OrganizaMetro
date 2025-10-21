
import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';
import 'package:provider/provider.dart';

class ModalidadeEntregaSection extends StatelessWidget {
  final RetirarMaterialController controller;

  const ModalidadeEntregaSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    // Usamos Consumer para ouvir a mudança de _selectedValue/modalidadeEntrega
    return Consumer<RetirarMaterialController>(
      builder: (context, controller, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Radio<String>(
                      value: 'Balcão',
                      groupValue: controller.formData.modalidadeEntrega,
                      onChanged: (value) => controller.updateModalidadeEntrega(value!),
                    ),
                    title: const Text('Balcão (retirada no centro de atendimento)', softWrap: true),
                  ),
                  // Adicione outros Rádios aqui (ex: Entrega por Veículo)
                ],
              ),
            ),
            Positioned(
              top: -15,
              left: -8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: const Text(
                  'Modalidade de Entrega: ',
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}