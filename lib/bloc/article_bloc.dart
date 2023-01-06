import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsread_flutter/bloc/article_events.dart';
import 'package:newsread_flutter/bloc/article_state.dart';
import 'package:newsread_flutter/repository/article_repository.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ArticleRepository _articleRepository;

  ArticleBloc(this._articleRepository) : super(ArticleLoadingState()) {
    on<LoadArticleEvent>((event, emit) async {
      emit(ArticleLoadingState());
      try {
        final article = await _articleRepository.getArticle();
        print(article);
        emit(ArticleLoadedState(article));
      } catch (e) {
        emit(ArticleErrorState(e.toString()));
      }
    });
  }
}
