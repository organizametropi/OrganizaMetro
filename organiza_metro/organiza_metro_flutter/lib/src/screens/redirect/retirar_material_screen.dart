import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/justificativa_section.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/materiais_container.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/modalidade_entrega_section.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/add_material_modal.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/retirar_material_form2.dart';

class retirarMaterialPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Função para abrir o modal
  void _showAddMaterialModal(BuildContext context) {
    // Acessa o controlador sem ouvir as mudanças (read)
    final controller = context.read<RetirarMaterialController>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddMaterialModal(
          onMaterialsSelected: (selectedMaterials) {
            // Chama a função do controller
            controller.addMaterials(selectedMaterials);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🚨 Injete o controlador na árvore para que os sub-widgets possam acessá-lo
    return ChangeNotifierProvider(
      create: (_) => RetirarMaterialController(),
      child: Consumer<RetirarMaterialController>(
        builder: (context, controller, child) {
          // Passamos o context para o submitRequest
          void _validateAndSubmit() {
            if (_formKey.currentState!.validate()) {
              controller
                  .submitRequest(context); // Passa o contexto para o SnackBar
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content:
                        Text('Por favor, preencha os campos obrigatórios.')),
              );
            }
          }

          return Scaffold(
            appBar: const MyAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Requisição de material 📤',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(height: 40.0),

                    // --- ÁREA DE MATERIAIS SELECIONADOS ---
                    MaterialsContainer(
                      materials: controller.materialsToAdd,
                      onAddTap: () => _showAddMaterialModal(context),
                      onClearTap: controller.clearMaterials,
                    ),

                    const SizedBox(height: 20.0),

                    // --- FORMULÁRIO DE DADOS GERAIS ---
                    // O retirarMaterialForm2 agora recebe o controller ou usa o Provider internamente
                    retirarMaterialForm2(
                      controller: controller,
                      formKey: _formKey,
                    ),

                    const SizedBox(height: 35.0),

                    // --- MODALIDADE DE ENTREGA ---
                    ModalidadeEntregaSection(controller: controller),

                    const SizedBox(height: 35.0),

                    // --- JUSTIFICATIVA ---
                    JustificativaSection(controller: controller),

                    const SizedBox(height: 40.0),

                    // --- BOTÃO DE ENVIO FINAL ---
                    ElevatedButton(
                        // Desabilita se não tiver itens, modalidade ou se estiver enviando
                        onPressed: (controller.materialsToAdd.isNotEmpty &&
                                controller.formData.modalidadeEntrega != null &&
                                !controller.isSubmitting)
                            ? _validateAndSubmit
                            : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 15)),
                        child: controller.isSubmitting
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text('FINALIZAR REQUISIÇÃO',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
