import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/fixed/fixedFooter.dart';
import 'package:legend_design_core/layout/layoutProvider.dart';
import 'package:legend_design_core/router/routerProvider.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:provider/provider.dart';

import 'layout/drawers/legendDrawerInfo.dart';
import 'layout/drawers/legendDrawerProvider.dart';
import 'layout/fixed/bottomBar.dart/bottomBarProvider.dart';
import 'objects/menuOption.dart';
import 'router/delegate.dart';
import 'router/parser.dart';
import 'router/routes/routeInfo.dart';
import 'styles/theming/colors/legendColors.dart';
import 'styles/theming/legendTheme.dart';
import 'utils/restart.dart';

class LegendApp extends StatelessWidget {
  final routerDelegate = WebRouterDelegate();
  final List<MenuOption> menuOptions;
  final List<RouteInfo> routes;
  final List<LegendDrawerRoute> drawerRoutes;
  final Widget logo;
  final ThemeProvider theme;
  final FixedFooter? globalFooter;

  LegendApp({
    Key? key,
    required this.menuOptions,
    required this.routes,
    required this.drawerRoutes,
    required this.logo,
    required this.theme,
    this.globalFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => theme,
        ),
        ChangeNotifierProvider<BottomBarProvider>(
          create: (_) => BottomBarProvider(
            menuOptions.first,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LegendDrawerProvider(
            drawerRoutes: drawerRoutes,
          ),
        )
      ],
      child: Builder(builder: (context) {
        ThemeProvider theme = Provider.of<ThemeProvider>(context);
        return LayoutProvider(
          globalFooter: globalFooter,
          logo: logo,
          child: RouterProvider(
            routerDelegate: routerDelegate,
            routes: routes,
            menuOptions: menuOptions,
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
          ),
        );
      }),
    );
  }
}
