import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/data_source/geocoder_data_source.dart';
import 'package:flutter_showcase_2/data/data_source/geolocator_location_data_source.dart';
import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class SetupDependenciesImp {
  void setupDependencies() {
    locator.registerSingleton<ApiNewsConfig>(ApiNewsConfig());

    locator.registerSingleton<Dio>(Dio());

    locator.registerSingleton<NewsRepositoriesImp>(NewsRepositoriesImp());

    locator.registerLazySingleton<GeoLocatorLocationDataSource>(
        () => GeoLocatorLocationDataSource());

    locator.registerLazySingleton<LocationRepositoryImp>(
        () => LocationRepositoryImp());

    locator.registerSingleton<GeocoderApiConfig>(GeocoderApiConfig());

    locator
        .registerLazySingleton<GeocoderDataSource>(() => GeocoderDataSource());
  }
}
