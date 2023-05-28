import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsread_flutter/article/bloc/article_bloc.dart';
import 'package:newsread_flutter/article/bloc/article_events.dart';
import 'package:newsread_flutter/article/bloc/article_state.dart';
import 'package:newsread_flutter/article/view/articles_list.dart';
import 'package:newsread_flutter/article/widgets/custom_list_tile.dart';
import 'package:newsread_flutter/repository/article_repository.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NewsRead',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: MySearchDelegate(
                      ArticleBloc(ArticleRepository()),
                      MyCustomFormState.getCountry,
                    ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocProvider(
        create: (_) =>
            ArticleBloc(ArticleRepository())..add(const LoadArticleEvent()),
        child: const ArticlesList(),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  final ArticleBloc articleBloc;
  final String country;

  MySearchDelegate(this.articleBloc, this.country);

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (_) => ArticleBloc(ArticleRepository())
        ..add(LoadSearchedArticlesEvent(query: query, country: country)),
      child: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (BuildContext context, state) {
          if (state is ArticleLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ArticleLoadedState) {
            return ListView.builder(
              cacheExtent: 200,
              itemCount: state.article.length,
              itemBuilder: (context, index) => CustomListTile(
                article: state.article[index],
              ),
            );
          }
          if (state is ArticleErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
