import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/fixed/sider/sider_submenu.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:provider/src/provider.dart';

class FixedSiderMenu extends StatelessWidget {
  List<Widget> tiles = [];
  List<MenuOption>? options;

  FixedSiderMenu({
    Key? key,
    this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    options = RouterProvider.of(context).menuOptions;
    MenuOption? sel = RouterProvider.of(context).current;

    for (MenuOption option in options!) {
      if (option.children == null) {
        tiles.add(
          DrawerMenuTile(
            icon: option.icon,
            title: option.title,
            path: option.page,
            backgroundColor: theme.colors.siderColorTheme.backgroundMenu,
            left: false,
            activeColor: theme.colors.selectionColor,
            color: theme.colors.siderColorTheme.foreground,
            collapsed: false,
            forceColor: option == sel,
          ),
        );
      } else {
        tiles.add(
          SiderSubMenu(
            option: option,
          ),
        );
      }
    }

    return Container(
      color: theme.colors.siderColorTheme.backgroundMenu,
      padding: const EdgeInsets.only(
        top: 24.0,
      ),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: tiles,
      ),
    );
  }
}