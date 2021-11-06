import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legend_design_core/legend_design_app.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:webstore/styles/layoutInfo.dart';
import 'styles/appStyles.dart';

void main() {
  /* TODO:

  give ThemeProvider a basic typrography (fontFamily, Weight, Sacing, etc, Color and Size (overiides))
  also create Typography Color System

  if Color not specifed give Colors over theme ColorTheme; 
 them same  TextStyle Sizing and the Sizing Themes
*/
  runApp(
    LegendApp(
      drawerRoutes: AppConfig.drawerRoutes,
      menuOptions: AppConfig.menuOptions,
      routes: AppConfig.routes,
      logo: SvgPicture.asset(
        "assets/photos/larrylegend.svg",
        alignment: Alignment.centerLeft,
        width: 54,
        height: 54,
      ),
      theme: ThemeProvider(
        darkTheme: AppConfig.darkColorTheme,
        lightTheme: AppConfig.lightColorTheme,
        sizingTheme: AppConfig.sizingTheme,
        themeType: LegendColorThemeType.LIGHT,
      ),
      globalFooter: LayoutInfo.footer,
    ),
  );
}
