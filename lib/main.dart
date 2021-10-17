import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/bottomBarProvider.dart';
import 'package:webstore/customwidgets/layout/grid/legendGrid.dart';
import 'package:webstore/customwidgets/layout/grid/legendGridSize.dart';
import 'package:webstore/customwidgets/modals/drawer/legendDrawerInfo.dart';
import 'package:webstore/customwidgets/modals/drawer/legendDrawerProvider.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/pages/about.dart';
import 'package:webstore/pages/drawerPages/settingsPage.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';
import 'package:webstore/styles/theming/colors/legendColors.dart';
import 'package:webstore/styles/theming/sizing/sizeProvider.dart';
import 'package:webstore/utils/restart.dart';

import 'objects/menuOption.dart';
import 'pages/widgetComponets.dart';
import 'pages/home.dart';
import 'pages/services.dart';
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
    const MenuOption(
      title: "About",
      page: "/about",
      icon: Icons.info_outline_rounded,
    ),
  ];

  List<RouteInfo> _routes = [
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
        ChangeNotifierProvider(
          create: (context) => LegendDrawerProvider(
            drawerRoutes: [
              LegendDrawerRoute(
                title: "Settings",
                name: "/settings",
                contentBuilder: (context) {
                  return SettingsPage();
                },
                actions: [],
                width: 400,
              ),
            ],
          ),
        )
      ],
      child: Builder(builder: (context) {
        LegendTheme theme = Provider.of<LegendTheme>(context);
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
              themeMode: ThemeMode.light,
              theme: ThemeData(
                // Implement as method of LegendTheme
                colorScheme: ColorScheme(
                  primary: theme.colors.primaryColor,
                  primaryVariant: theme.colors.primaryColor,
                  secondary: theme.colors.secondaryColor,
                  secondaryVariant: theme.colors.secondaryColor,
                  surface: theme.colors.foreground[1],
                  background: Colors.transparent,
                  error: Colors.redAccent,
                  onPrimary: LegendColors.gray3,
                  onSecondary: LegendColors.gray9,
                  onSurface: theme.colors.foreground[3],
                  onBackground: theme.colors.foreground[1],
                  onError: LegendColors.gray3,
                  brightness: Brightness.light,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
