import 'package:flutter/material.dart';

class notificationCard extends StatefulWidget {
  notificationCard({super.key});

  @override
  _notificationCardState createState() => _notificationCardState();
}

class _notificationCardState extends State<notificationCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 800,
            height: 150,
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.green, 
                    width: 3.0, 
                  ),
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                shadowColor: Colors.black,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.add, color: Colors.green),
                  SizedBox(width: 15),
                  Text(
                      'Registramos a retirada do material _nome_do_material as _horas _data')
                ]))),
      ],
    );
  }
}
