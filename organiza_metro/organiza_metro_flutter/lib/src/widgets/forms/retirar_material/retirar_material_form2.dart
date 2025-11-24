import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organiza_metro_flutter/src/controllers/retirar_material_controller.dart';

class retirarMaterialForm2 extends StatefulWidget {
  late final RetirarMaterialController controller; // Passamos o controller

  late final GlobalKey<FormState> formKey;

  retirarMaterialForm2(
      {required this.controller, required this.formKey, super.key});

  @override
  _raForm2State createState() => _raForm2State();
}

class _raForm2State extends State<retirarMaterialForm2> {
  String? _selectedValue; // Estado local do centroLogistico Dropdown

  String? _requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  // Função de validação para Dropdown (verifica se o valor não é nulo)
  String? _dropdownValidator(String? value) {
    if (value == null) {
      return 'Selecione uma opção';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller; // Acessa o controller

    return Form(
        key: widget.formKey,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(8),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isWide = constraints.maxWidth > 903;

                  // Define o widget de input para reutilização
                  Widget dataField = SizedBox(
                    height: 50,
                    width: isWide ? 300 : 268,
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        labelText: "Data da requisição",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0)),
                      ),
                      dateFormat: DateFormat('dd MMMM yyyy', 'pt_BR'),
                      mode: DateTimeFieldPickerMode.date,
                      firstDate: DateTime.now(),
                      onChanged:
                          controller.updateDataRequisicao, // 🚨 Sink de dados
                      validator: (value) =>
                          value == null ? 'Selecione a data' : null,
                    ),
                  );

                  Widget dataField2 = SizedBox(
                    height: 50,
                    width: isWide ? 300 : 268,
                    child: DateTimeFormField(
                      decoration: const InputDecoration(
                        labelText: "Até",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0)),
                      ),
                      dateFormat: DateFormat('dd MMMM yyyy', 'pt_BR'),
                      mode: DateTimeFieldPickerMode.date,
                      firstDate: DateTime.now(),
                      onChanged:
                          controller.updateDataDevolucao, // 🚨 Sink de dados
                    ),
                  );

                  Widget centroCustoField = SizedBox(
                    height: 50,
                    width: isWide ? 300 : 268,
                    child: DropdownButtonFormField<String>(
                      value: controller.centroTipo,
                      items: const [
                        DropdownMenuItem(value: 'Bases', child: Text('Bases')),
                        DropdownMenuItem(
                            value: 'Veiculos', child: Text('Veículos')),
                      ],
                      onChanged: (String? newValue) {
                        if (newValue == null) return;
                        controller.setCentroTipo(newValue);
                        // Reset selection
                        setState(() => _selectedValue = null);
                      },
                      decoration: const InputDecoration(
                        labelText: "Centro de Custo",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0)),
                      ),
                    ),
                  );

                  Widget centroLogisticoField = SizedBox(
                    height: 50,
                    width: isWide ? 300 : 268,
                    child: Builder(builder: (ctx) {
                      final tipo = controller.centroTipo;
                      final items = tipo == 'Bases'
                          ? controller.bases
                              .map((b) => DropdownMenuItem<String>(
                                  value: b.id.toString(), child: Text(b.nome)))
                              .toList()
                          : controller.veiculos
                              .map((v) => DropdownMenuItem<String>(
                                  value: v.id.toString(),
                                  child: Text(v.codigo)))
                              .toList();

                      return DropdownButtonFormField<String>(
                        value: _selectedValue,
                        items: items,
                        onChanged: (String? newValue) {
                          setState(() => _selectedValue = newValue);
                          // Keep the string label in the form data
                          controller.updateCentroLogistico(newValue);
                          // Parse & set the numeric selectedCentroId and fetch materials
                          controller.updateCentroLogisticoById(newValue);
                        },
                        validator: _dropdownValidator,
                        decoration: const InputDecoration(
                          labelText: "Centro Logístico",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0)),
                        ),
                      );
                    }),
                  );

                  return isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            dataField,
                            dataField2,
                            centroCustoField,
                            centroLogisticoField,
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [dataField]),
                            const SizedBox(height: 20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [dataField2]),
                            const SizedBox(height: 20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [centroCustoField]),
                            const SizedBox(height: 20),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [centroLogisticoField]),
                          ],
                        );
                },
              ),
            ),
            Positioned(
              top: -15,
              left: -8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: const Text(
                  'Dados da requisição:',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
