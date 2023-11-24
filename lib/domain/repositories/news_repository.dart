import 'package:dartz/dartz.dart';
import 'package:flutter_showcase_2/core/error/failure.dart';
import 'package:flutter_showcase_2/data/model/news_model.dart';

abstract class NewsRepository {
  getSearchNews();
  getNews();
}
