import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsread_flutter/data/newsapi_api/model/top_headlines_model.dart';
import 'package:newsread_flutter/keys.dart';

class NewsApiClient {
  static const endPointUrl = "newsapi.org";
  static final client = http.Client();

  static Future<TopHeadlines> getHeadlines({
    String query = '',
    String country = '',
  }) async {
    final queryParameters = {
      'country': country,
      'category': 'technology',
      'apiKey': apiKey,
      'q': query,
    };

    final uri = Uri.https(
      endPointUrl,
      '/v2/top-headlines',
      queryParameters,
    );
    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return TopHeadlines.fromJson(json);
  }
}
