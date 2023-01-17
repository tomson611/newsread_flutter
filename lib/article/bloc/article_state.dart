import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:newsread_flutter/data/repository/model/article_model.dart';

@immutable
abstract class ArticleState extends Equatable {}

class ArticleLoadingState extends ArticleState {
  @override
  List<Object?> get props => [];
}

class ArticleLoadedState extends ArticleState {
  final List<Article> article ;

  ArticleLoadedState(this.article);

  @override
  List<Object?> get props => [article];
}

class ArticleErrorState extends ArticleState {
  final String error;

  ArticleErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
