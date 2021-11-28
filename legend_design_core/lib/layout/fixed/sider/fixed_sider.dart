import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/drawers/legend_drawer_provider.dart';
import 'package:legend_design_core/layout/drawers/sidermenu_vertical_tile.dart';
import 'package:legend_design_core/layout/fixed/sider/fixed_sider_menu.dart';
import 'package:legend_design_core/layout/layout_provider.dart';

import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/router/routes/section_provider.dart';
import 'package:legend_design_core/router/routes/section_route_info.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:provider/provider.dart';

import 'collapsed/collapsedSider.dart';

class FixedSider extends StatelessWidget {
  late final bool showMenu;
  late final bool showSectionMenu;
  late final bool showSubMenu;
  late final LayoutType layoutType;

  WidgetBuilder? builder;

  FixedSider({
    bool? showMenu,
    bool? showSectionMenu,
    bool? showSubMenu,
    this.builder,
    LayoutType? layoutType,
  }) {
    this.showMenu = showMenu ?? true;
    this.showSubMenu = showSubMenu ?? true;
    this.showSectionMenu = showSectionMenu ?? false;
    this.layoutType = layoutType ?? LayoutType.FixedHeader;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = SizeProvider.of(context).screenSize;
    bool showSider =
        screenSize == ScreenSize.Large || screenSize == ScreenSize.XXL;

    return Hero(
      tag: ValueKey('sider'),
      child: Material(
        elevation: 0,
        child: showSider
            ? Sider(
                showMenu: showMenu,
                builder: builder,
                context: context,
                showSectionMenu: showSectionMenu,
                showSubMenu: showSubMenu,
                layoutType: layoutType,
              )
            : CollapsedSider(
                context: context,
                showMenu: showMenu,
                showSectionMenu: showSectionMenu,
                showSubMenu: showSubMenu,
                layoutType: layoutType,
              ),
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
    required this.layoutType,
  }) : super(key: key);

  final bool? showMenu;
  final bool? showSectionMenu;
  final WidgetBuilder? builder;
  final BuildContext context;
  final bool showSubMenu;
  final LayoutType layoutType;

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
      if (showMenu ?? false)
        FixedSiderMenu(
          backgroundColorSub: LegendColorTheme.darken(
            theme.colors.siderColorTheme.background,
            0.05,
          ),
          foregroundColor: LegendColorTheme.darken(
            theme.colors.siderColorTheme.foreground,
            0.05,
          ),
        ),
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
      if ((showSectionMenu ?? false) && sectionTiles.isNotEmpty)
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
        ),
    ];

    ScrollController controller = ScrollController();

    return Container(
      width: layoutType == LayoutType.FixedSider ? 220 : 180,
      height: MediaQuery.of(context).size.height,
      color: theme.colors.siderColorTheme.background,
      padding: layoutType == LayoutType.FixedHeaderSider
          ? EdgeInsets.only(top: theme.sizing.appBarSizing.appBarHeight)
          : EdgeInsets.all(0),
      child: Column(
        children: [
          if (layoutType == LayoutType.FixedSider)
            Container(
              color: theme.colors.siderColorTheme.background,
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LegendText(
                    text: 'Legend Design',
                    textStyle: theme.typography.h6.copyWith(
                      color: theme.appBarColors.foreground,
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    margin: const EdgeInsets.only(top: 6.0),
                    child: Center(
                      child: LayoutProvider.of(context)?.logo ?? Container(),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Scrollbar(
              controller: controller,
              child: ListView(
                controller: controller,
                children: children,
              ),
            ),
          ),
          if (layoutType == LayoutType.FixedSider)
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LegendAnimatedIcon(
                    icon: Icons.settings,
                    iconSize: 28,
                    theme: LegendAnimtedIconTheme(
                      enabled: theme.colors.selectionColor,
                      disabled: theme.appBarColors.foreground,
                    ),
                    onPressed: () {
                      Provider.of<LegendDrawerProvider>(context, listen: false)
                          .showDrawer('/settings');
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
