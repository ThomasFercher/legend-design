import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final String route;

  Article(this.route);

  factory Article.fromJson(Map<String, dynamic> json) {
    return _$ArticleFromJson(json);
  }
}
