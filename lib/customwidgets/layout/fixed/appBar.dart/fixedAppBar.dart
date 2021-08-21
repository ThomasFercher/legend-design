import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedMenu.dart';
import '../../../../objects/menuOption.dart';
import '../../../../router/routerProvider.dart';
import '../../../../styles/layoutType.dart';
import '../../../../styles/sizeProvider.dart';
import '../../../../styles/legendTheme.dart';

class FixedAppBar extends StatelessWidget {
  final bool? showMenu;

  FixedAppBar({
    this.showMenu,
  });

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);

    return SliverAppBar(
      backgroundColor: theme.colors.primaryColor,
      leading: Hero(
        tag: ValueKey("appBarLeading"),
        child: Container(
          width: 80,
          height: 80,
          child: Placeholder(),
        ),
      ),
      actions: [Container()],
      title: Hero(
        tag: ValueKey("appBarTitle"),
        child: Material(
          color: Colors.transparent,
          child: showMenu ?? true ? FixedMenu(context: context) : Container(),
        ),
      ),
      expandedHeight: theme.sizing.appbarHeight,
      collapsedHeight: theme.sizing.appbarHeight,
      toolbarHeight: theme.sizing.appbarHeight,
      pinned: true,
      automaticallyImplyLeading: false,
    );
  }
}
