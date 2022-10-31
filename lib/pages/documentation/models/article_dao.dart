import 'package:firebase_database/firebase_database.dart';
import 'package:legend_design/db/firebase.dart';
import 'package:legend_design/pages/documentation/models/article.dart';

const String base_location = "/articles";
DatabaseReference docs = database.ref(base_location);

class ArticleDao {
  static Future<List<Article>> getAllArticles() async {
    final snapshot = await docs.get();
    final data = snapshot.value;

    print(data);

    List<dynamic> dataList = data as List<dynamic>;

    print(dataList);

    return List.of(
      dataList.map(
        (item) => Article.fromJson(item),
      ),
    );
  }

  static Article getArticle(String id) {
    final db = ref;
    return Article("");
  }
}
