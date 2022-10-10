import 'package:flutter/material.dart';

import 'components/customListTile.dart';
import 'model/article_model.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  late Future<List<Article>> getArticles;

  @override
  void initState() {
    getArticles = client.getArticle();
    super.initState();
  }

  // ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("News App", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
      body: FutureBuilder(
        future: getArticles,
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data as List<Article>;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
