import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/country.dart';

abstract class GetCountryRepository {
  Future<Either<Failure, List<Country>>> getCountryList();
}
