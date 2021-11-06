import 'package:flutter/material.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
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
          backgroundColor: theme.colors.foreground[0],
          activeColor: Colors.tealAccent,
          color: Colors.teal,
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
          color: theme.colors.foreground[0],
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: LegendText(
                      padding: EdgeInsets.only(
                        right: 8,
                      ),
                      text: 'Legend Design',
                      textStyle: theme.sizing.typography.h2.copyWith(
                        color: theme.colors.foreground[3],
                      ),
                    ),
                  ),
                  /*   LegendAnimatedIcon(
                    icon: Icons.close,
                    theme: LegendAnimtedIconTheme(
                      enabled: theme.colors.foreground[2],
                      disabled: theme.colors.foreground[1],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),*/
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 32.0,
                  top: 8.0,
                ),
                child: Divider(
                  height: 1,
                  thickness: 0.5,
                  color: theme.colors.foreground[2],
                ),
              ),
              ListView(
                children: tiles,
                shrinkWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
