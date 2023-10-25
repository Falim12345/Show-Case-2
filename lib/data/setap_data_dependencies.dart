import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/domain/interfaces/setap_dependencies.dart';
import 'package:flutter_showcase_2/util/api_config.dart';
import 'package:get_it/get_it.dart';

class SetapDataDependebcies implements SetapDependebcies {
  @override
  GetIt locator = GetIt.instance;
  void setapDependebcies() {
    locator.registerSingleton<ApiNewsConfig>(ApiNewsConfig());
    locator.registerSingleton<Dio>(Dio());
  }
}
