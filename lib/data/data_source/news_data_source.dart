import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/domain/interfaces/news_data_sourse.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class NewsDataSoursImp implements NewsDataSource {
  final Dio _dio;
  final ApiNewsConfig _apiConfig;
  final _logger = Logger();

  NewsDataSoursImp()
      : _dio = GetIt.I<Dio>(),
        _apiConfig = GetIt.I<ApiNewsConfig>();

  @override
  Future<Either<Failure, Response<dynamic>>> getNews(
      {required String country}) async {
    try {
      Response response = await _dio.get(
        _apiConfig.newsCurl,
        queryParameters: {"country": country},
        options: Options(
          headers: {'Authorization': 'Bearer ${_apiConfig.apiKey}'},
        ),
      );
      _logger.d(
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
          await _dio.get<Map<String, dynamic>>(
        _apiConfig.searchNewsCurl,
        queryParameters: {"q": q, "datefrom": datefrom, "sortBy": sortBy},
        options: Options(
          headers: {'Authorization': 'Bearer ${_apiConfig.apiKey}'},
        ),
      );
      _logger
          .d('###SEARCH NEWS###Response status code: ${response.statusCode}');

      return Right(response);
    } catch (e) {
      _logger.e('Error: $e');
      return Left(Failure.server(message: 'Error: $e'));
    }
  }
}
