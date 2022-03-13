import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_widgets/datadisplay/tag/legendTag.dart';
import 'package:provider/src/provider.dart';

class TagsPage extends StatelessWidget {
  const TagsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return LegendScaffold(
      pageName: 'Tags',
      layoutType: LayoutType.FixedHeader,
      showSiderMenu: false,
      isUnderlyingRoute: true,
      contentBuilder: (context, s) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LegendTag(color: Colors.purpleAccent, text: "Test"),
                LegendTag(color: Colors.redAccent, text: "Test"),
                LegendTag(color: Colors.tealAccent, text: "Test"),
                LegendTag(color: Colors.blueAccent, text: "Test"),
                LegendTag(color: Colors.yellow, text: "Test"),
              ],
            )
          ],
        );
      },
    );
  }
}
