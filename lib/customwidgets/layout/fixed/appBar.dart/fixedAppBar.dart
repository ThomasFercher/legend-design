import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedMenu.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import '../../../../objects/menuOption.dart';
import '../../../../router/routerProvider.dart';
import '../../../../styles/layoutType.dart';
import '../../../../styles/sizeProvider.dart';
import '../../../../styles/legendTheme.dart';

class FixedAppBarStyle {
  final Color backgroundColor;
  final Radius? borderRadius;
  final EdgeInsets contentPadding;
  final ShapeBorder? shape;
  final Color? cardColor;
  late final bool pinned;
  late final bool floating;
  final double appBarHeight;

  FixedAppBarStyle({
    required this.backgroundColor,
    required this.appBarHeight,
    this.borderRadius,
    required this.contentPadding,
    this.cardColor,
    this.shape,
    bool? pinned,
    bool? floating,
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
      /*  flexibleSpace: Container(
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
      title: Padding(
        padding: EdgeInsets.symmetric(
          vertical: style?.contentPadding.top ?? 0,
          horizontal: 12.0,
        ),
        child: Container(
          height: theme.appBarStyle.appBarHeight,
          child: Hero(
            tag: ValueKey("appBarTitle"),
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: style?.borderRadius?.x ?? 0,
                          ),
                          height: theme.appBarStyle.appBarHeight,
                          alignment: Alignment.center,
                          decoration: getCard(),
                          child: leading ??
                              LegendText(
                                text: "Legend Design",
                                textStyle: LegendTextStyle.h1().copyWith(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  if (showMenu ?? true)
                    Expanded(
                      flex: 4,
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
                            child: FixedMenu(context: context),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        if (builder != null)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: style?.borderRadius?.x ?? 0,
                            ),
                            decoration: getCard(),
                            child: Builder(
                              builder: builder ?? (c) => Container(),
                            ),
                          ),
                      ],
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
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }
}
