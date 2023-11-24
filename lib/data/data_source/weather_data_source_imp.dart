import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/UseCase/use_case_location.dart';
import 'package:flutter_showcase_2/domain/entities/location.dart';
import 'package:flutter_showcase_2/domain/interfaces/weather_data_sourse.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class WeatherDataSourseImp implements WeatherDataSourse {
  final Dio dio;
  final WeatherApiConfig weatherApiConfig;
  final GetLocationUseCase getLocationUseCase;
  var logger = Logger();
  WeatherDataSourseImp()
      : dio = GetIt.I<Dio>(),
        weatherApiConfig = GetIt.I<WeatherApiConfig>(),
        getLocationUseCase = GetIt.I<GetLocationUseCase>();

  @override
  Future<Either<Failure, Response<dynamic>>> getWeatherByCoordinates() async {
    Location location = await getLocationUseCase.call(null);
    try {
      Response response =
          await dio.get(weatherApiConfig.weatherCurl, queryParameters: {
        "key": weatherApiConfig.apiKey,
        "q": "${location.latitude},${location.longitude}",
      });
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
