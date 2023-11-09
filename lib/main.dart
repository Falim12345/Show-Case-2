import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/entities/setap_dependencies.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  SetupDependenciesImp().setupDependencies();

  runApp(const MyApp());
  final Either<Failure, NewsArticle> newsEither =
      await NewsRepositoriesImp(dio: Dio()).getNews(country: 'us');

  newsEither.fold(
    (failure) {
      // Обработка ошибки
    },
    (news) {
      // Обработка успешного результата
      for (Article article in news.articles) {
        // print("Source Name: ${article.source.name}");
        // print("Author: ${article.author ?? 'N/A'}");
        // print("Title: ${article.title}");
        // print("Description: ${article.description ?? 'N/A'}");
        // print("URL: ${article.url}");
        // print("URL to Image: ${article.urlToImage ?? 'N/A'}");
        // print("Published At: ${article.publishedAt}");
        // print("Content: ${article.content ?? 'N/A'}");
        // print("----------------------");
      }
    },
  );
  var loc = await LocationRepositoryImp().getLocation();
  print('Location: ${loc.latitude}, ${loc.longitude}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

// Future<void> _getCurrentLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);

//   print('Широта: ${position.latitude}');
//   print('Долгота: ${position.longitude}');
// }
