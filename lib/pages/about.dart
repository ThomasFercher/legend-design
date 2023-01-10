import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_config.dart';
import 'package:legend_design_core/layout/appBar.dart/legend_sliverbar.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/layout/scaffold/scaffold_info.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    final info = ScaffoldInfo.of(context);

    print(ModalRoute.of(context)!.settings.arguments);
    print(RouteInfoProvider.of(context)?.route.urlArguments);
    return LegendRouteBody(
      sliverAppBar: LegendSliverBar(
        config: LegendAppBarConfig(
          appBarHeight: 80,
          elevation: 1,
          floating: true,
        ),
        actions: info?.scaffold.builders.appBarActions,
      ),
      builder: (context, s) {
        return Container();
      },
    );
  }
}
