import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixed_menu.dart';
import 'package:legend_design_core/layout/layout_provider.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';

import 'package:provider/provider.dart';

class FixedAppBarColors {
  final Color backgroundColor;

  final Color? cardColor;
  final Color iconColor;
  final Color selectedColor;
  final Color foreground;

  FixedAppBarColors({
    required this.backgroundColor,
    this.cardColor,
    required this.iconColor,
    required this.selectedColor,
    required this.foreground,
  });
}

class FixedAppBarSizing {
  final Radius? borderRadius;
  final EdgeInsets contentPadding;
  final ShapeBorder? shape;
  final double? titleSize;
  late final bool pinned;
  late final bool floating;
  final double? spacing;
  final double appBarHeight;
  final double? iconSize;

  FixedAppBarSizing({
    required this.appBarHeight,
    this.borderRadius,
    required this.contentPadding,
    this.shape,
    bool? pinned,
    bool? floating,
    this.iconSize,
    this.spacing,
    this.titleSize,
  }) {
    this.floating = floating ?? false;

    if (this.floating) {
      this.pinned = false;
    } else {
      this.pinned = pinned ?? true;
    }
  }
}

class FixedAppBar extends StatelessWidget {
  final void Function(int i)? onActionPressed;
  final bool showSubMenu;
  final bool? showMenu;
  final WidgetBuilder? builder;
  final Widget? leading;
  final Radius? bottomBorderRadius;
  FixedAppBarSizing? sizing;
  FixedAppBarColors? colors;
  final BuildContext pcontext;
  final LayoutType? layoutType;
  FixedAppBar({
    this.showMenu,
    this.builder,
    this.leading,
    this.bottomBorderRadius,
    this.sizing,
    this.layoutType,
    required this.pcontext,
    this.onActionPressed,
    this.showSubMenu = true,
  });

  BoxDecoration? getCard() {
    return colors?.cardColor != null
        ? BoxDecoration(
            borderRadius: BorderRadius.all(sizing?.borderRadius ?? Radius.zero),
            color: colors?.cardColor,
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
    sizing ??= theme.appBarSizing;
    colors ??= theme.appBarColors;

    return SliverAppBar(
      backgroundColor: colors?.backgroundColor,
      shape: sizing?.shape,
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
        height: theme.appBarSizing.appBarHeight +
            (sizing?.contentPadding.vertical ?? 0.0),
        padding: EdgeInsets.only(
          left: sizing?.contentPadding.left ?? 0,
          right: sizing?.contentPadding.right ?? 0,
          top: sizing?.contentPadding.top ?? 0,
          bottom: sizing?.contentPadding.bottom ?? 0,
        ),
        child: Hero(
          tag: ValueKey('appBar'),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if ((layoutType != LayoutType.FixedSider &&
                              layoutType != LayoutType.FixedHeaderSider) ||
                          SizeProvider.of(context).isMobile)
                        Container(
                          height:
                              sizing?.titleSize ?? sizing?.appBarHeight ?? 64,
                          width:
                              sizing?.titleSize ?? sizing?.appBarHeight ?? 64,
                          margin: EdgeInsets.only(right: 12.0, left: 16.0),
                          child: Center(
                            child:
                                LayoutProvider.of(context)?.logo ?? Container(),
                          ),
                        ),
                      if ((layoutType != LayoutType.FixedSider &&
                              layoutType != LayoutType.FixedHeaderSider) ||
                          SizeProvider.of(context).isMobile)
                        Center(
                          child: LegendText(
                            text: 'Legend Design',
                            textStyle: theme.typography.h6.copyWith(
                              color: theme.appBarColors.foreground,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: SizeProvider.of(context)
                              .isMenuCollapsed(theme.menuWidth, theme) &&
                          !SizeProvider.of(context).isMobile
                      ? 96
                      : 16,
                  height: sizing?.appBarHeight,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (builder != null)
                          Container(
                            height: theme.appBarSizing.appBarHeight,
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
                            disabled: theme.appBarColors.foreground,
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
                      right: (sizing?.contentPadding.horizontal ?? 0),
                    ),
                    decoration: getCard(),
                    padding: EdgeInsets.symmetric(
                      horizontal: sizing?.borderRadius?.x ?? 0,
                    ),
                    child: FixedMenu(
                      context: context,
                      iconColor: theme.appBarColors.iconColor,
                      selected: theme.appBarColors.selectedColor,
                      backgroundColor: theme.appBarColors.backgroundColor,
                      foreground: theme.appBarColors.foreground,
                      showSubMenu: showSubMenu,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      titleSpacing: 0,
      toolbarHeight: theme.appBarSizing.appBarHeight +
          (sizing?.contentPadding.vertical ?? 0.0),
      expandedHeight: theme.appBarSizing.appBarHeight +
          (sizing?.contentPadding.vertical ?? 0.0),
      collapsedHeight: theme.appBarSizing.appBarHeight +
          (sizing?.contentPadding.vertical ?? 0.0),
      pinned: sizing?.pinned ?? false,
      snap: sizing?.floating ?? false,
      floating: sizing?.floating ?? false,
      elevation: 12.0,
      automaticallyImplyLeading: false,
    );
  }
}
