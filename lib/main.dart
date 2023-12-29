import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_showcase_2/core/setap_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/util/firebase_options.dart';
import 'package:flutter_showcase_2/presentation/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SetupDependenciesImp().setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      dark: ThemeData(primaryColor: Colors.blueGrey),
      initial: AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MaterialApp.router(
        routerConfig: _router.config(),
      ),
    );
  }
}
