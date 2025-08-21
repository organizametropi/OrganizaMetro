import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[700],
        body: Center(
          child: Container(
            height: 300, 
            width: 300, 
            color: Colors.white,
            padding: EdgeInsets.all(25),
            child: Text("TEST"),
            ),
        ),
      ),
    );
  }
}
