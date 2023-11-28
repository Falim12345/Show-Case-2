import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/weather_model.dart';

abstract class WeatherRep {
  Future<Either<Failure, WeatherModel>> getWeather();
}
