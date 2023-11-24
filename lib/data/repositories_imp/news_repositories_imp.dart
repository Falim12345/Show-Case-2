import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/data_source/news_data_source.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/domain/repositories/news_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../util/api_config.dart';

class NewsRepositoriesImp implements NewsRepository {
  final NewsDataSoursImp _newsDataSoursImp;

  NewsRepositoriesImp() : _newsDataSoursImp = GetIt.I<NewsDataSoursImp>();

  @override
  Future<Either<Failure, NewsArticleModel>> getNews() async {
    try {
      Either<Failure, Response> response =
          await _newsDataSoursImp.getNews(country: 'us');
      return response
          .fold((failure) => Left(Failure.server(message: 'Error: $failure')),
              (response) {
        NewsArticleModel newsArticle =
            newsArticleFromJson(json.encode(response.data));
        return Right(newsArticle);
      });
    } catch (e) {
      throw Left(Failure.connection(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, NewsArticleModel>> getSearchNews() async {
    try {
      Either<Failure, Response> response =
          await _newsDataSoursImp.getSearchNews(
              q: 'Apple',
              datefrom: "2023-10-01",
              sortBy: 'popularity',
              pageSize: 1,
              page: 2);
      return response
          .fold((failure) => Left(Failure.server(message: 'Error: $failure')),
              (response) {
        NewsArticleModel newsSearchArticle =
            newsArticleFromJson(json.encode(response.data));
        return Right(newsSearchArticle);
      });
    } catch (e) {
      throw Left(Failure.connection(message: '$e'));
    }
  }
}
