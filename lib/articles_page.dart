import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsread_flutter/articles_list.dart';
import 'package:newsread_flutter/bloc/article_bloc.dart';
import 'package:newsread_flutter/bloc/article_events.dart';
import 'package:newsread_flutter/repository/article_repository.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) =>
            ArticleBloc(ArticleRepository())..add(LoadArticleEvent()),
        child: const ArticlesList(),
      ),
    );
  }
}
