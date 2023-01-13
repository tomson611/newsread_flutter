import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsread_flutter/bloc/article_bloc.dart';
import 'package:newsread_flutter/bloc/article_state.dart';
import 'package:newsread_flutter/screens/widgets/custom_list_tile.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (BuildContext context, state) {
        if (state is ArticleLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ArticleLoadedState) {
          return ListView.builder(
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
    );
  }
}
