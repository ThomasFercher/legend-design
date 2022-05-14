import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:provider/src/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage();

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();

    return LegendRouteBody(
      singlePage: false,
      slivers: [Container()],
      /* sliverAppBar: LegendAppBar(
        config: LegendAppBarConfig(
          appBarHeight: theme.appBarSizing.appBarHeight,
          showSubMenu: false,
          elevation: 1,
          pinned: true,
          
          horizontalPadding: theme.appBarSizing.contentPadding.left,
        ),
        type: AppBarLayoutType.TiMeAc,
      )
*/
    );
  }
}
