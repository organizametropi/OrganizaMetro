import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organiza_metro_flutter/src/controllers/admin_controller.dart';
import 'package:organiza_metro_flutter/src/controllers/relatorios_controller.dart';
import 'package:organiza_metro_flutter/src/serverpod_client.dart';
import 'package:organiza_metro_flutter/src/screens/dashboard/home_screen.dart';
import 'package:organiza_metro_flutter/src/screens/auth/login_screen.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InitializeServerpodClient();
  await findSystemLocale();
  await initializeDateFormatting('pt_BR');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AdminController()..fetchAllData()),
    ChangeNotifierProvider(create: (_) => RelatoriosController()..fetchData()),
  ], child: MyApp()));
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
      home: MyHomePage(),
    ));
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  void _onSessionChanged() {
    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    sessionManager.addListener(_onSessionChanged);
  }

  @override
  void dispose() {
    sessionManager.removeListener(_onSessionChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sessionManager.isSignedIn ? const homePage() : loginPage(),
    );
  }
}
