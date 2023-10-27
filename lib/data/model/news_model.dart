class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }
}

class NewsArticle {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final DateTime publishedAt;
  final String content;

  NewsArticle({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticle.fromJson(json) {
    return NewsArticle(
      source: Source.fromJson(json["source"] ?? {"id": 'null', "name": ""}),
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      imageUrl: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'])
          : DateTime
              .now(), // По умолчанию устанавливаем текущую дату, если publishedAt == null
      content: json['content'] ?? "",
    );
  }
}
