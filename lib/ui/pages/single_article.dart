
import 'package:driver_helper/domain/blocs/article/single_article_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleSingle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String content;

  const ArticleSingle({Key? key, required this.title, required this.subTitle, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SingleArticleCubit>(
      create: (context) => SingleArticleCubit(),
      child: BlocBuilder<SingleArticleCubit, ZoomState>(
        builder: (context, state) {
          var fontSize = state.fontSize;
          return Scaffold(
            appBar: AppBar(
                title: Text(title),
                actions: [
                  GestureDetector(
                      onTap: () => context.read<SingleArticleCubit>().zoomOut(),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Icon(Icons.zoom_out, size: 40.0,)
                      )
                  ),
                  GestureDetector(
                      onTap: () => context.read<SingleArticleCubit>().zoomIn(),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Icon(Icons.zoom_in, size: 40.0,)
                      )
                  ),
                ]),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(subTitle, style: const TextStyle(fontSize: 25.0),),
                  Html(
                    data: content,
                    style: {
                      "h2": Style(fontSize: FontSize(fontSize + 2.0)),
                      "p": Style(fontSize: FontSize(fontSize)),
                    }
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
