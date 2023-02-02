import 'package:newsread_flutter/data/newsapi_api/newsapi_api_client.dart';
import 'package:newsread_flutter/repository/model/article_model.dart';

class ArticleRepository {
  Future<List<Article>> getArticle() async {
    final top = await NewsApiClient.getHeadlines();
    final body = top.articles;

    List<Article> articles = body
        .map((item) => Article(
              author: item.author,
              source: item.source,
              description: item.description,
              publishedAt: item.publishedAt,
              title: item.title,
              url: item.url,
              urlToImage: item.urlToImage,
            ))
        .toList();

    return articles;
  }
}
