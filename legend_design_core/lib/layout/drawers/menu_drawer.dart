import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/colors/legend_colors.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';

import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
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
          left: true,
          backgroundColor: theme.colors.background[0],
          activeColor: theme.colors.selectionColor,
          color: theme.colors.primaryColor,
          collapsed: true,
        ),
      ),
    );

    SizeProvider ss = SizeProvider.of(context);

    double? width;

    if (ss.screenSize == ScreenSize.Small) {
      width = ss.width * 3 / 4;
    } else {
      width = null;
    }

    return Container(
      width: width,
      child: Drawer(
        elevation: 4,
        child: Container(
          color: theme.colors.background[0],
          padding: const EdgeInsets.only(
            left: 18,
            bottom: 32,
            right: 18,
            top: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LegendAnimatedIcon(
                    icon: Icons.close,
                    theme: LegendAnimtedIconTheme(
                      enabled: theme.colors.selectionColor,
                      disabled: LegendColors.gray7,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Container(
                    child: LegendText(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      text: 'Legend Design',
                      textStyle: theme.typography.h4.copyWith(
                        color: theme.colors.textColorDark,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 24.0,
                  top: 12.0,
                ),
                child: Divider(
                  height: 1,
                  thickness: 0.5,
                  color: theme.colors.foreground[1],
                ),
              ),
              ListView(
                children: tiles,
                shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
