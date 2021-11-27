import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
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
  final Color? foregroundColor;
  const SiderSubMenu({
    Key? key,
    required this.option,
    this.backgroundColor,
    this.foregroundColor,
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
            collapsed: false,
            textSize: theme.typography.h1.fontSize,
            rectangleIndicator: true,
            forceColor: widget.option == sel,
          ),
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
          Stack(
            children: [
              SiderSubMenuLeadTile(
                option: widget.option,
                backgroundColor: widget.backgroundColor,
                foregroundColor: widget.foregroundColor,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: LegendAnimatedIcon(
                  icon:
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  iconSize: 28,
                  theme: LegendAnimtedIconTheme(
                    disabled: theme.colors.siderColorTheme.foreground,
                    enabled: theme.colors.selectionColor,
                  ),
                  onPressed: () {
                    if (isExpanded) {
                      setState(() {
                        maxHeight = 0;
                      });
                      isExpanded = false;
                    } else {
                      setState(() {
                        maxHeight = 360;
                      });
                      isExpanded = true;
                    }
                  },
                ),
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            constraints: BoxConstraints(
              maxHeight: maxHeight,
            ),
            child: ListView(
              shrinkWrap: true,
              children: getWidgets(context),
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
  const SiderSubMenuLeadTile({
    Key? key,
    required this.option,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return DrawerMenuTile(
      icon: option.icon,
      title: option.title,
      path: option.page,
      backgroundColor:
          backgroundColor ?? theme.colors.siderColorTheme.backgroundMenu,
      left: false,
      activeColor: theme.colors.selectionColor,
      color: foregroundColor ?? theme.colors.siderColorTheme.foreground,
      collapsed: false,
    );
  }
}
