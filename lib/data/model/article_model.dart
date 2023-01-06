import 'dart:convert';
import 'source_model.dart';

Article articleModelFromJson(String str) => Article.fromJson(json.decode(str));

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  // String content;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      // required this.content
      });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? '',
      title: json['title'] as String,
      description: json['description'] ?? '',
      url: json['url'] as String,
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] as String,
      // content: json['content'] ?? '',
    );
  }
}