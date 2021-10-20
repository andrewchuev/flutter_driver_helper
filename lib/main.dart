import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme/theme_cubit.dart';

void main() {
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
          home: HomePage(title: 'Driver Helper'),
        );
      },
    );
  }
}

