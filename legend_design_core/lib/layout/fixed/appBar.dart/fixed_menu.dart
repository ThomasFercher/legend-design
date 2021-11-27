import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:provider/provider.dart';

class FixedMenu extends StatefulWidget {
  final void Function(MenuOptionHeader option)? onSelected;
  final bool? showIconsOnly;
  final Color? iconColor;
  final Color? selected;
  final Color? backgroundColor;
  final Color? foreground;
  final bool showSubMenu;

  const FixedMenu({
    Key? key,
    required this.context,
    required this.showSubMenu,
    this.onSelected,
    this.showIconsOnly,
    this.iconColor,
    this.selected,
    this.backgroundColor,
    this.foreground,
  }) : super(key: key);

  final BuildContext context;

  @override
  _FixedMenuState createState() => _FixedMenuState();
}

class _FixedMenuState extends State<FixedMenu> {
  Widget getCollapsedMenu(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();

    return Container(
      alignment: Alignment.centerRight,
      child: LegendAnimatedIcon(
        padding: EdgeInsets.all(0),
        iconSize: theme.appBarSizing.iconSize ?? 32,
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
        icon: Icons.menu,
        theme: LegendAnimtedIconTheme(
          disabled: theme.colors.appBarColors.foreground,
          enabled: theme.colors.selectionColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    MenuOption? sel = RouterProvider.of(context).current;
    List<MenuOptionHeader> options = RouterProvider.of(context)
        .menuOptions
        .map(
          (option) => MenuOptionHeader(
            option: option,
            activeColor: widget.selected,
            color: widget.foreground,
            backgroundColor: widget.backgroundColor,
            showSubMenu: widget.showSubMenu,
            forceColor: option == sel,
          ),
        )
        .toList();

    return Container(
      //  margin: const EdgeInsets.only(left: 16.0),
      height: theme.appBarSizing.appBarHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (!SizeProvider.of(widget.context)
              .isMenuCollapsed(theme.menuWidth, theme)) {
            return Center(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return options[index];
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: 12,
                  );
                },
                itemCount: options.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            );
          } else {
            return getCollapsedMenu(context);
          }
        },
      ),
    );
  }
}
