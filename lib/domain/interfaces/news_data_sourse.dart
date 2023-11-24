import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';

abstract class NewsDataSource {
  Future<Either<Failure, Response<dynamic>>> getNews({required String country});
  Future<Either<Failure, Response<dynamic>>> getSearchNews(
      {required String q,
      required String datefrom,
      required String sortBy,
      required int pageSize,
      required int page});
}
