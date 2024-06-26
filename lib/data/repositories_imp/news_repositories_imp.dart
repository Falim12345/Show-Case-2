import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/data_source/news_data_source.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/domain/repositories/news_repository.dart';
import 'package:get_it/get_it.dart';

class NewsRepositoriesImp implements NewsRepository {
  final NewsDataSoursImp _newsDataSoursImp;

  NewsRepositoriesImp() : _newsDataSoursImp = GetIt.I<NewsDataSoursImp>();

  @override
  Future<Either<Failure, NewsArticleModel>> getNews(
      {required String country}) async {
    try {
      Either<Failure, Response> response =
          await _newsDataSoursImp.getNews(country: country);
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
  Future<Either<Failure, NewsArticleModel>> getSearchNews(
      {required String q,
      required String datefrom,
      required String sortBy,
      required int pageSize,
      required int page}) async {
    try {
      Either<Failure, Response> response =
          await _newsDataSoursImp.getSearchNews(
              q: q,
              datefrom: datefrom,
              sortBy: sortBy,
              pageSize: pageSize,
              page: page);
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
