import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase_2/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/repositories_imp/fairbase_auth_rep_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/presentation/BloC/auth_bloc.dart';
import 'package:flutter_showcase_2/presentation/BloC/get_news_bloc.dart';
import 'package:flutter_showcase_2/presentation/pages/home_page.dart';
import 'package:flutter_showcase_2/presentation/pages/signuppage.dart';
import 'package:flutter_showcase_2/core/router/router.dart';
import 'package:flutter_showcase_2/util/firebase_options.dart';

import 'core/setap_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SetupDependenciesImp().setupDependencies();

  NewsRepositoriesImp newsRepositoriesImp = NewsRepositoriesImp();

  var result = await newsRepositoriesImp.getNews(country: 'us');
  result.fold((failutre) => null, (newsArticle) {
    for (var article in newsArticle.articles) {
      print(article.urlToImage); // Вывод содержимого каждой новости
    }
  });
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(AuthRepositoryImp()),
          child: const SingupPage(),
        ),
        BlocProvider<GetNewsBloc>(
          create: (context) => GetNewsBloc(NewsRepositoriesImp()),
          child: const HomePage(),
        ),
      ],
      child: AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: AdaptiveThemeMode.dark,
        builder: (ThemeData light, ThemeData dark) => MaterialApp.router(
          routerConfig: router,
          theme: light,
          darkTheme: dark,
        ),
      ),
    );
  }
}
