import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();

    return LegendRouteBody(
      singlePage: true,
      builder: (context, s) {
        return Container(
          color: Colors.red,
          height: s.height,
          width: s.width,
        );
      },
    );
  }
}
