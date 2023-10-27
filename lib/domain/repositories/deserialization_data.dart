import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';

abstract class DeserializationData {
  Future<List<NewsArticle>> deserializationDataFromApi();
}
