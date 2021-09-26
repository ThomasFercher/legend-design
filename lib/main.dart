import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/bottomBarProvider.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';
import 'package:webstore/utils/restart.dart';

import 'objects/menuOption.dart';
import 'pages/widgetComponets.dart';
import 'pages/home.dart';
import 'pages/products.dart';
import 'router/delegate.dart';
import 'router/parser.dart';
import 'router/routes/routeInfo.dart';
import 'router/routerProvider.dart';
import 'styles/theming/legendTheme.dart';
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

  List<RouteInfo> _routes = [
    RouteInfo(
      name: "/",
      page: Home(),
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
      child: Builder(builder: (context) {
        return RouterProvider(
          routerDelegate: routerDelegate,
          routes: _routes,
          menuOptions: _menuOptions,
          child: RestartWidget(
            child: MaterialApp.router(
              title: 'Legend Design',
              routerDelegate: routerDelegate,
              routeInformationParser: const MyRouteInformationParser(),
              debugShowCheckedModeBanner: false,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          ),
        );
      }),
    );
  }
}
