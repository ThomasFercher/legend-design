import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:legend_design/pages/documentation/providers/doc_provider.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

class DocsPage extends ConsumerWidget {
  const DocsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LegendTheme theme = LegendTheme.of(context);

    ref.listen(getDocsProvider, (previous, next) {
      print(next);
    });
    return Container();
  }
}
