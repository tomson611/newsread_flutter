import 'package:flutter/material.dart';

import '../model/article_model.dart';
import '../services/api_service.dart';
import 'widgets/custom_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  late Future<List<Article>> getArticles;

  @override
  void initState() {
    getArticles = client.getArticle();
    super.initState();
  }

  Future<void> _pullRefresh() async {
    setState(() {
      getArticles = client.getArticle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NewsRead",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getArticles,
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data as List<Article>;
            return RefreshIndicator(
              onRefresh: _pullRefresh,
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) => CustomListTile(
                  article: articles[index],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
