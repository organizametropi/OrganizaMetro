import 'package:flutter/material.dart';

class notificationCard extends StatefulWidget{
  notificationCard({super.key});

  @override
  _notificationCardState createState() => _notificationCardState();

}

class _notificationCardState extends State<notificationCard>{


  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 1,
      shape: Border.all(color: Colors.green),
    );
  }
}