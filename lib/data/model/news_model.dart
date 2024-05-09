// To parse this JSON data, do
//
//     final newsArticle = newsArticleFromJson(jsonString);

import 'dart:convert';

NewsArticleModel newsArticleFromJson(String str) =>
    NewsArticleModel.fromJson(json.decode(str) as Map<String, dynamic>);

String newsArticleToJson(NewsArticleModel data) => json.encode(data.toJson());

class NewsArticleModel {
  NewsArticleModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      NewsArticleModel(
        status: json['status'] as String,
        totalResults: json['totalResults'] as int,
        articles: List<Article>.from(
          json['articles'].map(Article.fromJson) as List<Article>,
        ),
      );
  String status;
  int totalResults;
  List<Article> articles;

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': List<dynamic>.from(
          articles.map((x) => x.toJson()),
        ),
      };
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String,
        publishedAt: DateTime.parse(json['publishedAt'] as String),
        content: json['content'] as String,
      );
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  Map<String, dynamic> toJson() => {
        'source': source.toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt.toIso8601String(),
        'content': content,
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'] as String,
        name: json['name'] as String,
      );
  String? id;
  String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
