import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/bottomBarItem.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/bottomBarProvider.dart';
import 'package:legend_design_core/objects/menuOption.dart';
import 'package:legend_design_core/router/routerProvider.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';

import 'package:provider/provider.dart';

class BottomBarColors {
  final Color? activeColor;
  final Color? disabledColor;
  final Color? backgroundColor;

  BottomBarColors({
    this.activeColor,
    this.disabledColor,
    this.backgroundColor,
  });
}

class BottomBarSizing {
  final EdgeInsets margin;
  final BoxDecoration decoration;
  final double height;
  final bool showText;
  final bool? textAtBottom;

  final double? iconSize;

  BottomBarSizing({
    required this.showText,
    required this.margin,
    required this.decoration,
    required this.height,
    this.textAtBottom,
    this.iconSize,
  });
}

class FixedBottomBar extends StatelessWidget {
  final bool? fit;
  late BottomBarSizing? sizing;
  late BottomBarColors colors;

  FixedBottomBar({
    Key? key,
    this.fit,
    required this.sizing,
    required this.colors,
  }) : super(key: key);

  late int index;
  late List<BottomBarItem> items;

  List<BottomBarItem> getOptions(BuildContext c) {
    List<MenuOption> options = RouterProvider.of(c).menuOptions;
    List<BottomBarItem> it = [];

    for (MenuOption o in options) {
      BottomBarItem w = new BottomBarItem(
        option: o,
        onSelected: (selOption) {
          Provider.of<BottomBarProvider>(c, listen: false).selectOption(o);
        },
        sizing: sizing,
        colors: colors,
      );
      it.add(w);
    }

    return it;
  }

  List<BottomBarItem> getItems(context) {
    List<MenuOption> options = RouterProvider.of(context).menuOptions;
    List<BottomBarItem> it = [];
    for (var i = 0; i < options.length; i++) {
      MenuOption option = options[i];
      BottomBarItem item = BottomBarItem(
        option: option,
        sizing: sizing,
        onSelected: (o) {
          Provider.of<BottomBarProvider>(context, listen: false)
              .selectOption(option);
        },
        colors: colors,
      );
      it.add(item);
    }
    print(it);
    return it;
  }

  @override
  Widget build(BuildContext context) {
    List<MenuOption> options = RouterProvider.of(context).menuOptions;
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    if (sizing == null) sizing = theme.bottomBarStyle;

    return Material(
      color: colors.backgroundColor,
      child: Hero(
        tag: ValueKey("BottomBar"),
        child: Container(
          color: colors.backgroundColor,
          padding: sizing?.margin,
          child: Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: getItems(context),
              ),
            ),
          ),
          height: sizing?.height,
        ),
      ),
    );
  }
}
