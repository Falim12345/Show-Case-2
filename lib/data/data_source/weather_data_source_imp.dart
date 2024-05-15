import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/UseCase/use_case_location.dart';
import 'package:flutter_showcase_2/domain/interfaces/weather_data_sourse.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class WeatherDataSourseImp implements WeatherDataSourse {
  WeatherDataSourseImp()
      : _dio = GetIt.I<Dio>(),
        _weatherApiConfig = GetIt.I<WeatherApiConfig>(),
        _getLocationUseCase = GetIt.I<GetLocationUseCase>();
  final Dio _dio;
  final WeatherApiConfig _weatherApiConfig;
  final GetLocationUseCase _getLocationUseCase;
  Logger logger = Logger();

  @override
  Future<Either<Failure, Response<dynamic>>> getWeatherByCoordinates() async {
    final location = await _getLocationUseCase.call(null);
    try {
      final response = await _dio.get<Response<dynamic>>(
        _weatherApiConfig.weatherCurl,
        queryParameters: {
          'key': _weatherApiConfig.apiKey,
          'q': '${location.latitude},${location.longitude}',
        },
      );
      logger.d(
        '###WEATHER###Response status code: ${response.statusCode}',
      );
      if (response.statusCode == 200) {
        return Right(response);
      } else {
        return Left(Failure.server(message: 'Failed to load weather'));
      }
    } catch (e) {
      logger.e('###WEATHER###Error: $e');
      return Left(Failure.server(message: 'message: $e'));
    }
  }
}
