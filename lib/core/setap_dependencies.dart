import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_showcase_2/data/UseCase/use_case_location.dart';
import 'package:flutter_showcase_2/data/data_source/geocoder_data_source_imp.dart';
import 'package:flutter_showcase_2/data/data_source/get_country_list_sourse_imp.dart';
import 'package:flutter_showcase_2/data/data_source/locator_location_data_source_imp.dart';
import 'package:flutter_showcase_2/data/data_source/news_data_source.dart';
import 'package:flutter_showcase_2/data/data_source/weather_data_source_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/fairbase_auth_rep_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

class SetupDependenciesImp {
  void setupDependencies() {
    locator
      ..registerSingleton<ApiNewsConfig>(
        ApiNewsConfig(),
      )
      ..registerSingleton<Dio>(
        Dio(),
      )
      ..registerLazySingleton<LocatorLocationDataSource>(
        LocatorLocationDataSource.new,
      )
      ..registerSingleton<GeocoderApiConfig>(
        GeocoderApiConfig(),
      )
      ..registerLazySingleton<GeocoderDataSourceImp>(
        GeocoderDataSourceImp.new,
      )
      ..registerSingleton<WeatherApiConfig>(
        WeatherApiConfig(),
      )
      ..registerLazySingleton<GetLocationUseCase>(
        GetLocationUseCase.new,
      )
      ..registerLazySingleton<WeatherDataSourseImp>(
        WeatherDataSourseImp.new,
      )
      ..registerLazySingleton<NewsDataSoursImp>(
        NewsDataSoursImp.new,
      )
      ..registerLazySingleton<LocationRepositoryImp>(
        LocationRepositoryImp.new,
      )
      ..registerSingleton<NewsRepositoriesImp>(
        NewsRepositoriesImp(),
      )
      ..registerLazySingleton<FirebaseAuth>(
        () => FirebaseAuth.instance,
      )
      ..registerLazySingleton<AuthRepositoryImp>(
        AuthRepositoryImp.new,
      )
      ..registerLazySingleton<CountryApiConfig>(
        CountryApiConfig.new,
      )
      ..registerLazySingleton<GetCountryListDataSourceImp>(
        GetCountryListDataSourceImp.new,
      );
  }
}
