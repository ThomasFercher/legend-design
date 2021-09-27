import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedMenu.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';
import '../../../../objects/menuOption.dart';
import '../../../../router/routerProvider.dart';
import '../../../../styles/layouts/layoutType.dart';
import '../../../../styles/theming/sizing/sizeProvider.dart';
import '../../../../styles/theming/legendTheme.dart';
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
  final void Function(int i)? onActionPressed;

  final bool? showMenu;
  final WidgetBuilder? builder;
  final Widget? leading;
  final Radius? bottomBorderRadius;
  late FixedAppBarStyle? style;
  final BuildContext pcontext;
  final LayoutType? layoutType;
  FixedAppBar({
    this.showMenu,
    this.builder,
    this.leading,
    this.bottomBorderRadius,
    this.style,
    this.layoutType,
    required this.pcontext,
    this.onActionPressed,
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
      shape: style?.shape,
      leadingWidth: 0,
      leading: Container(
        width: 0,
      ),
      actions: [Container()],
      title: Container(
        height: theme.appBarStyle.appBarHeight +
            (style?.contentPadding.vertical ?? 0.0),
        padding: EdgeInsets.only(
          left: style?.contentPadding.left ?? 0,
          right: style?.contentPadding.right ?? 0,
          top: style?.contentPadding.top ?? 0,
          bottom: style?.contentPadding.bottom ?? 0,
        ),
        child: Hero(
          tag: ValueKey("appBar"),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  left: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (layoutType != LayoutType.FixedSider &&
                          layoutType != LayoutType.FixedHeaderSider)
                        Container(
                          height: (style?.appBarHeight ?? 80),
                          width: style?.appBarHeight ?? 80,
                          margin: EdgeInsets.only(right: 16.0),
                          child: SvgPicture.asset(
                            "assets/photos/larrylegend.svg",
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      if (layoutType != LayoutType.FixedSider &&
                          layoutType != LayoutType.FixedHeaderSider)
                        LegendText(
                          text: "Legend Design",
                          textStyle: LegendTextStyle.h1().copyWith(
                            color: theme.colors.secondaryColor,
                            letterSpacing: 0.1,
                          ),
                        ),
                    ],
                  ),
                ),
                if (showMenu ?? true)
                  Container(
                    margin: layoutType == LayoutType.FixedSider ||
                            layoutType == LayoutType.FixedHeaderSider
                        ? EdgeInsets.only(
                            right: 80 + (style?.contentPadding.horizontal ?? 0),
                          )
                        : EdgeInsets.zero,
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
                if (builder != null)
                  Positioned(
                    right: SizeProvider.of(context).isMenuCollapsed() &&
                            !theme.isMobile
                        ? 64
                        : 0,
                    child: Row(
                      children: [
                        Container(
                          height: theme.appBarStyle.appBarHeight,
                          alignment: Alignment.center,
                          decoration: getCard(),
                          child: Builder(
                            builder: builder ?? (c) => Container(),
                          ),
                        ),
                        LegendButton(
                          text: LegendText(
                            text: "Settings",
                          ),
                          onPressed: () {
                            if (onActionPressed != null) onActionPressed!(0);
                          },
                        ),
                      ],
                    ),
                  ),
              ],
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
