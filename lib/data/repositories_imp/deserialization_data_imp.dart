import 'package:dio/dio.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';
import 'package:flutter_showcase_2/data/repositories_imp/news_repositories_imp.dart';
import 'package:flutter_showcase_2/domain/repositories/deserialization_data.dart';
import 'package:dio/src/response.dart';
import 'package:get_it/get_it.dart';

class DeserializationDataimp implements DeserializationData {
  final Dio dio;
  final NewsRepositoriesImp newsRepImp;
  DeserializationDataimp()
      : dio = GetIt.I<Dio>(),
        newsRepImp = GetIt.I<NewsRepositoriesImp>();
  @override
  Future<List<NewsModel>> deserializationDataFromApi() async {
    var deserializationGetNews = newsRepImp.getNews('us');
    if (deserializationGetNews.statusCode == 200) {
      return deserializationGetNews.data.map<NewsModel>((json) {
            return NewsModel.fromJson(
                json); // Преобразование JSON в объект NewsModel
          })?.toList() ??
          [];
    }
    return [];
  }
}
