import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legend_design_core/legend_design_app.dart';
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
        darkTheme: LegendTheme(
          colorTheme: AppConfig.darkColorTheme,
          sizingTheme: AppConfig.sizingTheme,
          appBarStyle: AppConfig.appBarStyle,
          bottomBarStyle: AppConfig.bottomBarStyle,
        ),
        lightTheme: LegendTheme(
          colorTheme: AppConfig.lightColorTheme,
          sizingTheme: AppConfig.sizingTheme,
          appBarStyle: AppConfig.appBarStyle,
          bottomBarStyle: AppConfig.bottomBarStyle,
        ),
        sizingTheme: AppConfig.sizingTheme,
        themeType: LegendColorThemeType.DARK,
      ),
      globalFooter: LayoutInfo.footer,
    ),
  );
}
