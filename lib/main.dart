import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/bottomBarProvider.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/legendColorTheme.dart';

import 'objects/menuOption.dart';
import 'pages/widgetComponets.dart';
import 'pages/home.dart';
import 'pages/products.dart';
import 'router/delegate.dart';
import 'router/parser.dart';
import 'router/routes/routeInfo.dart';
import 'router/routerProvider.dart';
import 'styles/legendTheme.dart';
import 'customwidgets/typography/typography.dart';

void main() {
  runApp(
    LegendApp(),
  );
}

class LegendApp extends StatelessWidget {
  final routerDelegate = new WebRouterDelegate();

  static const List<MenuOption> _menuOptions = [
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
  ];

  static const List<RouteInfo> _routes = [
    const RouteInfo(
      name: "/",
      page: Home(),
    ),
    const RouteInfo(
      name: "/products",
      page: ProductsPage(),
    ),
    const RouteInfo(
      name: "/widgets",
      page: WidgetComponents(),
      sections: [
        const SectionRouteInfo(name: "/buttons"),
        const SectionRouteInfo(name: "/modals"),
        const SectionRouteInfo(name: "/selectbar"),
        const SectionRouteInfo(name: "/carousel"),
        const SectionRouteInfo(name: "/textfield"),
        const SectionRouteInfo(name: "/form"),
        const SectionRouteInfo(name: "/table"),
        const SectionRouteInfo(name: "/tags"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LegendTheme>(create: (_) => LegendTheme()),
        ChangeNotifierProvider<BottomBarProvider>(
          create: (_) => BottomBarProvider(
            _menuOptions.first,
          ),
        ),
      ],
      child: RouterProvider(
        routerDelegate: routerDelegate,
        routes: _routes,
        menuOptions: _menuOptions,
        child: MaterialApp.router(
          title: 'Legend Design',
          routerDelegate: routerDelegate,
          routeInformationParser: const MyRouteInformationParser(),
          debugShowCheckedModeBanner: false,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
