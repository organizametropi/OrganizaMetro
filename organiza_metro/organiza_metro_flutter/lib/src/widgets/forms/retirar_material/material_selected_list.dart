import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';

class MaterialsSelectedList extends StatelessWidget {
  final List<Map<String, dynamic>> materials;
  
  const MaterialsSelectedList({super.key, required this.materials});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Itens para Requisição:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        
        // Mapeia cada material para um MaterialEditableRow
        ...materials.map((material) => 
          MaterialEditableRow(
            // Key é importante para o Flutter gerenciar a lista
            key: ValueKey(material['id']), 
            material: material,
          )
        ).toList(),
      ],
    );
  }
}

// ===========================================================================
// WIDGET PARA CADA LINHA DE MATERIAL (Editável e com Lixeira)
// ===========================================================================

class MaterialEditableRow extends StatelessWidget {
  final Map<String, dynamic> material;

  const MaterialEditableRow({super.key, required this.material});
  
  // Função que exibe o modal de confirmação de exclusão
  void _showDeleteConfirmation(BuildContext context, RetirarMaterialController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar Remoção"),
          content: Text("Deseja realmente remover o item '${material['descricao'] ?? 'Item'}' da requisição?"),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text("Remover", style: TextStyle(color: Colors.white)),
              onPressed: () {
                controller.removeItem(material['id'] as int); // Chama a lógica do Controller
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RetirarMaterialController>();
    final itemId = material['id'] as int;
    // Lógica para determinar se é ferramenta (e a quantidade deve ser fixa 1)
    final isFerramenta = material['ferramentaId'] != null || material['tipo'] == 'ferramenta'; 
    final initialQuantity = '1'; 

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. ÍCONE E DESCRIÇÃO
          Expanded(
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(isFerramenta ? Icons.construction : Icons.inventory_2, size: 20, color: Colors.blueGrey),
              title: Text(
                material['descricao'] ?? 'Item sem descrição', 
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
              ),
              subtitle: Text(
                'Cód. SAP: ${material['codigoSap'] ?? material['codigo_sap']}', 
                style: const TextStyle(fontSize: 12, color: Colors.black54)
              ),
            ),
          ),
          
          const SizedBox(width: 10),

          // 2. CAMPO DE QUANTIDADE EDITÁVEL
          Container(
            width: 80,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 8.0),
            child: TextFormField(
              initialValue: initialQuantity,
              textAlign: TextAlign.center,
              enabled: !isFerramenta, // Desabilita edição se for ferramenta
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: TextStyle(fontWeight: isFerramenta ? FontWeight.bold : FontWeight.normal),
              decoration: InputDecoration(
                labelText: 'Qtd',
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                fillColor: isFerramenta ? Colors.grey.shade100 : Colors.white,
                filled: true,
              ),
              onChanged: (value) {
                // Remove vírgulas e tenta parsear para double
                final double? newQuantity = double.tryParse(value.replaceAll(',', '.'));
                if (newQuantity != null && newQuantity > 0) {
                  controller.updateItemQuantity(itemId, newQuantity);
                } else if (newQuantity == 0.0) {
                  // Se o usuário digitar 0, trata como se quisesse remover
                  _showDeleteConfirmation(context, controller); 
                }
              },
            ),
          ),
          
          // 3. BOTÃO DE EXCLUSÃO (LIXEIRA)
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () => _showDeleteConfirmation(context, controller),
          ),
        ],
      ),
    );
  }
}