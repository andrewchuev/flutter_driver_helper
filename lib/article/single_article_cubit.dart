import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';


part 'single_article_state.dart';

class SingleArticleCubit extends Cubit<SingleArticleState> {

  SingleArticleCubit() : super(SingleArticleInitialState(fontSize: 14));

  void increaseFontSize () {
    var size = state.fontSize;
    size += 2;

    emit(SingleArticleIncreaseFontSizeState(fontSize: size));
  }

  void decreaseFontSize () {
    var size = state.fontSize;
    size -= 2;

    emit(SingleArticleDecreaseFontSizeState(fontSize: size));
  }
}

