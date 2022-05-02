import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/layout/scaffold/config/whether.dart';
import 'package:provider/src/provider.dart';

class IconButtonPage extends StatelessWidget {
  const IconButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();
    return LegendScaffold(
        pageName: 'Icon Button',
        layoutType: LayoutType.FixedHeader,
        whether: ScaffoldWhether(
          showSiderMenu: false,
          isUnderlyingRoute: true,
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LegendAnimatedIcon(
                  icon: Icons.add,
                  theme: LegendAnimtedIconTheme(
                    enabled: Colors.red,
                    disabled: Colors.red[300]!,
                  ),
                  onPressed: () => {},
                  iconSize: 64,
                ),
                LegendAnimatedIcon(
                  icon: Icons.add,
                  theme: LegendAnimtedIconTheme(
                    enabled: Colors.green,
                    disabled: Colors.green[300]!,
                  ),
                  onPressed: () => {},
                  iconSize: 64,
                ),
                LegendAnimatedIcon(
                  icon: Icons.add,
                  theme: LegendAnimtedIconTheme(
                    enabled: Colors.blue,
                    disabled: Colors.blue[300]!,
                  ),
                  onPressed: () => {},
                  iconSize: 64,
                ),
              ],
            ),
          ],
        ));
  }
}
