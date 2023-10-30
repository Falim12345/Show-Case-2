// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
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
  Future<Response<Map<String, dynamic>>> getNews(String country) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(
        apiConfig.newsCurl,
        queryParameters: {"country": country},
        options: Options(
          headers: {'Authorization': 'Bearer ${apiConfig.apiKey}'},
        ),
      );
      print(response.realUri);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw ('$e');
    }
  }

  @override
  Future<Response<Map<String, dynamic>>> getSearchNews(
      String q, String datefrom, String sortBy) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(
        apiConfig.searchNewsCurl,
        queryParameters: {"q": q, "datefrom": datefrom, "sortBy": sortBy},
        options: Options(
          headers: {'Authorization': 'Bearer ${apiConfig.apiKey}'},
        ),
      );
      print(response.realUri);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Error ${response.statusCode},${response.realUri}');
      }
    } catch (e) {
      throw ('$e');
    }
  }
}
