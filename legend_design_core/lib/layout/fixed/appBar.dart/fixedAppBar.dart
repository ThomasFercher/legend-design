import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/icons/legendAnimatedIcon.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixedMenu.dart';
import 'package:legend_design_core/layout/layoutProvider.dart';
import 'package:legend_design_core/styles/layouts/layoutType.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/sizing/sizeProvider.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:legend_design_core/typography/legendText.dart';
import 'package:legend_design_core/typography/typography.dart';

import 'package:provider/provider.dart';

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
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    if (style == null) style = theme.appBarStyle;

    return SliverAppBar(
      backgroundColor: style?.backgroundColor,
      shape: style?.shape,
      leadingWidth: 0,
      leading: Container(
        width: 0,
      ),
      actions: [
        Container(
          width: 0,
        )
      ],
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (layoutType != LayoutType.FixedSider &&
                          layoutType != LayoutType.FixedHeaderSider)
                        Container(
                          height: (style?.appBarHeight ?? 80),
                          width: style?.appBarHeight ?? 80,
                          margin: EdgeInsets.only(right: 8.0),
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                          child: Center(
                            child:
                                LayoutProvider.of(context)?.logo ?? Container(),
                          ),
                        ),
                      if (layoutType != LayoutType.FixedSider &&
                          layoutType != LayoutType.FixedHeaderSider)
                        LegendText(
                          text: "Legend Design",
                          textStyle: LegendTextStyle.h1().copyWith(
                            color: theme.colors.secondaryColor,
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: SizeProvider.of(context).isMenuCollapsed() &&
                          !theme.isMobile
                      ? 84
                      : 16,
                  height: style?.appBarHeight,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (builder != null)
                          Container(
                            height: theme.appBarStyle.appBarHeight,
                            alignment: Alignment.center,
                            decoration: getCard(),
                            child: Builder(
                              builder: builder ?? (c) => Container(),
                            ),
                          ),
                        LegendAnimatedIcon(
                          icon: Icons.settings,
                          theme: LegendAnimtedIconTheme(
                            enabled: theme.colors.selectionColor,
                            disabled: theme.colors.foreground[3],
                          ),
                          onPressed: () {
                            if (onActionPressed != null) onActionPressed!(0);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (showMenu ?? true)
                  Container(
                    margin: EdgeInsets.only(
                      right: (style?.contentPadding.horizontal ?? 0),
                    ),
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
