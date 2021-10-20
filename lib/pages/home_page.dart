import 'package:driver_helper/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'articles.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          ElevatedButton(
              onPressed: () => context.read<ThemeCubit>().toggleTheme(), child: const Icon(Icons.brightness_6))
        ],
      ),
      body: Articles(),
    );
  }
}
