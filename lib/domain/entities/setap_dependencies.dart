import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/interfaces/setap_dependencies.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';

class SetapDependebciesImp implements SetapDependebcies {
  @override
  GetIt locator = GetIt.instance;
  void setapDependebcies() {
    locator.registerSingleton<ApiNewsConfig>(ApiNewsConfig());
    locator.registerSingleton<Dio>(Dio());
    locator.registerSingleton<NewsRepositoriesImp>(
        NewsRepositoriesImp(dio: locator<Dio>()));
  }
}
