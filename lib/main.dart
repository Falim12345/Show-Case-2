import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/entities/setap_dependencies.dart';
import 'package:get_it/get_it.dart';

void main() {
  SetapDependebciesImp().setapDependebcies();
  runApp(const MyApp());
  testtest();
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
    NewsRepositoriesImp(dio: Dio()).getNews('us');
    // NewsRepositoriesImp(dio: Dio())
    //     .getSearchNews("Apple", "2023-10-01", "popularity");
  } catch (e) {
    throw ('$e');
  }
}

void testtest() async {
  var response = await NewsRepositoriesImp(dio: Dio()).getNews('us');
  var res2 =
      await NewsRepositoriesImp(dio: Dio()).getSearchNews('us', 'datefrom', '');
  // print(res2.data);

  NewsArticle article = NewsArticle.fromJson(res2.data);
  print(article);

  //print(res2.runtimeType);
}
