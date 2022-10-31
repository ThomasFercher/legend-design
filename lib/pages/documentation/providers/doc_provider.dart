import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:legend_design/pages/documentation/models/article.dart';
import 'package:legend_design/pages/documentation/models/article_dao.dart';

final getDocsProvider = FutureProvider<List<Article>>((ref) async {
  return ArticleDao.getAllArticles();
});
