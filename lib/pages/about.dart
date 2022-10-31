import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);

    return LegendRouteBody(
      singlePage: true,
      builder: (context, s) {
        return Column(
          children: [
            Image.asset("assets/photos/larrylegend.png"),
            ElevatedButton(
              onPressed: () => LegendRouter.of(context).pushPage(
                settings: RouteSettings(
                  name: "/about/1",
                ),
              ),
              child: Text("t"),
            ),
          ],
        );
      },
    );
  }
}
