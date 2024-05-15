import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase_2/core/app_theme.dart';
import 'package:flutter_showcase_2/core/router/router.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_showcase_2/core/setap_dependencies.dart';
import 'package:flutter_showcase_2/data/data_source/get_country_list_sourse_imp.dart';
import 'package:flutter_showcase_2/data/data_source/news_data_source.dart';
import 'package:flutter_showcase_2/data/model/country.dart';
import 'package:flutter_showcase_2/data/repositories_imp/fairbase_auth_rep_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/get_country_list_rep_imp.dart';
import 'package:flutter_showcase_2/presentation/BloC/auth_bloc.dart';
import 'package:flutter_showcase_2/presentation/BloC/news_bloc.dart';
import 'package:flutter_showcase_2/presentation/pages/home_page.dart';
import 'package:flutter_showcase_2/presentation/pages/signuppage.dart';
import 'package:flutter_showcase_2/util/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SetupDependenciesImp().setupDependencies();
  // Map<String, dynamic> listToMap(List<dynamic> list) {
  //   final map = <String, dynamic>{};
  //   for (var i = 0; i < list.length; i++) {
  //     if (list[i] is Map<String, dynamic>) {
  //       final itemMap = list[i] as Map<String, dynamic>;
  //       itemMap.forEach((key, value) {
  //         if (value is Map<String, dynamic>) {
  //           // Обработка вложенной карты
  //           value.forEach((nestedKey, nestedValue) {
  //             map['$key.$nestedKey'] = nestedValue;
  //           });
  //         } else {
  //           // Добавление значения в карту
  //           map[key] = value;
  //         }
  //       });
  //     } else {
  //       throw ArgumentError(
  //           'Element at index $i is not a Map<String, dynamic>.');
  //     }
  //   }
  //   return map;
  // }

  // var response = await GetCountryListDataSourceImp().getCountryList();
  // response.fold(
  //   (l) => print(l),
  //   (r) {
  //     var res = r.data as List<dynamic>;
  //     var res1 = listToMap(res);
  //     print(res1.runtimeType);

  //     // Проверка каждого значения в Map
  //     res1.forEach((key, value) {
  //       if (value is! String) {
  //         throw ArgumentError('Value for key $key is not a String: $value');
  //       }
  //     });

  //     Country response = Country.fromJson(res1);
  //   },
  // );

  var response = await GetCountryListRepImp().getCountryList();
  response.fold(
    (l) => print(l), // Печать ошибки, если она есть
    (r) => r.forEach((country) {
      // Печать информации о каждой стране
      print("Common Name: ${country.name?.common}");
      print("Official Name: ${country.name?.official}");
      print("Flags:");
      print("  SVG: ${country.flags?.svg}");
      print("  PNG: ${country.flags?.png}");
      print("  ALT: ${country.flags?.alt}");
      print(""); // Пустая строка для отделения информации о странах
    }),
  );

  // var response = await NewsDataSoursImp().getNews(country: 'us');

  // response.fold(
  //   (l) => print(l),
  //   (r) => print(r.runtimeType),
  // );
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
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(),
          child: const HomePage(),
        ),
      ],
      child: AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: AdaptiveThemeMode.dark,
        builder: (ThemeData light, ThemeData dark) => MaterialApp.router(
          // localizationsDelegates: const [
          //   S.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: S.delegate.supportedLocales,
          routerConfig: router,
          theme: light,
          darkTheme: dark,
        ),
      ),
    );
  }
}
