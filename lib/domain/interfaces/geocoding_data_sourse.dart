import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';

abstract class GeocodingData {
  Future<Either<Failure, Response>> getCountryByCoordinates();
}
