import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_config.dart';
import 'package:legend_design_core/layout/appBar.dart/layout/appbar_layout.dart';
import 'package:legend_design_core/layout/appBar.dart/legend_appbar.dart';
import 'package:legend_design_core/layout/appBar.dart/slivers/persistent_header.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/layout/scaffold/scaffoldInfo.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:provider/src/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage();

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);

    ScaffoldInfo info = ScaffoldInfo.of(context);
    return LegendRouteBody(
      singlePage: false,
      builder: (context, sup) {
        return Column(
          children: [
            Container(
              height: 1000,
              width: 200,
              color: Colors.red,
            ),
            Container(
              height: 1000,
              width: 200,
              color: Colors.yellow,
            ),
          ],
        );
      },

      /*  sliverPersistentHeader: PersistentHeader(
        maxHeight: 40,
        backgroundColor: theme.appBar.background,
        child: Container(),
        minHeight: 40,
      ),*/
      /*   sliverAppBar: LegendAppBar(
        actions: ScaffoldInfo.getBuilders(context).appBarActions,
        config: LegendAppBarConfig(
          appBarHeight: theme.appBarSizing.appBarHeight,
          showSubMenu: false,
          elevation: 1,
          pinned: true,
          horizontalPadding: theme.appBarSizing.contentPadding.left,
        ),
        type: AppBarLayoutType.TiMeAc,
      ),*/
    );
  }
}
