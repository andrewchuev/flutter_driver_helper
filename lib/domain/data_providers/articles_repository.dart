import 'package:driver_helper/models/article_model.dart';
import 'articles_provider.dart';

class ArticlesRepository {
  Future<List<Article>> getArticles() async {
    final List<Map<String, dynamic>> maps = await parseArticles();
    return List.generate(maps.length, (i) {
      return Article(
        id: maps[i]['article_id'],
        articleNo: maps[i]['article_no'],
        title: maps[i]['article_title'],
        subTitle: maps[i]['article_subtitle'],
        content: maps[i]['article_content'],
      );
    });
  }
}

