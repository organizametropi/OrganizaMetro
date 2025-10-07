import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class retirarMaterialForm2 extends StatefulWidget {
  retirarMaterialForm2({super.key});

  @override
  _raForm2State createState() => _raForm2State();
}

class _raForm2State extends State<retirarMaterialForm2> {
  late DateTime? selectedDate;

  // CHAMADAS GENERICAS E IMMPLEMENTAÇÃO COM BD ENTRAM AQUI OBVIAMENTE!!!!!!!!!!!!!!
  List<DropdownMenuItem<String>> _dropdownItems = [
    DropdownMenuItem(value: 'option1', child: Text('Option 1')),
    DropdownMenuItem(value: 'option2', child: Text('Option 2')),
    DropdownMenuItem(value: 'option3', child: Text('Option 3')),
  ];
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWide = constraints.maxWidth > 903;
              return isWide
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: DateTimeFormField(
                            decoration: const InputDecoration(
                              labelText: "Data da requisição",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0)),
                            ),
                            dateFormat: DateFormat('dd MMMM yyyy', 'pt_BR'),
                            mode: DateTimeFieldPickerMode.date,
                            firstDate: DateTime(2025),
                            lastDate: DateTime(2101),
                            initialPickerDateTime: DateTime.now(),
                            onChanged: (DateTime? value) {
                              setState(() {
                                selectedDate = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20), // Adicionado espaço
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Centro de Custo",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20), // Adicionado espaço
                        SizedBox(
                          height: 50,
                          width: 300,
                          child: DropdownButtonFormField<String>(
                            value: _selectedValue,
                            items: _dropdownItems,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedValue = newValue;
                              });
                            },
                            decoration: const InputDecoration(
                              labelText: "Centro Logístico",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0)),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 268,
                              child: DateTimeFormField(
                                decoration: const InputDecoration(
                                  labelText: "Data da requisição",
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0)),
                                ),
                                dateFormat: DateFormat('dd MMMM yyyy', 'pt_BR'),
                                mode: DateTimeFieldPickerMode.date,
                                firstDate: DateTime(2025),
                                lastDate: DateTime(2101),
                                initialPickerDateTime: DateTime.now(),
                                onChanged: (DateTime? value) {
                                  setState(() {
                                    selectedDate = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20), // Adicionado espaço
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 268,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Centro de Custo",
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20), // Adicionado espaço
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 268,
                              child: DropdownButtonFormField<String>(
                                value: _selectedValue,
                                items: _dropdownItems,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedValue = newValue;
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: "Centro Logístico",
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
            },
          ),
        ),
        Positioned(
          top: -20,
          left: -8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const Text(
              'Dados da requisição: ',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
