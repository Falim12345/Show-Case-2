import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/domain/interfaces/get_coutry_list_sourse.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';

class GetCountryListDataSourceImp implements GetCountrySourse {
  GetCountryListDataSourceImp() : _dio = GetIt.I<Dio>();

  final Dio _dio;
  @override
  Future<Either<Failure, Response<dynamic>>> getCountryList() async {
    try {
      final response =
          await _dio.get<List<dynamic>>(CountryApiConfig.countryListCurl);
      return Right(response);
    } catch (e, stackTrace) {
      print(stackTrace);
      return Left(Failure.server(
        message: 'Error: $e',
      ));
    }
  }
}
