import 'package:newsread_flutter/data/newsapi_api/model/api_article_model.dart';

class TopHeadlines {
  String status;
  int totalResults;
  List<ApiArticle> articles;

  TopHeadlines({
    required this.status,
    required this.totalResults,
    required this.articles,
  }); 

  factory TopHeadlines.fromJson(Map<String, dynamic> json) {
    return TopHeadlines(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int ,
      articles: (json['articles'] as List<dynamic>)
           .map((e) => ApiArticle.fromJson(e as Map<String, dynamic>))
           .toList(), 
    );
  }

}
