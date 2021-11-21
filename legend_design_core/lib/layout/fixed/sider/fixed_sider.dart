import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/drawers/sidermenu_vertical_tile.dart';
import 'package:legend_design_core/layout/fixed/sider/fixed_sider_menu.dart';

import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/router/routes/section_provider.dart';
import 'package:legend_design_core/router/routes/section_route_info.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:provider/provider.dart';

class FixedSider extends StatelessWidget {
  late final bool showMenu;
  late final bool showSectionMenu;
  late final bool showSubMenu;

  WidgetBuilder? builder;

  FixedSider({
    bool? showMenu,
    bool? showSectionMenu,
    bool? showSubMenu,
    this.builder,
  }) {
    this.showMenu = showMenu ?? true;
    this.showSubMenu = showSubMenu ?? true;
    this.showSectionMenu = showSectionMenu ?? false;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = SizeProvider.of(context).screenSize;
    bool showSider =
        screenSize == ScreenSize.Large || screenSize == ScreenSize.XXL;

    return Hero(
      tag: ValueKey('sider'),
      child: Material(
        elevation: 20,
        child: showSider
            ? Sider(
                showMenu: showMenu,
                builder: builder,
                context: context,
                showSectionMenu: showSectionMenu,
                showSubMenu: showSubMenu,
              )
            : CollapsedSider(
                context: context,
                showMenu: showMenu,
                showSectionMenu: showSectionMenu,
                showSubMenu: showSubMenu,
              ),
      ),
    );
  }
}

class CollapsedSider extends StatelessWidget {
  final bool showMenu;
  final bool showSectionMenu;
  final bool showSubMenu;

  const CollapsedSider({
    Key? key,
    required this.context,
    required this.showMenu,
    required this.showSectionMenu,
    required this.showSubMenu,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    List<MenuOption> options = RouterProvider.of(context).menuOptions;
    List<SiderMenuVerticalTile> tiles = List.of(
      options.map(
        (option) => SiderMenuVerticalTile(
          icon: option.icon,
          path: option.page,
          collapsed: true,
          activeColor: Colors.tealAccent,
          backgroundColor: theme.colors.primaryColor,
          color: theme.colors.textColorLight,
        ),
      ),
    );

    List<SectionRouteInfo> sections =
        SectionProvider.of(context)?.sections ?? [];
    List<SiderMenuVerticalTile> sectionTiles = List.of(
      sections.map(
        (option) => SiderMenuVerticalTile(
          title: LegendUtils.capitalite(option.name.replaceAll('/', '')),
          path: option.name,
          isSection: true,
          collapsed: true,
          activeColor: theme.colors.selectionColor,
          backgroundColor: theme.colors.primaryColor,
          color: theme.colors.textColorLight,
        ),
      ),
    );

    return Container(
      width: 80,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
          top: theme.appBarSizing.appBarHeight +
              theme.appBarSizing.contentPadding.vertical),
      color: theme.appBarColors.backgroundColor,
      child: Column(
        children: [
          Divider(
            color: theme.colors.secondaryColor.withOpacity(0.2),
            height: 1.0,
            thickness: 1.0,
          ),
          if (showMenu)
            Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: ListView(
                shrinkWrap: true,
                children: tiles,
                padding: EdgeInsets.only(
                  top: 32,
                ),
              ),
            ),
          if (showSectionMenu)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView(
                children: sectionTiles,
                shrinkWrap: true,
              ),
            )
        ],
      ),
    );
  }
}

class Sider extends StatelessWidget {
  const Sider({
    Key? key,
    required this.showMenu,
    required this.builder,
    required this.context,
    required this.showSectionMenu,
    required this.showSubMenu,
  }) : super(key: key);

  final bool? showMenu;
  final bool? showSectionMenu;
  final WidgetBuilder? builder;
  final BuildContext context;
  final bool showSubMenu;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    List<SectionRouteInfo> sections =
        SectionProvider.of(context)?.sections ?? [];

    List<SiderMenuVerticalTile> sectionTiles = List.of(
      sections.map(
        (option) => SiderMenuVerticalTile(
          title: LegendUtils.capitalite(option.name.replaceAll('/', '')),
          path: option.name,
          isSection: true,
          collapsed: false,
          activeColor: theme.appBarColors.selectedColor,
          backgroundColor: theme.appBarColors.backgroundColor,
          color: theme.appBarColors.foreground,
        ),
      ),
    );
    MenuOption? current = RouterProvider.of(context).current;
    List<MenuOption> subMenu = current?.children ?? [];

    List<DrawerMenuTile> subMenuTiles = List.of(
      subMenu.map(
        (option) => DrawerMenuTile(
          icon: option.icon,
          path: option.page,
          title: option.title,
          collapsed: false,
          activeColor: theme.appBarColors.selectedColor,
          backgroundColor: theme.colors.primaryColor,
          color: theme.appBarColors.foreground,
          left: false,
        ),
      ),
    );
    List<Widget> children = [
      Divider(
        color: theme.colors.secondaryColor.withOpacity(0.2),
        height: 1.0,
        thickness: 1.0,
      ),
      if (showMenu ?? false) FixedSiderMenu(),
      if (showSubMenu && subMenuTiles.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: LegendText(
                  text: current?.title ?? "",
                  textStyle: theme.typography.h4.copyWith(
                    color: theme.colors.selectionColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                child: Divider(
                  color: theme.colors.selectionColor,
                  height: 1,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView(
                  children: subMenuTiles,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      if (showSectionMenu ?? false)
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: LegendText(
                  text: "Sections",
                  textStyle: theme.typography.h4.copyWith(
                    color: theme.colors.selectionColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                child: Divider(
                  color: theme.colors.selectionColor,
                  height: 1,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ListView(
                  children: sectionTiles,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      if (builder != null)
        Builder(
          builder: (context) => builder!(context),
        )
    ];

    for (var i = 1; i < children.length; i += 2) {
      children.insert(i, Padding(padding: EdgeInsets.only(top: 16)));
    }

    ScrollController controller = ScrollController();

    return Container(
      width: 180,
      height: MediaQuery.of(context).size.height,
      color: theme.appBarColors.backgroundColor,
      padding: EdgeInsets.only(
          top: theme.appBarSizing.appBarHeight +
              theme.appBarSizing.contentPadding.vertical),
      child: Scrollbar(
        controller: controller,
        child: ListView(
          controller: controller,
          children: children,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
