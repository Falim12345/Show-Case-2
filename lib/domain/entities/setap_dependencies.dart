import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/data_source/geolocator_location_data_source.dart';
import 'package:flutter_showcase_2/data/repositories_imp/location_rep_imp.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

// Класс для настройки зависимостей
class SetupDependenciesImp {
  // Метод для регистрации зависимостей
  void setupDependencies() {
    // Регистрация ApiNewsConfig как синглтона
    locator.registerSingleton<ApiNewsConfig>(ApiNewsConfig());

    // Регистрация Dio как синглтона
    locator.registerSingleton<Dio>(Dio());

    // Регистрация NewsRepositoriesImp с зависимостью от Dio
    locator.registerSingleton<NewsRepositoriesImp>(
        NewsRepositoriesImp(dio: locator<Dio>()));

    // Регистрация GeoLocatorLocationDataSource как ленивого синглтона
    locator.registerLazySingleton<GeoLocatorLocationDataSource>(
        () => GeoLocatorLocationDataSource());

    locator.registerLazySingleton<LocationRepositoryImp>(
        () => LocationRepositoryImp());
  }
}
