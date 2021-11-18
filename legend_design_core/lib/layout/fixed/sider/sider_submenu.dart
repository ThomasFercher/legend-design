import 'package:flutter/material.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:provider/src/provider.dart';

class SiderSubMenu extends StatelessWidget {
  final MenuOption option;
  const SiderSubMenu({
    Key? key,
    required this.option,
  }) : super(key: key);

  List<Widget> getWidgets(BuildContext context) {
    List<Widget> widgets = [SiderSubMenuLeadTile(option: option)];
    ThemeProvider theme = context.watch<ThemeProvider>();
    for (MenuOption op in option.children!) {
      widgets.add(
        DrawerMenuTile(
          icon: op.icon,
          title: op.title,
          path: op.page,
          backgroundColor: theme.colors.primaryColor,
          left: false,
          activeColor: theme.colors.selectionColor,
          color: LegendColorTheme.lighten(theme.colors.secondaryColor, 0.04),
          collapsed: false,
          textSize: theme.typography.h1.fontSize,
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Column(
        children: getWidgets(context),
      ),
    );
  }
}

class SiderSubMenuLeadTile extends StatelessWidget {
  final MenuOption option;
  const SiderSubMenuLeadTile({
    Key? key,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return DrawerMenuTile(
      icon: option.icon,
      title: option.title,
      path: option.page,
      backgroundColor: theme.colors.primaryColor,
      left: false,
      activeColor: theme.colors.selectionColor,
      color: theme.colors.secondaryColor,
      collapsed: false,
    );
  }
}
