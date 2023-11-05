import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';

abstract class NewsRepository {
  getSearchNews(
      {required String q,
      required String datefrom,
      required String sortBy,
      required int pageSize,
      required int page});
  Future<NewsArticle> getNews({
    required String country,
  });
}

abstract class NewsMapper {
  List<NewsArticle> mapApiDataToModels(List<Map<String, dynamic>> apiData);
}
