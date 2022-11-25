import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);

    print(ModalRoute.of(context)!.settings.arguments);
    print(RouteInfoProvider.of(context)?.route.urlArguments);
    return LegendRouteBody(
      singlePage: true,
      builder: (context, s) {
        return Container(
          color: Colors.red,
          child: Text(
            "testr",
            style: theme.typography.h5,
          ),
        );
      },
    );
  }
}
