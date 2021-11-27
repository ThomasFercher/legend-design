import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/fixed/sider/fixed_sider_menu.dart';
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
          left: false,
          backgroundColor: theme.colors.cardBackgroundColor,
          activeColor: theme.colors.selectionColor,
          color: theme.colors.primaryColor,
          collapsed: true,
        ),
      ),
    );

    SizeProvider ss = SizeProvider.of(context);

    double width;

    if (ss.screenSize == ScreenSize.Small) {
      width = ss.width * 3 / 4;
    } else {
      width = 320;
    }

    return Container(
      width: width,
      child: Drawer(
        elevation: 4,
        child: Container(
          color: theme.colors.cardBackgroundColor,
          padding: const EdgeInsets.symmetric(
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: LegendText(
                        padding: EdgeInsets.only(
                          right: 8,
                        ),
                        text: 'Legend Design',
                        textStyle: theme.typography.h5.copyWith(
                          color: theme.colors.textColorDark,
                        ),
                      ),
                    ),
                    LegendAnimatedIcon(
                      icon: Icons.close,
                      disableShadow: true,
                      theme: LegendAnimtedIconTheme(
                        enabled: theme.colors.selectionColor,
                        disabled: theme.colors.foreground[1],
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  left: 24,
                  right: 24,
                ),
                child: Divider(
                  height: 1,
                  thickness: 0.5,
                  color: theme.colors.foreground[0],
                ),
              ),
              FixedSiderMenu(
                backgroundColor: theme.colors.cardBackgroundColor,
                foregroundColor: theme.colors.primaryColor,
                options: RouterProvider.of(context).menuOptions,
              )
            ],
          ),
        ),
      ),
    );
  }
}
