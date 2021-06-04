import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/siderMenuVerticalTile.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/layoutType.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/styles/themeProvider.dart';

import 'drawerMenuTile.dart';

class FixedSider extends StatelessWidget {
  final bool? showMenu;

  FixedSider({this.showMenu});

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = SizeProvider.of(context).screenSize;

    return Hero(
      tag: ValueKey("sider"),
      child: Material(
        elevation: 20,
        child: screenSize != ScreenSize.Small
            ? sider(context)
            : collapsedSider(context),
      ),
    );
  }

  Widget sider(BuildContext context) {
    ThemeProvider theme = ThemeProvider.of(context);
    List<MenuOptionHeader> options = RouterProvider.of(context).menuOptions;
    List<DrawerMenuTile> tiles = List.of(
      options.map(
        (option) => DrawerMenuTile(
          icon: option.icon,
          title: option.title,
          path: option.page,
        ),
      ),
    );
    return Container(
      width: 200,
      height: MediaQuery.of(context).size.height,
      color: theme.primaryColor,
      child: Column(
        children: [
          Container(
            child: Placeholder(),
            height: 100,
          ),
          showMenu ?? false
              ? ListView(
                  shrinkWrap: true,
                  children: tiles,
                )
              : Container()
        ],
      ),
    );
  }

  Widget collapsedSider(BuildContext context) {
    ThemeProvider theme = ThemeProvider.of(context);
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
      color: theme.primaryColor,
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
