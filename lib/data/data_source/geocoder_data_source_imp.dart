import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/domain/entities/location.dart';
import 'package:flutter_showcase_2/domain/interfaces/geocoding_data_sourse.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class GeocoderDataSourceImp implements GeocodingDataSource {
  final Dio _dio;
  final LocationRepositoryImp _locationRepository;
  final GeocoderApiConfig _geocoder;
  var logger = Logger();

  GeocoderDataSourceImp()
      : _dio = GetIt.I<Dio>(),
        _locationRepository = GetIt.I<LocationRepositoryImp>(),
        _geocoder = GetIt.I<GeocoderApiConfig>();

  @override
  Future<Either<Failure, Response<dynamic>>> getCountryByCoordinates() async {
    Location location = await _locationRepository.getLocation();
    try {
      Response response = await _dio.get(
        _geocoder.reverseGeocodingCurl,
        queryParameters: {
          "q": "${location.latitude},${location.longitude}",
          "key": _geocoder.apiKey,
        },
      );
      logger.d(
        '###GEOCODER###Response status code: ${response.statusCode}',
      );

      return Right(response);
    } catch (e) {
      logger.e('###GEOCODER###Error: $e');
      return Left(Failure.server(message: 'message: $e'));
    }
  }
}
