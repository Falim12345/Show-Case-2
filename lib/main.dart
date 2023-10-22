import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';

void main() {
  runApp(const MyApp());
  test();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

test() async {
  try {
    NewsRepositoriesImp(dio: Dio())
        .getSearchNews("Apple", "2023-10-01", 'popularity');
  } catch (e) {
    throw ('$e');
  }
}
