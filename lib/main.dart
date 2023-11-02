import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/entities/setap_dependencies.dart';

void main() async {
  SetapDependebciesImp().setapDependebcies();
  runApp(const MyApp());
  testtest();
  // Получаем новости из API
  NewsArticle news = await NewsRepositoriesImp(dio: Dio()).getNews("us");

  // Выводим значения полей объекта NewsArticle в консоль
  print("Status: ${news.status}");
  print("Total Results: ${news.totalResults}");

  // Выводим значения полей каждой статьи в консоль
  for (Article article in news.articles) {
    // print("Source Name: ${article.source.name}");
    // print("Author: ${article.author ?? 'N/A'}");
    print("Title: ${article.title}");
    // print("Description: ${article.description ?? 'N/A'}");
    // print("URL: ${article.url}");
    // print("URL to Image: ${article.urlToImage ?? 'N/A'}");
    // print("Published At: ${article.publishedAt}");
    // print("Content: ${article.content ?? 'N/A'}");
    // print("----------------------");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

void testtest() async {}
