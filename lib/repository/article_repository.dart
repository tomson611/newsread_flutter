import 'package:newsread_flutter/data/newsapi_api/model/api_article_model.dart';
import 'package:newsread_flutter/data/newsapi_api/model/top_headlines_model.dart';
import 'package:newsread_flutter/data/newsapi_api/newsapi_api_client.dart';
import 'package:newsread_flutter/repository/model/article_model.dart';

class ArticleRepository {
  Future<List<Article>> getArticles({country}) async {
    TopHeadlines apiRequest = await NewsApiClient.getHeadlines(country: country);

    final Iterable<ApiArticle> apiRequestArticles = apiRequest.articles;

    List<Article> articles = apiRequestArticles
        .map((item) => Article(
              author: item.author,
              source: item.source,
              description: item.description,
              publishedAt: item.publishedAt,
              title: item.title,
              content: item.content,
              urlToImage: item.urlToImage,
            ))
        .toList();

    return articles;
  }

  Future<List<Article>> searchArticles({query, country}) async {
    TopHeadlines apiRequest = await NewsApiClient.getHeadlines(query: query, country: country);

    final Iterable<ApiArticle> apiRequestArticles = apiRequest.articles;

    List<Article> articles = apiRequestArticles
        .map((item) => Article(
              author: item.author,
              source: item.source,
              description: item.description,
              publishedAt: item.publishedAt,
              title: item.title,
              content: item.content,
              urlToImage: item.urlToImage,
            ))
        .toList();

    return articles;
  }
}
