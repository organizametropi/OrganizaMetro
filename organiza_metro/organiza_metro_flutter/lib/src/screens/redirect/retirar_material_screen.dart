import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/defalt_app_bar.dart';
import 'package:organiza_metro_flutter/src/widgets/forms/retirar_material_form2.dart';

enum valoresRadioTest { teste }

class retirarMaterialPage extends StatefulWidget {
  retirarMaterialPage({super.key});

  @override
  _retirarMaterialState createState() => _retirarMaterialState();
}

class _retirarMaterialState extends State<retirarMaterialPage> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      'Requisição de material 📤',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    constraints: BoxConstraints(minHeight: 300.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('nenhum item selecionado')],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: -8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Materiais da requisição: ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      width: 180,
                      margin: EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.green)),
                        label: Text(
                          'Adicionar material',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Flexible(
                    child: Container(
                      width: 180,
                      margin: EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.red)),
                        label: Text(
                          'Limpar materias',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              retirarMaterialForm2(),
              SizedBox(
                height: 35,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                            value: _selectedValue,
                            groupValue: valoresRadioTest,
                            onChanged: (valoresRadioTest) {},
                          ),
                          title: Text(
                            'Balcão (retirada no centro de atendimento)',
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: -8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Modalidade de Entrega: ',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TextFormField(
                            // controller: _controller,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 5,
                            maxLength: 2000,
                            decoration: const InputDecoration(
                              labelText: 'Descrição detalhada',
                              hintText: 'Digite aqui a sua descrição...',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0)),
                              alignLabelWithHint:
                                  true, // Alinha o rótulo ao topo
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: -8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Justificativa:',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -20,
                    left: -8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Dados do Solicitante:',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
