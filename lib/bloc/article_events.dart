import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class LoadArticleEvent extends ArticleEvent {
  @override
  List<Object> get props => [];
}