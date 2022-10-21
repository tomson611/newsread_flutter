import 'package:flutter/material.dart';

import 'components/custom_list_tile.dart';
import 'model/article_model.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsRead',
      home: const HomePage(),
      theme: ThemeData(
          fontFamily: 'Lato',
          brightness: Brightness.light,
          primaryColor: Colors.orange,
          appBarTheme: const AppBarTheme(
            color: Colors.orange,
          ),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              fontSize: 14.0,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              primary: Colors.orange,
            ),
          )),
    );
  }
}

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
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context),
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
