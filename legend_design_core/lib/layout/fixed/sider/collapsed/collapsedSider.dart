import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/drawers/sidermenu_vertical_tile.dart';
import 'package:legend_design_core/layout/fixed/sider/fixed_sider_menu.dart';
import 'package:legend_design_core/layout/layout_provider.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/router/routes/section_provider.dart';
import 'package:legend_design_core/router/routes/section_route_info.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:provider/provider.dart';

class CollapsedSider extends StatelessWidget {
  final bool showMenu;
  final bool showSectionMenu;
  final bool showSubMenu;
  final LayoutType layoutType;

  const CollapsedSider({
    Key? key,
    required this.context,
    required this.showMenu,
    required this.showSectionMenu,
    required this.showSubMenu,
    required this.layoutType,
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
          title: option.title,
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
      color: theme.appBarColors.backgroundColor,
      child: ListView(
        children: [
          if (layoutType == LayoutType.FixedSider)
            Container(
              color: theme.colors.siderColorTheme.background,
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Container(
                height: 48,
                width: 48,
                child: Center(
                  child: LayoutProvider.of(context)?.logo ?? Container(),
                ),
              ),
            ),
          Divider(
            color: theme.colors.secondaryColor.withOpacity(0.2),
            height: 1.0,
            thickness: 1.0,
          ),
          if (showMenu)
            FixedSiderMenu(
              isCollapsed: true,
              options: options,
              backgroundColorSub:
                  LegendColorTheme.darken(theme.colors.primaryColor, 0.05),
              foregroundColor: LegendColorTheme.darken(
                  theme.colors.siderColorTheme.foreground, 0.05),
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
