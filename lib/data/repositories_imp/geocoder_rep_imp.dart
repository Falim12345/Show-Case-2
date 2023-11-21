import 'dart:convert';

import 'package:flutter_showcase_2/data/data_source/geocoder_data_source_imp.dart';
import 'package:flutter_showcase_2/data/model/geodata_model.dart';
import 'package:flutter_showcase_2/domain/repositories/geocoding_rep.dart';
import 'package:get_it/get_it.dart';

class GeocoderRepImp implements GeocoderRepository {
  GeocoderDataSource geocoderDataSource;
  GeocoderRepImp() : geocoderDataSource = GetIt.I<GeocoderDataSource>();

  @override
  Future getCoutryCode() async {
    try {
      var response = await geocoderDataSource.getCountryByCoordinates();
      return response.fold(
        (failure) => throw Exception(failure.message),
        (response) {
          GeodataModel geodataModel =
              geodataModelFromJson(json.encode(response.data));
          return geodataModel.results.first.components.countryCode;
        },
      );
    } catch (e) {
      throw Exception("Ошибка при получении кода страны: $e");
    }
  }
}
