import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedMenu.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/styles/legendColorTheme.dart';
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
  final BuildContext pcontext;
  FixedAppBar({
    this.showMenu,
    this.builder,
    this.leading,
    this.bottomBorderRadius,
    this.style,
    required this.pcontext,
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
      actions: [Container()],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colors.primaryColor,
              LegendColorTheme.lighten(
                theme.colors.primaryColor,
                0.04,
              ),
            ],
          ),
        ),
      ),
      title: Container(
        height: theme.appBarStyle.appBarHeight +
            (style?.contentPadding.vertical ?? 0.0),
        padding: EdgeInsets.symmetric(
          vertical: style?.contentPadding.top ?? 0,
          horizontal: 12.0,
        ),
        child: Container(
          //     height: theme.appBarStyle.appBarHeight,
          child: Hero(
            tag: ValueKey("appBar"),
            child: Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Container(
                    child: Row(
                      children: [
                        if (showMenu ?? true)
                          Expanded(
                            child: Container(
                              //    margin: EdgeInsets.only(right: theme.),
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
                          ),
                      ],
                    ),
                  ),
                  if (builder != null)
                    Positioned(
                      right:
                          SizeProvider.of(context).isMenuCollapsed() ? 64 : 0,
                      child: Container(
                        height: theme.appBarStyle.appBarHeight,
                        alignment: Alignment.center,
                        decoration: getCard(),
                        child: Builder(
                          builder: builder ?? (c) => Container(),
                        ),
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
          (style?.contentPadding.vertical ?? 0.0),
      expandedHeight: theme.appBarStyle.appBarHeight +
          (style?.contentPadding.vertical ?? 0.0),
      collapsedHeight: theme.appBarStyle.appBarHeight +
          (style?.contentPadding.vertical ?? 0.0),
      pinned: style?.pinned ?? false,
      snap: style?.floating ?? false,
      floating: style?.floating ?? false,
      elevation: 12.0,
      automaticallyImplyLeading: false,
    );
  }
}
