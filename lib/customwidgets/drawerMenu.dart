import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/drawerMenuTile.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return Drawer(
      child: Column(
        children: [
          Container(child: Text("Test")),
          ListView(
            children: tiles,
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
