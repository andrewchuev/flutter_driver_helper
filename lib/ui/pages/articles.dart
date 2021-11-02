import '/domain/data_providers/articles_repository.dart';
import 'package:flutter/material.dart';

import 'single_article.dart';

class Articles extends StatelessWidget {
  Articles({Key? key}) : super(key: key);
  final ArticlesRepository articlesRepo = ArticlesRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: articlesRepo.getArticles(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var articles = snapshot.data;
          return snapshot.hasData ? ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArticleSingle(title: articles[i].title, subTitle: articles[i].subTitle, content: articles[i].content)),
                );
              },
              child: ListTile(
                title: Text(articles[i].title),
                subtitle: Text(articles[i].subTitle),
                trailing: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Colors.blue,
                  size: 36.0,
                ),
              ),
            ),
          ) : const Center(child: CircularProgressIndicator());
        }


    );
  }
}
