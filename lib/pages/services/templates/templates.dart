import 'package:flutter/widgets.dart';
import 'package:legend_design_core/libraries/scaffold.dart';

class TemplatesPage extends StatelessWidget {
  const TemplatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LegendRouteBody(
      builder: (context, s) => Container(
        child: Text(
          "content",
        ),
      ),
    );
  }
}
