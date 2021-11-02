import 'package:flutter/material.dart';
import 'ui/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/blocs/theme/theme_cubit.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const DriverHelper(),
  ));
}

class DriverHelper extends StatelessWidget {
  const DriverHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const HomePage(title: 'Driver Helper'),
        );
      },
    );
  }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}