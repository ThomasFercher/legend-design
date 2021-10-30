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
import 'package:legend_design_core/typography/typography.dart';
import 'package:webstore/pages/about.dart';
import 'package:webstore/pages/drawerPages/settingsPage.dart';
import 'package:webstore/pages/home.dart';
import 'package:webstore/pages/services.dart';
import 'package:webstore/pages/widgetComponets.dart';

class AppConfig {
  static BottomBarSizing bottomBarSizing = BottomBarSizing(
    showText: false,
    textAtBottom: true,
    height: 56,
    margin: EdgeInsets.all(0),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2.0,
          spreadRadius: 2.0,
        ),
      ],
    ),
  );

  static LegendSizingTheme sizingTheme = LegendSizingTheme(
    desktop: LegendSizing(
      borderRadius: [
        BorderRadius.all(
          Radius.circular(12),
        ),
        BorderRadius.all(
          Radius.circular(6),
        ),
      ],
      borderInset: [
        12,
        12,
      ],
      typography: LegendTypography(),
      contentPadding: 8,
      appBarSizing: FixedAppBarSizing(
        appBarHeight: 80,
        contentPadding: EdgeInsets.all(0),
        borderRadius: Radius.circular(20),
        iconSize: 24,
        spacing: 20,
      ),
    ),
    mobile: LegendSizing(
      borderRadius: [
        BorderRadius.all(
          Radius.circular(8),
        ),
        BorderRadius.all(
          Radius.circular(4),
        ),
      ],
      borderInset: [
        8,
        4,
      ],
      typography: LegendTypography(),
      contentPadding: 4,
      appBarSizing: FixedAppBarSizing(
        appBarHeight: 80,
        contentPadding: EdgeInsets.all(0),
        borderRadius: Radius.circular(20),
        iconSize: 24,
        spacing: 20,
      ),
      bottomBarSizing: bottomBarSizing,
    ),
    tablet: LegendSizing(
      borderRadius: [
        BorderRadius.all(
          Radius.circular(12),
        ),
        BorderRadius.all(
          Radius.circular(6),
        ),
      ],
      borderInset: [
        12,
        12,
      ],
      typography: LegendTypography(),
      contentPadding: 8,
      appBarSizing: FixedAppBarSizing(
        appBarHeight: 80,
        contentPadding: EdgeInsets.all(0),
        borderRadius: Radius.circular(20),
        iconSize: 24,
        spacing: 20,
      ),
    ),
    web: LegendSizing(
      borderRadius: [
        BorderRadius.all(
          Radius.circular(12),
        ),
        BorderRadius.all(
          Radius.circular(6),
        ),
      ],
      borderInset: [
        12,
        12,
      ],
      typography: LegendTypography(),
      contentPadding: 8,
      appBarSizing: FixedAppBarSizing(
        appBarHeight: 80,
        contentPadding: EdgeInsets.all(0),
        borderRadius: Radius.circular(20),
        iconSize: 24,
        spacing: 20,
      ),
    ),
  );

  static LegendColorTheme lightColorTheme = LegendColorTheme(
    bottomBarColors: BottomBarColors(
      activeColor: Colors.teal,
      disabledColor: Colors.black26,
      backgroundColor: LegendColors.gray10,
    ),
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
    appBarColors: FixedAppBarColors(
      backgroundColor: Colors.teal,
      iconColor: Colors.tealAccent,
      selectedColor: Colors.teal,
    ),
  );
  static LegendColorTheme darkColorTheme = LegendColorTheme(
    bottomBarColors: BottomBarColors(
      activeColor: Colors.teal,
      disabledColor: Colors.black26,
      backgroundColor: LegendColors.gray10,
    ),
    primaryColor: Colors.teal,
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
    appBarColors: FixedAppBarColors(
      backgroundColor: Colors.teal,
      iconColor: Colors.tealAccent,
      selectedColor: Colors.teal,
    ),
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
      mobileWidth: 320,
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
