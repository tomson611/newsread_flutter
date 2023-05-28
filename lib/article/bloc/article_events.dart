import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadArticleEvent extends ArticleEvent {
  final String country;

  const LoadArticleEvent({this.country = ''});

  @override
  List<Object> get props => [country];
}

class LoadSearchedArticlesEvent extends ArticleEvent {
  final String query;
  final String country;

  const LoadSearchedArticlesEvent({this.query = '', this.country = ''});

  @override
  List<Object> get props => [query];
}
