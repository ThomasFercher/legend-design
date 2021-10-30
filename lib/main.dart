import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legend_design_core/legend_design_app.dart';
import 'package:legend_design_core/styles/theming/colors/legendColorTheme.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:webstore/styles/layoutInfo.dart';
import 'styles/appStyles.dart';

void main() {
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
        themeType: LegendColorThemeType.DARK,
      ),
      globalFooter: LayoutInfo.footer,
    ),
  );
}
