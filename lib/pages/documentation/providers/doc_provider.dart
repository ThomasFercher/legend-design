import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:legend_design/pages/documentation/models/article.dart';

final getDocsProvider = FutureProvider<List<Article>>((ref) async {
  return [];
});
