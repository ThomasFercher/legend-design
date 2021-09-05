import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedMenu.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/bottomBarItem.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/bottomBarProvider.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/legendTheme.dart';

class BottomBarStyle {
  final EdgeInsets margin;
  final BoxDecoration decoration;
  final double height;
  final bool showText;
  final bool? textAtBottom;
  final Color? activeColor;
  final Color? disabledColor;
  final double? iconSize;

  BottomBarStyle({
    required this.showText,
    required this.margin,
    required this.decoration,
    required this.height,
    this.activeColor,
    this.disabledColor,
    this.textAtBottom,
    this.iconSize,
  });
}

class FixedBottomBar extends StatelessWidget {
  final bool? fit;
  late BottomBarStyle? style;

  FixedBottomBar({
    Key? key,
    this.fit,
    this.style,
  }) : super(key: key);

  late int index;
  late List<BottomBarItem> items;

  List<BottomBarItem> getOptions(BuildContext context) {
    List<MenuOption> options = RouterProvider.of(context).menuOptions;
    List<BottomBarItem> it = [];

    for (MenuOption o in options) {
      BottomBarItem w = new BottomBarItem(
        option: o,
        onSelected: (selOption) {
          Provider.of<BottomBarProvider>(context, listen: false)
              .selectOption(o);
        },
        style: style,
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
        style: style,
        onSelected: (o) {
          Provider.of<BottomBarProvider>(context, listen: false)
              .selectOption(option);
        },
      );
      it.add(item);
    }
    print(it);
    return it;
  }

  @override
  Widget build(BuildContext context) {
    List<MenuOption> options = RouterProvider.of(context).menuOptions;
    LegendTheme theme = Provider.of<LegendTheme>(context);
    if (style == null) style = theme.bottomBarStyle;

    return Material(
      color: Colors.transparent,
      child: Container(
        color: theme.colors.scaffoldBackgroundColor,
        padding: style?.margin,
        child: Container(
          decoration: style?.decoration,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: getItems(context),
            ),
          ),
        ),
        height: style?.height,
      ),
    );
  }
}
