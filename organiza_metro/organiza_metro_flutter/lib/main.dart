import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:organiza_metro_flutter/src/widgets/acount_page.dart';
import 'package:organiza_metro_flutter/src/widgets/screen_login.dart';

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
      home: const MyHomePage(title: 'Login'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
      body: sessionManager.isSignedIn ? const AccountPage() : loginPage(),
    ));
  }
}
