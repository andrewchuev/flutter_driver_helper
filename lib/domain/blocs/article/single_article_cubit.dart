import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ZoomState {
  const ZoomState({required this.fontSize});
  final double fontSize;
}

class SingleArticleCubit extends Cubit<ZoomState> {

  SingleArticleCubit() : super(const ZoomState(fontSize: 25.0)) {
    getPrefs();
  }

  void zoomIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(ZoomState(fontSize: state.fontSize + 2.0));
    await prefs.setDouble('fontSize', state.fontSize);
  }
  void zoomOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(ZoomState(fontSize: state.fontSize - 2.0));
    await prefs.setDouble('fontSize', state.fontSize);
  }

  void getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double fontSize  = prefs.getDouble('fontSize') ?? 25.0;
    emit(ZoomState(fontSize: fontSize));
  }
}
