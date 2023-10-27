import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';

abstract class NewsRepository {
  Response<dynamic> getSearchNews(
    String q,
    String datefrom,
    String sortBy,
  );
  Response<dynamic> getNews(
    String country,
  );
}

abstract class NewsMapper {
  List<NewsArticle> mapApiDataToModels(List<Map<String, dynamic>> apiData);
}
