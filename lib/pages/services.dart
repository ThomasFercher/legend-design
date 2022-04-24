import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:provider/src/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage();

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();

    return LegendScaffold(
      contentBuilder: (context, s) {
        print(s.height);
        return Container(
          //height: s.height,
          child: Column(
            children: [
              Container(
                height: 20,
                width: 20,
              ),
            ],
          ),
        );
      },
      pageName: "Products",
      showSiderMenu: true,
      singlePage: true,
      siderBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              LegendAnimatedIcon(
                icon: Icons.palette,
                theme: LegendAnimtedIconTheme(
                  disabled: theme.siderPalette.foreground,
                  enabled: theme.siderPalette.selection,
                ),
                onPressed: () {},
              )
            ],
          ),
        );
      },
      layoutType: LayoutType.FixedSider,
    );
  }
}
