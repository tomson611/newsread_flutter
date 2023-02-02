import 'package:newsread_flutter/repository/model/source_model.dart';

class ApiArticle {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ApiArticle(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content
      });

  factory ApiArticle.fromJson(Map<String, dynamic> json) {
    return ApiArticle(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? '',
      title: json['title'] as String,
      description: json['description'] ?? '',
      url: json['url'] as String,
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] as String,
      content: json['content'] ?? '',
    );
  }
}

