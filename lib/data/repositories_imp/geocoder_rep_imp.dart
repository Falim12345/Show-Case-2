import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/data_source/geocoder_data_source_imp.dart';
import 'package:flutter_showcase_2/data/model/geodata_model.dart';
import 'package:flutter_showcase_2/domain/repositories/geocoding_rep.dart';
import 'package:get_it/get_it.dart';

class GeocoderRepImp implements GeocoderRepository {
  GeocoderDataSourceImp geocoderDataSource;
  GeocoderRepImp() : geocoderDataSource = GetIt.I<GeocoderDataSourceImp>();

  @override
  Future<Either<Failure, GeodataModel>> getCoutryCode() async {
    try {
      var response = await geocoderDataSource.getCountryByCoordinates();
      return response.fold(
        (failure) => throw Exception(failure.message),
        (response) {
          GeodataModel geodataModel =
              geodataModelFromJson(json.encode(response.data));
          return Right(geodataModel);
        },
      );
    } catch (e) {
      throw Left(Failure.connection(message: '$e'));
    }
  }
}
