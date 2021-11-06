import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/drawers/sidermenu_vertical_tile.dart';
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
  WidgetBuilder? builder;

  FixedSider({
    bool? showMenu,
    bool? showSectionMenu,
    this.builder,
  }) {
    this.showMenu = showMenu ?? true;
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
              )
            : CollapsedSider(
                context: context,
                showMenu: showMenu,
                showSectionMenu: showSectionMenu,
              ),
      ),
    );
  }
}

class CollapsedSider extends StatelessWidget {
  final bool showMenu;
  final bool showSectionMenu;

  const CollapsedSider({
    Key? key,
    required this.context,
    required this.showMenu,
    required this.showSectionMenu,
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
          activeColor: Colors.tealAccent,
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
  }) : super(key: key);

  final bool? showMenu;
  final bool? showSectionMenu;
  final WidgetBuilder? builder;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    List<MenuOption> options = RouterProvider.of(context).menuOptions;
    List<DrawerMenuTile> tiles = List.of(
      options.map(
        (option) => DrawerMenuTile(
          icon: option.icon,
          title: option.title,
          path: option.page,
          backgroundColor: theme.colors.primaryColor,
          left: false,
          activeColor: theme.colors.selectionColor,
          color: theme.colors.secondaryColor,
          collapsed: false,
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
          collapsed: false,
          activeColor: theme.appBarColors.selectedColor,
          backgroundColor: theme.appBarColors.backgroundColor,
          color: theme.appBarColors.foreground,
        ),
      ),
    );

    List<Widget> children = [
      Divider(
        color: theme.colors.secondaryColor.withOpacity(0.2),
        height: 1.0,
        thickness: 1.0,
      ),
      if (showMenu ?? false)
        ListView(
          shrinkWrap: true,
          children: tiles,
          padding: EdgeInsets.only(
            top: 32,
          ),
        ),
      if (showSectionMenu ?? false)
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LegendText(
                padding: EdgeInsets.only(left: 32.0),
                text: 'Widgets',
                textStyle: theme.sizing.typography.h4.copyWith(
                  color: theme.appBarColors.selectedColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                child: Divider(
                  color: theme.appBarColors.selectedColor,
                  height: 1,
                  thickness: 1,
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: sectionTiles,
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
