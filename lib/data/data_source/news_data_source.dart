import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/domain/interfaces/news_data_sourse.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class NewsDataSoursImp implements NewsDataSource {
  final Dio dio;
  final ApiNewsConfig apiConfig;
  var logger = Logger();

  NewsDataSoursImp()
      : dio = GetIt.I<Dio>(),
        apiConfig = GetIt.I<ApiNewsConfig>();

  @override
  Future<Either<Failure, Response<dynamic>>> getNews(
      {required String country}) async {
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
      return Right(response);
    } catch (e) {
      return Left(Failure.server(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, Response<dynamic>>> getSearchNews(
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

      return Right(response);
    } catch (e) {
      logger.e('Error: $e');
      return Left(Failure.server(message: 'Error: $e'));
    }
  }
}
