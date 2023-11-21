import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/data_source/weather_data_source_imp.dart';
import 'package:flutter_showcase_2/data/model/weather_model.dart';
import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/weather_rep_imp.dart';
import 'package:flutter_showcase_2/domain/entities/setap_dependencies.dart';
import 'package:flutter/material.dart';

void main() async {
  SetupDependenciesImp().setupDependencies();

  runApp(const MyApp());
//  var test = await GeocoderRepImp().getCoutryCode();

  // final Either<Failure, NewsArticle> newsEither =
  //     await NewsRepositoriesImp().getNews(country: 'us');

  // newsEither.fold(
  //   (failure) {
  //     // Обработка ошибки
  //   },
  //   (news) {```
  //     // Обработка успешного результата
  //     for (Article article in news.articles) {
  //       // print("Source Name: ${article.source.name}");
  //       // print("Author: ${article.author ?? 'N/A'}");
  //       // print("Title: ${article.title}");
  //       // print("Description: ${article.description ?? 'N/A'}");
  //       // print("URL: ${article.url}");
  //       // print("URL to Image: ${article.urlToImage ?? 'N/A'}");
  //       // print("Published At: ${article.publishedAt}");
  //       // print("Content: ${article.content ?? 'N/A'}");
  //       // print("----------------------");
  //     }
  //   },
  // );
  // var loc = await LocationRepositoryImp().getLocation();
  // print('Location: ${loc.latitude}, ${loc.longitude}');
  // var test = await GeocoderDataSource().getCountryByCoordinates();
  // print(test);
  // print(test.runtimeType);

  Either<Failure, WeatherModel> ewew = await WeatherRepImp().getWeather();
  ewew.fold((failure) => print(failure), (weather) => print(weather.current));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
