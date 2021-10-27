import 'package:driver_helper/article/single_article_cubit.dart';
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
    return BlocProvider(
      create: (context) => SingleArticleCubit(),
      child: BlocBuilder<SingleArticleCubit, SingleArticleState>(
        builder: (context, state) {
          double fontSize = state.fontSize;
          return Scaffold(
            appBar: AppBar(
                title: Text(title),
                actions: [
                  GestureDetector(
                      onTap: () => context.read<SingleArticleCubit>().decreaseFontSize(),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Icon(Icons.zoom_out, size: 40.0,)
                      )
                  ),
                  GestureDetector(
                      onTap: () => context.read<SingleArticleCubit>().increaseFontSize(),
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
                  Text(subTitle, style: const TextStyle(fontSize: 20.0),),
                  Html(
                    data: content,
                    style: {
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
