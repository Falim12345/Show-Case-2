import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_showcase_2/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/presentation/router/router.dart';
import 'package:flutter_showcase_2/util/firebase_options.dart';

import 'core/setap_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SetupDependenciesImp().setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.dark,
      builder: (ThemeData light, ThemeData dark) => MaterialApp.router(
        routerConfig: router,
        theme: light,
        darkTheme: dark,
      ),
    );
  }
}
