import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/country.dart';

abstract class GetCountrySourse {
  Future<Either<Failure, Response<dynamic>>> getCountryList();
}
