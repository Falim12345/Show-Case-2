import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';

abstract class NewsRepository {
  getSearchNews(
    String q,
    String datefrom,
    String sortBy,
  );
  getNews(
    String country,
  );
}

abstract class NewsMapper {
  List<NewsArticle> mapApiDataToModels(List<Map<String, dynamic>> apiData);
}
