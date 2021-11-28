import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/drawers/sidermenu_vertical_tile.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:provider/src/provider.dart';

class SiderSubMenu extends StatefulWidget {
  final MenuOption option;
  final Color? backgroundColor;
  final bool collapsed;
  final Color? foregroundColor;
  const SiderSubMenu({
    Key? key,
    required this.option,
    this.backgroundColor,
    this.foregroundColor,
    this.collapsed = false,
  }) : super(key: key);

  @override
  State<SiderSubMenu> createState() => _SiderSubMenuState();
}

class _SiderSubMenuState extends State<SiderSubMenu> {
  late double maxHeight;
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    maxHeight = 400;
  }

  List<Widget> getWidgets(BuildContext context) {
    List<Widget> widgets = [];
    ThemeProvider theme = context.watch<ThemeProvider>();
    MenuOption? sel = RouterProvider.of(context).current;
    for (MenuOption op in widget.option.children!) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: DrawerMenuTile(
            icon: op.icon,
            title: op.title,
            path: op.page,
            backgroundColor: widget.backgroundColor ??
                theme.colors.siderColorTheme.backgroundMenu,
            left: false,
            activeColor: theme.colors.selectionColor,
            color: LegendColorTheme.lighten(
              widget.foregroundColor ?? theme.colors.siderColorTheme.foreground,
              0.04,
            ),
            collapsed: widget.collapsed,
            textSize: theme.typography.h1.fontSize,
            rectangleIndicator: true,
            forceColor: widget.option == sel,
          ),
        ),
      );
    }

    return widgets;
  }

  List<Widget> getCollapsedWidgets(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    List<Widget> widgets = [];

    MenuOption? sel = RouterProvider.of(context).current;
    for (MenuOption op in widget.option.children!) {
      widgets.add(
        SiderMenuVerticalTile(
          icon: op.icon,
          path: op.page,
          title: op.title,
          collapsed: true,
          activeColor: Colors.tealAccent,
          backgroundColor: theme.colors.primaryColor,
          color: theme.colors.textColorLight,
          fontSize: theme.typography.h0.fontSize,
          iconSize: 24,
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return Container(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Column(
        children: [
          SiderSubMenuLeadTile(
            option: widget.option,
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            isCollapsed: widget.collapsed,
          ),
          Container(
            height: 36,
            color: widget.backgroundColor,
            padding: EdgeInsets.symmetric(vertical: 4),
            alignment: Alignment.center,
            child: LegendAnimatedIcon(
              icon: isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              iconSize: 28,
              disableShadow: true,
              theme: LegendAnimtedIconTheme(
                disabled: theme.colors.siderColorTheme.foreground,
                enabled: theme.colors.selectionColor,
              ),
              onPressed: () {
                if (isExpanded) {
                  isExpanded = false;
                  setState(() {
                    maxHeight = 0;
                  });
                } else {
                  isExpanded = true;
                  setState(() {
                    maxHeight = 360;
                  });
                }
              },
            ),
          ),
          AnimatedContainer(
            color: widget.backgroundColor,
            duration: Duration(milliseconds: 200),
            constraints: BoxConstraints(
              maxHeight: maxHeight,
            ),
            margin: EdgeInsets.only(
              bottom: isExpanded ? 12 : 8,
            ),
            child: ListView(
              shrinkWrap: true,
              children: widget.collapsed
                  ? getCollapsedWidgets(context)
                  : getWidgets(context),
            ),
          )
        ],
      ),
    );
  }
}

class SiderSubMenuLeadTile extends StatelessWidget {
  final MenuOption option;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isCollapsed;
  const SiderSubMenuLeadTile({
    Key? key,
    required this.option,
    this.backgroundColor,
    this.foregroundColor,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return !isCollapsed
        ? DrawerMenuTile(
            icon: option.icon,
            title: option.title,
            path: option.page,
            backgroundColor:
                backgroundColor ?? theme.colors.siderColorTheme.backgroundMenu,
            left: false,
            activeColor: theme.colors.selectionColor,
            color: foregroundColor ?? theme.colors.siderColorTheme.foreground,
            collapsed: false,
            bottomSpacing: 12,
          )
        : SiderMenuVerticalTile(
            icon: option.icon,
            path: option.page,
            title: option.title,
            collapsed: true,
            activeColor: Colors.tealAccent,
            backgroundColor: theme.colors.primaryColor,
            color: theme.colors.textColorLight,
            bottomMargin: 12,
          );
  }
}
