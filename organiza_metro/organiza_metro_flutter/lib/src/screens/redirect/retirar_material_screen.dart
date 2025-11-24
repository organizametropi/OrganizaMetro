import 'package:organiza_metro_flutter/src/page_subtitle.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/justificativa_section.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/materiais_container.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/modalidade_entrega_section.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/add_material_modal.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material/retirar_material_form2.dart';

class retirarMaterialPage extends StatefulWidget {
  @override
  State<retirarMaterialPage> createState() => _RetirarMaterialPageState();
}

class _RetirarMaterialPageState extends State<retirarMaterialPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late RetirarMaterialController controller;

  @override
  void initState() {
    super.initState();
    controller = RetirarMaterialController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchBasesVeiculos();
    });
  }

  void _showAddMaterialModal(BuildContext context) {
    final controller = Provider.of<RetirarMaterialController>(
      context,
      listen: false,
    );

    int? baseId;
    int? veiculoId;
    if (controller.centroTipo == 'Bases') {
      baseId = controller.selectedCentroId;
    } else {
      veiculoId = controller.selectedCentroId;
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddMaterialModal(
          baseId: baseId,
          veiculoId: veiculoId,
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
    return ChangeNotifierProvider.value(
      value: controller,
      child: Consumer<RetirarMaterialController>(
        builder: (context, controller, child) {

          void _validateAndSubmit() {
            if (_formKey.currentState!.validate()) {
              controller
                  .submitRequest(context); 
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PageSubtitleBar(title: 'Retirar Material'),

                  const SizedBox(height: 40.0),

              
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        retirarMaterialForm2(
                          controller: controller,
                          formKey: _formKey,
                        ),

                        const SizedBox(height: 35.0),

                        MaterialsContainer(
                          materials: controller.materialsToAdd,
                          onAddTap: () => _showAddMaterialModal(context),
                          onClearTap: controller.clearMaterials,
                        ),

                        const SizedBox(height: 35.0),

                        ModalidadeEntregaSection(controller: controller),

                        const SizedBox(height: 35.0),

                     
                        JustificativaSection(controller: controller),

                        const SizedBox(height: 35.0),
                      ],
                    ),
                  ),
             
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // height: 45,
                        width: 300,
                        margin: const EdgeInsets.only(
                            bottom: 20.0, right: 10.0, left: 10.0),
                        child: ElevatedButton(
                            onPressed: (controller.materialsToAdd.isNotEmpty &&
                                    controller.formData.modalidadeEntrega != null &&
                                    !controller.isSubmitting)
                                ? _validateAndSubmit
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(vertical: 15)),
                            child: controller.isSubmitting
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text('FINALIZAR REQUISIÇÃO',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                      ),
                      const SizedBox(height: 50.0)
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
