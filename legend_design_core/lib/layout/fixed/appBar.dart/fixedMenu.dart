import 'package:flutter/material.dart';
import 'package:legend_design_core/objects/menuOption.dart';
import 'package:legend_design_core/router/routerProvider.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/sizing/sizeProvider.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:provider/provider.dart';

class FixedMenu extends StatefulWidget {
  final void Function(MenuOptionHeader option)? onSelected;
  final bool? showIconsOnly;
  final Color? iconColor;
  final Color? selected;

  const FixedMenu({
    Key? key,
    required this.context,
    this.onSelected,
    this.showIconsOnly,
    this.iconColor,
    this.selected,
  }) : super(key: key);

  final BuildContext context;

  @override
  _FixedMenuState createState() => _FixedMenuState();
}

class _FixedMenuState extends State<FixedMenu> {
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
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    List<MenuOptionHeader> options = RouterProvider.of(context)
        .menuOptions
        .map(
          (option) => MenuOptionHeader(
            option: option,
            activeColor: widget.selected,
            color: theme.colors.textColorLight,
            backgroundColor: theme.colors.primaryColor,
          ),
        )
        .toList();

    return Container(
      //  margin: const EdgeInsets.only(left: 16.0),
      height: theme.appBarSizing.appBarHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (!SizeProvider.of(widget.context).isMenuCollapsed())
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
          else
            return getCollapsedMenu(context);
        },
      ),
    );
  }
}
