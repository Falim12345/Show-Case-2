// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/domain/repositories/news_repository.dart';
import 'package:get_it/get_it.dart';

import '../../util/api_config.dart';

class NewsRepositoriesImp implements NewsRepository {
  final Dio dio;
  final ApiNewsConfig apiConfig;

  NewsRepositoriesImp({required Dio dio})
      : dio = GetIt.I<Dio>(),
        apiConfig = GetIt.I<ApiNewsConfig>();

  @override
  getNews(String country) async {
    try {
      Response response = await dio.get(apiConfig.newsCurl,
          queryParameters: {"country": country},
          options: Options(
            headers: {'Authorization': 'Bearer ${apiConfig.apiKey}'},
          ));
      print(response.realUri);
      if (response.statusCode == 200) {
        //print(response.data);
        print(response.data);
        return response.data;
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw ('$e');
    }
  }

  @override
  getSearchNews(String q, String datefrom, String sortBy) async {
    try {
      Response response = await dio.get(apiConfig.searchNewsCurl,
          queryParameters: {"q": q, "datefrom": datefrom, "sortBy": sortBy},
          options: Options(
            headers: {'Authorization': 'Bearer ${apiConfig.apiKey}'},
          ));
      print(response.realUri);
      if (response.statusCode == 200) {
        //print(response.data);
        print(response.statusCode);
        // print(response.runtimeType);
        return response.data;
      } else {
        throw Exception('Error ${response.statusCode},${response.realUri}');
      }
    } catch (e) {
      throw ('$e');
    }
  }
}
