import 'package:flutter_showcase_2/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel(
      {required super.sourceName,
      required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.imageUrl,
      required super.publishedAt,
      required super.content});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      sourceName: json['source']['name'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      imageUrl: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'],
    );
  }
}
