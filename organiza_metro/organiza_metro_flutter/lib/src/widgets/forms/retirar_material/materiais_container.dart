import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/material_selected_list.dart';
import 'package:provider/provider.dart';

class MaterialsContainer extends StatelessWidget{
  final List<Map<String, dynamic>> materials;
  final VoidCallback onAddTap;
  final VoidCallback onClearTap;

  const MaterialsContainer({
    required this.materials,
    required this.onAddTap,
    required this.onClearTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RetirarMaterialController>();

    void _showConfirmationModal() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirmar Limpeza"),
            content: const Text("Tem certeza que deseja remover todos os materiais selecionados da requisição?"),
            actions: [
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Confirmar Limpeza", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  controller.clearMaterials(); // 🚨 CHAMA O CLEAR APÓS CONFIRMAÇÃO
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              constraints: BoxConstraints(minHeight: materials.isEmpty ? 100.0 : 50.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: materials.isEmpty
                  ? const Center(child: Text('Nenhum item selecionado'))
                  : MaterialsSelectedList(materials: materials), // O seu widget de lista
            ),
            Positioned(
              top: -15,
              left: -8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                color: Theme.of(context).scaffoldBackgroundColor, // Fundo para cobrir a borda
                child: const Text(
                  'Materiais da requisição: ',
                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Botão Adicionar
            SizedBox(
              width: 180,
              child: TextButton.icon(
                onPressed: onAddTap,
                icon: const Icon(Icons.add, color: Colors.white),
                style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)),
                label: const Text('Adicionar material', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 4),
            // Botão Limpar
            SizedBox(
              width: 180,
              child: TextButton.icon(
                onPressed: materials.isNotEmpty ? _showConfirmationModal : null,
                icon: const Icon(Icons.delete, color: Colors.white),
                style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
                label: const Text('Limpar materiais', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
