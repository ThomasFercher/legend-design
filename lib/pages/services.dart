import 'package:flutter/material.dart';
import 'package:legend_design_core/libraries/scaffold.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage();

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);

    ScaffoldInfo info = ScaffoldInfo.of(context)!;
    return LegendRouteBody(
      singlePage: false,
      builder: (context, sup) {
        return Container();
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
