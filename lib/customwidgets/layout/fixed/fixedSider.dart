import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../drawers/siderMenuVerticalTile.dart';
import '../../../objects/menuOption.dart';
import '../../../router/routerProvider.dart';
import '../../../styles/layoutType.dart';
import '../../../styles/sizeProvider.dart';
import '../../../styles/legendTheme.dart';

import '../drawers/drawerMenuTile.dart';

class FixedSider extends StatelessWidget {
  final bool? showMenu;
  WidgetBuilder? builder;

  FixedSider({
    this.showMenu,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = SizeProvider.of(context).screenSize;

    return Hero(
      tag: ValueKey("sider"),
      child: Material(
        elevation: 20,
        child: screenSize != ScreenSize.Small
            ? Sider(showMenu: showMenu, builder: builder, context: context)
            : CollapsedSider(context: context),
      ),
    );
  }
}

class CollapsedSider extends StatelessWidget {
  const CollapsedSider({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    List<MenuOptionHeader> options = RouterProvider.of(context).menuOptions;
    List<SiderMenuVerticalTile> tiles = List.of(
      options.map(
        (option) => SiderMenuVerticalTile(
          icon: option.icon,
          title: option.title,
          path: option.page,
        ),
      ),
    );
    return Container(
      width: 80,
      height: MediaQuery.of(context).size.height,
      color: theme.colors.primaryColor,
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: tiles,
          )
        ],
      ),
    );
  }
}

class Sider extends StatelessWidget {
  const Sider({
    Key? key,
    required this.showMenu,
    required this.builder,
    required this.context,
  }) : super(key: key);

  final bool? showMenu;
  final WidgetBuilder? builder;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    List<MenuOptionHeader> options = RouterProvider.of(context).menuOptions;
    List<DrawerMenuTile> tiles = List.of(
      options.map(
        (option) => DrawerMenuTile(
          icon: option.icon,
          title: option.title,
          path: option.page,
          backgroundColor: Colors.teal,
          left: true,
        ),
      ),
    );

    List<Widget> children = [
      Container(
        child: Placeholder(),
        height: 100,
      ),
    ];

    if (showMenu ?? false)
      children.add(ListView(
        shrinkWrap: true,
        children: tiles,
      ));

    if (builder != null)
      children.add(
        Expanded(
          child: Builder(
            builder: builder!,
          ),
        ),
      );

    return Container(
      width: 200,
      height: MediaQuery.of(context).size.height,
      color: theme.colors.primaryColor,
      child: Column(
        children: children,
      ),
    );
  }
}
