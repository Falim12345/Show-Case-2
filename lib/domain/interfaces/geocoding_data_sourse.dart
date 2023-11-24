import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';

abstract class GeocodingDataSource {
  Future<Either<Failure, Response<dynamic>>> getCountryByCoordinates();
}
