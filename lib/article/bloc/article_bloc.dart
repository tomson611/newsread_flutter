import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsread_flutter/article/bloc/article_events.dart';
import 'package:newsread_flutter/article/bloc/article_state.dart';
import 'package:newsread_flutter/repository/article_repository.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _articleRepository;

  ArticleBloc(this._articleRepository) : super(ArticleLoadingState()) {
    on<LoadArticleEvent>((event, emit) async {
      emit(ArticleLoadingState());
      try {
        final article =
            await _articleRepository.getArticles(country: event.country);
        emit(ArticleLoadedState(article));
      } catch (e) {
        emit(ArticleErrorState(e.toString()));
      }
    });

    on<LoadSearchedArticlesEvent>((event, emit) async {
      emit(ArticleLoadingState());
      try {
        final article = await _articleRepository.searchArticles(
          query: event.query,
          country: event.country,
        );
        emit(ArticleLoadedState(article));
      } catch (e) {
        emit(ArticleErrorState(e.toString()));
      }
    });
  }
}
