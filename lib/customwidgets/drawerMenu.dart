import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/drawerMenuTile.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/layoutType.dart';
import 'package:webstore/styles/sizeProvider.dart';

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

    SizeProvider ss = SizeProvider.of(context);
    double? width;

    if (ss.screenSize == ScreenSize.Small) {
      width = ss.width * 3 / 4;
    } else {
      width = null;
    }

    return Container(
      width: width,
      child: Drawer(
        child: Column(
          children: [
            Container(child: Text("Test")),
            ListView(
              children: tiles,
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
