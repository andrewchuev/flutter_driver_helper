import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleSingle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String content;
  const ArticleSingle({Key? key, required this.title, required this.subTitle, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ListTile(title: Text(title), subtitle: Text(subTitle),),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Html(data: content,),
      ),
    );
  }
}
