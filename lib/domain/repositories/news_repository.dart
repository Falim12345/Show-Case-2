import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsArticleModel>> getSearchNews(
      {required String q,
      required String datefrom,
      required String sortBy,
      required int pageSize,
      required int page});
  Future<Either<Failure, NewsArticleModel>> getNews({required String country});
}
