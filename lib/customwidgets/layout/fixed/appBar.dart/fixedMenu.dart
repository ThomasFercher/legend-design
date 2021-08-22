import 'package:flutter/material.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/layoutType.dart';
import 'package:webstore/styles/sizeProvider.dart';

class FixedMenu extends StatelessWidget {
  const FixedMenu({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  Widget getCollapsedMenu(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        iconSize: 36,
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<MenuOptionHeader> options = RouterProvider.of(context).menuOptions;

    double menuWidth;

    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      height: 80,
      child: LayoutBuilder(
        builder: (context, constraints) {
          menuWidth = constraints.maxWidth;

          if (menuWidth > 600) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Container(
                  child: Row(
                    children: options,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            );
          } else {
            return getCollapsedMenu(context);
          }
        },
      ),
    );
  }
}
