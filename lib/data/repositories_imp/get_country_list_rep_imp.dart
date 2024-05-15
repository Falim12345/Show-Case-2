import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/data_source/get_country_list_sourse_imp.dart';
import 'package:flutter_showcase_2/data/model/country.dart';
import 'package:flutter_showcase_2/domain/repositories/get_country_list.dart';
import 'package:get_it/get_it.dart';

class GetCountryListRepImp implements GetCountryRepository {
  GetCountryListRepImp()
      : _getCountryListDataSourceImp = GetIt.I<GetCountryListDataSourceImp>();

  final GetCountryListDataSourceImp _getCountryListDataSourceImp;

  @override
  Future<Either<Failure, List<Country>>> getCountryList() async {
    try {
      final response = await _getCountryListDataSourceImp.getCountryList();
      return response
          // ignore: inference_failure_on_instance_creation
          .fold((failure) => Left(Failure.server(message: 'Error: $failure')),
              (response) {
        final countryList = response.data as List<dynamic>;
        final jsonList = List<Map<String, dynamic>>.from(countryList);
        // print(jsonList);
        final countries = jsonList.map((jsonMap) {
          return Country.fromJson(jsonMap);
        }).toList();

        // ignore: inference_failure_on_instance_creation
        return Right(countries);
      });
    } catch (e, stackTrace) {
      print(stackTrace);
      // ignore: inference_failure_on_instance_creation, only_throw_errors
      throw Left(Failure.connection(message: '$e'));
    }
  }
}
