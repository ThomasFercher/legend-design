import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/fixed/fixed_footer.dart';
import 'package:legend_design_core/layout/layout_provider.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:provider/provider.dart';

import 'layout/drawers/legend_drawer_info.dart';
import 'layout/drawers/legend_drawer_provider.dart';
import 'layout/fixed/bottomBar.dart/bottom_bar_provider.dart';
import 'objects/menu_option.dart';
import 'router/delegate.dart';
import 'router/parser.dart';
import 'router/routes/route_info.dart';
import 'styles/theming/colors/legend_colors.dart';
import 'utils/restart.dart';

class LegendApp extends StatelessWidget {
  final routerDelegate = WebRouterDelegate();
  final List<MenuOption> menuOptions;
  final List<RouteInfo> routes;
  final List<LegendDrawerRoute> drawerRoutes;
  final Widget logo;
  final ThemeProvider theme;
  final FixedFooter? globalFooter;
  final Future<Object?>? future;
  final Widget? splashScreen;

  LegendApp({
    Key? key,
    required this.menuOptions,
    required this.routes,
    required this.drawerRoutes,
    required this.logo,
    required this.theme,
    this.future,
    this.globalFooter,
    this.splashScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData || splashScreen == null) {
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
        } else {
          return Material(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                child: splashScreen,
              ),
            ),
          );
        }
      },
    );
  }
}
