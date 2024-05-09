import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/data_source/weather_data_source_imp.dart';
import 'package:flutter_showcase_2/data/model/weather_model.dart';
import 'package:flutter_showcase_2/domain/repositories/weather_rep.dart';
import 'package:get_it/get_it.dart';

class WeatherRepImp implements WeatherRep {
  WeatherRepImp() : weatherDataSourseImp = GetIt.I<WeatherDataSourseImp>();
  WeatherDataSourseImp weatherDataSourseImp;
  @override
  Future<Either<Failure, WeatherModel>> getWeather() async {
    try {
      final response = await weatherDataSourseImp.getWeatherByCoordinates();
      return response.fold((failure) => throw Exception(failure.message),
          (response) {
        final weatherData = weatherModelFromJson(json.encode(response.data));
        return Right(weatherData);
      });
    } catch (e) {
      throw Left(Failure.connection(message: '$e'));
    }
  }
}
