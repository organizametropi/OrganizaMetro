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
  List<DropdownMenuItem<String>> _dropdownItems = [
    const DropdownMenuItem(value: 'option1', child: Text('Opção A')),
    const DropdownMenuItem(value: 'option2', child: Text('Opção B')),
  ];

  String? _selectedValue; // Estado local do Dropdown

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
                      initialPickerDateTime: DateTime.now(),
                      onChanged:
                          controller.updateDataRequisicao, // 🚨 Sink de dados
                      validator: (value) =>
                          value == null ? 'Selecione a data' : null,
                    ),
                  );

                  Widget centroCustoField = SizedBox(
                    height: 50,
                    width: isWide ? 300 : 268,
                    child: TextFormField(
                      onChanged:
                          controller.updateCentroCusto, // 🚨 Sink de dados
                      validator: _requiredValidator,
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
                    child: DropdownButtonFormField<String>(
                      value: _selectedValue,
                      items: _dropdownItems,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                        controller.updateCentroLogistico(
                            newValue); // 🚨 Sink de dados
                      },
                      validator: _dropdownValidator,
                      decoration: const InputDecoration(
                        labelText: "Centro Logístico",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0)),
                      ),
                    ),
                  );

                  return isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            dataField,
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
            // ... (Label 'Dados da requisição:') ...
          ],
        ));
  }
}
