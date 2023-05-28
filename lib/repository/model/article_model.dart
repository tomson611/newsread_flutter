import 'source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String content;
  String urlToImage;
  String publishedAt;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.urlToImage,
      required this.publishedAt,
      });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? '',
      title: json['title'] as String,
      description: json['description'] ?? '',
      content: json['content'] as String,
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] as String,
    );
  }
}