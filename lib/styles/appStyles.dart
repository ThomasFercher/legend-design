import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/drawers/legendDrawerInfo.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixedAppBar.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixedBottomBar.dart';
import 'package:legend_design_core/objects/menuOption.dart';
import 'package:legend_design_core/router/routes/routeInfo.dart';
import 'package:legend_design_core/router/routes/sectionRouteInfo.dart';
import 'package:legend_design_core/styles/theming/colors/legendColorTheme.dart';
import 'package:legend_design_core/styles/theming/colors/legendColors.dart';
import 'package:legend_design_core/styles/theming/sizing/legendSizing.dart';
import 'package:legend_design_core/styles/theming/sizing/legendSizingTheme.dart';
import 'package:webstore/pages/about.dart';
import 'package:webstore/pages/drawerPages/settingsPage.dart';
import 'package:webstore/pages/home.dart';
import 'package:webstore/pages/services.dart';
import 'package:webstore/pages/widgetComponets.dart';

class AppConfig {
  static BottomBarStyle bottomBarStyle = BottomBarStyle(
    showText: false,
    textAtBottom: true,
    height: 48,
    margin: EdgeInsets.all(0),
    activeColor: Colors.teal[900]!,
    disabledColor: Colors.black26,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2.0,
          spreadRadius: 2.0,
        ),
      ],
    ),
  );

  static FixedAppBarStyle appBarStyle = FixedAppBarStyle(
    appBarHeight: 80,
    backgroundColor: Colors.teal,
    borderRadius: Radius.circular(20),
    contentPadding: EdgeInsets.all(8),
    selectedColor: Colors.tealAccent,
  );

  static LegendSizingTheme sizingTheme = LegendSizingTheme(
    sizingType: LegendSizingType.WEB,
  );

  static LegendColorTheme lightColorTheme = LegendColorTheme(
    primaryColor: Colors.teal,
    secondaryColor: Colors.teal[50]!,
    scaffoldBackgroundColor: LegendColors.gray2,
    foreground: [
      LegendColors.gray4,
      LegendColors.gray6,
      LegendColors.gray8,
      LegendColors.gray10,
    ],
    selectionColor: Colors.tealAccent,
    textColorDark: Colors.tealAccent,
    textColorLight: Colors.tealAccent,
  );
  static LegendColorTheme darkColorTheme = LegendColorTheme(
    primaryColor: Colors.teal[900]!,
    secondaryColor: Color(0xFFb3dedb),
    scaffoldBackgroundColor: LegendColors.gray12,
    foreground: [
      LegendColors.gray10,
      LegendColors.gray8,
      LegendColors.gray6,
      LegendColors.gray4,
    ],
    selectionColor: Colors.tealAccent,
    textColorDark: LegendColors.gray6,
    textColorLight: LegendColors.gray4,
  );

  static List<MenuOption> menuOptions = [
    const MenuOption(
      title: "Home",
      page: "/",
      icon: Icons.home,
    ),
    const MenuOption(
      title: "Products",
      page: "/products",
      icon: Icons.accessibility,
    ),
    const MenuOption(
      title: "Widgets",
      page: "/widgets",
      icon: Icons.widgets,
    ),
    const MenuOption(
      title: "About",
      page: "/about",
      icon: Icons.info_outline_rounded,
    ),
  ];
  static List<LegendDrawerRoute> drawerRoutes = [
    LegendDrawerRoute(
      title: "Settings",
      name: "/settings",
      contentBuilder: (context) {
        return SettingsPage();
      },
      actions: [],
      width: 400,
    ),
  ];

  static List<RouteInfo> routes = [
    RouteInfo(
      name: "/",
      page: Home(),
    ),
    RouteInfo(
      name: "/about",
      page: About(),
    ),
    RouteInfo(
      name: "/products",
      page: ProductsPage(),
    ),
    RouteInfo(
      name: "/widgets",
      page: WidgetComponents(),
      sections: List.of(
        [
          SectionRouteInfo(name: "/buttons"),
          SectionRouteInfo(name: "/modals"),
          SectionRouteInfo(name: "/selectbar"),
          SectionRouteInfo(name: "/carousel"),
          SectionRouteInfo(name: "/textfield"),
          SectionRouteInfo(name: "/form"),
          SectionRouteInfo(name: "/table"),
          SectionRouteInfo(name: "/tags"),
        ],
        growable: true,
      ),
    ),
  ];
}
