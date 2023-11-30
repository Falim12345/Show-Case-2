import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_showcase_2/core/setap_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/presentation/router/router.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  SetupDependenciesImp().setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
      dark: ThemeData(primaryColor: Colors.blueGrey),
      initial: AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MaterialApp.router(
        routerConfig: _appRouter.config(
          navigatorObservers: () => [AutoRouterObserver()],
        ),
      ),
    );
  }
}
