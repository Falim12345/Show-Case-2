import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_showcase_2/core/setap_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/firebase_options.dart';
import 'package:flutter_showcase_2/presentation/pages/home_page.dart';
import 'package:flutter_showcase_2/presentation/pages/onboarding/onboarding1.dart';
import 'package:flutter_showcase_2/presentation/pages/onboarding/onboarding2.dart';

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
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      dark: ThemeData(primaryColor: Colors.blueGrey),
      initial: AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MaterialApp(
        home: Navigator(
          pages: const [
            MaterialPage(child: OnboardingPage()),
            MaterialPage(child: OnboardingPageTwo()),
            MaterialPage(child: HomePage()),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            return true;
          },
        ),
      ),
    );
  }
}
