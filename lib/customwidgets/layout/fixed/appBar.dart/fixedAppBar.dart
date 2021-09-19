import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedMenu.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import '../../../../objects/menuOption.dart';
import '../../../../router/routerProvider.dart';
import '../../../../styles/layoutType.dart';
import '../../../../styles/sizeProvider.dart';
import '../../../../styles/legendTheme.dart';
import '../fixedSider.dart';

class FixedAppBarStyle {
  final Color backgroundColor;
  final Radius? borderRadius;
  final EdgeInsets contentPadding;
  final ShapeBorder? shape;
  final Color? cardColor;
  late final bool pinned;
  late final bool floating;
  final double? spacing;
  final double appBarHeight;
  final double? iconSize;
  final Color? iconColor;
  final Color? selectedColor;

  FixedAppBarStyle({
    required this.backgroundColor,
    required this.appBarHeight,
    this.borderRadius,
    required this.contentPadding,
    this.cardColor,
    this.shape,
    bool? pinned,
    bool? floating,
    this.iconSize,
    this.spacing,
    this.iconColor,
    this.selectedColor,
  }) {
    this.floating = floating ?? false;

    if (this.floating)
      this.pinned = false;
    else
      this.pinned = pinned ?? true;
  }
}

class FixedAppBar extends StatelessWidget {
  final bool? showMenu;
  final WidgetBuilder? builder;
  final Widget? leading;
  final Radius? bottomBorderRadius;
  late FixedAppBarStyle? style;

  FixedAppBar({
    this.showMenu,
    this.builder,
    this.leading,
    this.bottomBorderRadius,
    this.style,
  });

  BoxDecoration? getCard() {
    return style?.cardColor != null
        ? BoxDecoration(
            borderRadius: BorderRadius.all(style?.borderRadius ?? Radius.zero),
            color: style?.cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1.6,
                blurRadius: 1.6,
              )
            ],
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    if (style == null) style = theme.appBarStyle;

    return SliverAppBar(
      backgroundColor: style?.backgroundColor,
      /*flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black54,
              Colors.black12,
              Colors.transparent,
            ],
            stops: [
              -0.3,
              0.1,
              0.4,
            ],
          ),
        ),
      ),*/

      shape: style?.shape,
      title: Container(
        padding: EdgeInsets.symmetric(
          vertical: style?.contentPadding.top ?? 0,
          horizontal: 12.0,
        ),
        child: Container(
          height: theme.appBarStyle.appBarHeight,
          child: Hero(
            tag: ValueKey("appBar"),
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  if (showMenu ?? true)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            decoration: getCard(),
                            padding: EdgeInsets.symmetric(
                              horizontal: style?.borderRadius?.x ?? 0,
                            ),
                            child: FixedMenu(
                              context: context,
                              iconColor: theme.appBarStyle.iconColor,
                              selected: theme.appBarStyle.selectedColor,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  if (builder != null)
                    Container(
                      decoration: getCard(),
                      child: Builder(
                        builder: builder ?? (c) => Container(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      titleSpacing: 0,
      toolbarHeight: theme.appBarStyle.appBarHeight +
          ((style?.contentPadding.top ?? 0.0) * 2),
      pinned: style?.pinned ?? false,
      snap: style?.floating ?? false,
      floating: style?.floating ?? false,
      elevation: 12.0,
      automaticallyImplyLeading: false,
    );
  }
}
