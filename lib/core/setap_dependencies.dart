import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/UseCase/use_case_location.dart';
import 'package:flutter_showcase_2/data/data_source/geocoder_data_source_imp.dart';
import 'package:flutter_showcase_2/data/data_source/locator_location_data_source_imp.dart';
import 'package:flutter_showcase_2/data/data_source/news_data_source.dart';
import 'package:flutter_showcase_2/data/data_source/weather_data_source_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class SetupDependenciesImp {
  void setupDependencies() {
    locator.registerSingleton<ApiNewsConfig>(
      ApiNewsConfig(),
    );

    locator.registerSingleton<Dio>(
      Dio(),
    );

    locator.registerLazySingleton<LocatorLocationDataSource>(
      () => LocatorLocationDataSource(),
    );

    locator.registerLazySingleton<LocationRepositoryImp>(
      () => LocationRepositoryImp(),
    );

    locator.registerSingleton<GeocoderApiConfig>(
      GeocoderApiConfig(),
    );

    locator.registerLazySingleton<GeocoderDataSourceImp>(
      () => GeocoderDataSourceImp(),
    );

    locator.registerSingleton<WeatherApiConfig>(
      WeatherApiConfig(),
    );

    locator.registerLazySingleton<GetLocationUseCase>(
      () => GetLocationUseCase(),
    );

    locator.registerLazySingleton<WeatherDataSourseImp>(
      () => WeatherDataSourseImp(),
    );
    locator.registerLazySingleton<NewsDataSoursImp>(
      () => NewsDataSoursImp(),
    );
  }
}
