import 'package:driver_helper/domain/blocs/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'articles.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          GestureDetector(
            onTap: () => context.read<ThemeCubit>().toggleTheme(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: const Icon(Icons.brightness_6)
              )
          ),
        ],
      ),
      body: Articles(),
    );
  }
}
