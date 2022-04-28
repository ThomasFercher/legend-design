import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/layout/scaffold/config/whether.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();
    return LegendScaffold(
      contentBuilder: (context, s) {
        return Container(
          height: s.height,
          child: Column(
            children: [],
          ),
        );
      },
      whether: ScaffoldWhether(
        showSiderMenu: true,
      ),
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
    );
  }
}
