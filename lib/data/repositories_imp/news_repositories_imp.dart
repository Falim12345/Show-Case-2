import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/domain/repositories/news_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../util/api_config.dart';

class NewsRepositoriesImp implements NewsRepository {
  final Dio dio;
  final ApiNewsConfig apiConfig;
  var logger = Logger();

  NewsRepositoriesImp()
      : dio = GetIt.I<Dio>(),
        apiConfig = GetIt.I<ApiNewsConfig>();

  @override
  Future<Either<Failure, NewsArticle>> getNews({
    required String country,
  }) async {
    try {
      Response response = await dio.get(
        apiConfig.newsCurl,
        queryParameters: {"country": country},
        options: Options(
          headers: {'Authorization': 'Bearer ${apiConfig.apiKey}'},
        ),
      );
      logger.d(
          '###NEWS###Response status code: ${response.statusCode},${response.runtimeType}');
      if (response.statusCode == 200) {
        // Парсим ответ в объект типа NewsArticle и возвращаем его
        NewsArticle newsArticle = newsArticleFromJson(
          json.encode(response.data),
        );
        return Right(newsArticle);
      } else {
        return Left(Failure.server(message: 'Failed to load news'));
      }
    } catch (e) {
      return Left(Failure.server(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, NewsArticle>> getSearchNews(
      {required String q,
      required String datefrom,
      required String sortBy,
      required int pageSize,
      required int page}) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(
        apiConfig.searchNewsCurl,
        queryParameters: {"q": q, "datefrom": datefrom, "sortBy": sortBy},
        options: Options(
          headers: {'Authorization': 'Bearer ${apiConfig.apiKey}'},
        ),
      );
      logger.d('###SEARCH NEWS###Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        NewsArticle newsArticle = newsArticleFromJson(
          json.encode(response.data),
        );
        return Right(newsArticle);
      } else {
        logger.e('Failed to load news: ${response.statusCode}');
        return Left(Failure.server(message: 'Failed to load news'));
      }
    } catch (e) {
      logger.e('Error: $e');
      return Left(Failure.server(message: 'Error: $e'));
    }
  }
}
