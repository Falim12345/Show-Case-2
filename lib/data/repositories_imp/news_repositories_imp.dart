// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/domain/repositories/news_repository.dart';

import '../../util/api_config.dart';

class NewsRepositoriesImp extends NewsRepository {
  final Dio dio;

  NewsRepositoriesImp({required this.dio});

  @override
  Future<Map<String, dynamic>> getNews(String country) async {
    try {
      Response response = await dio.get(ApiNewsConfig().newsCurl,
          queryParameters: {"country": country},
          options: Options(
            headers: {'Authorization': 'Bearer ${ApiNewsConfig().apiKey}'},
          ));
      print(response.realUri);
      if (response.statusCode == 200) {
        //print(response.data);
        print(response.statusCode);
        return response.data;
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw ('$e');
    }
  }

  @override
  Future<Map<String, dynamic>> getSearchNews(
      String q, String datefrom, String sortBy) async {
    try {
      Response response = await dio.get(ApiNewsConfig().searchNewsCurl,
          queryParameters: {"q": q, "datefrom": datefrom, "sortBy": sortBy},
          options: Options(
            headers: {'Authorization': 'Bearer ${ApiNewsConfig().apiKey}'},
          ));
      print(response.realUri);
      if (response.statusCode == 200) {
        //print(response.data);
        print(response.statusCode);
        return response.data;
      } else {
        throw Exception('Error ${response.statusCode},${response.realUri}');
      }
    } catch (e) {
      throw ('$e');
    }
  }
}
