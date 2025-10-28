import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organiza_metro_flutter/src/screens/redirect/estoque_screen.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/home_screen.dart';
import 'package:organiza_metro_flutter/src/screens/auth/login_screen.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InitializeServerpodClient();
  await findSystemLocale();
  await initializeDateFormatting('pt_BR');

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
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt', 'BR'),
      home: estoquePage(),
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
      print('🔄 Estado de login mudou: ${sessionManager.isSignedIn}');
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
