import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/acount_page.dart';
import 'package:organiza_metro_flutter/src/widgets/button_home.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/home_screen.dart';
import 'package:organiza_metro_flutter/src/screens/auth/login_screen.dart';
import 'package:organiza_metro_flutter/src/widgets/tables/products_table.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InitializeServerpodClient();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'Oganiza Metrô',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: products_table(),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    sessionManager.addListener(() {
      setState(
        () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: sessionManager.isSignedIn ? const homePage() : loginPage(),
    ));
  }
}
