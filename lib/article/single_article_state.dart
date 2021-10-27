part of 'single_article_cubit.dart';

abstract class SingleArticleState extends Equatable {
  double fontSize = 32;
  List<Object> get props => [fontSize];
}

class SingleArticleInitialState extends SingleArticleState {
  double fontSize;
  SingleArticleInitialState({required this.fontSize});

  @override
  List<Object> get props => [fontSize];
}

class SingleArticleIncreaseFontSizeState extends SingleArticleState {
  double fontSize;
  SingleArticleIncreaseFontSizeState({required this.fontSize});

  @override
  List<Object> get props => [fontSize];
}

class SingleArticleDecreaseFontSizeState extends SingleArticleState {
  double fontSize;
  SingleArticleDecreaseFontSizeState({required this.fontSize});

  @override
  List<Object> get props => [fontSize];
}