import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/bottomBarProvider.dart';
import 'package:webstore/customwidgets/layout/grid/legendGrid.dart';
import 'package:webstore/customwidgets/layout/grid/legendGridSize.dart';
import 'package:webstore/customwidgets/modals/drawer/legendDrawerInfo.dart';
import 'package:webstore/customwidgets/modals/drawer/legendDrawerProvider.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';
import 'package:webstore/styles/theming/colors/legendColors.dart';
import 'package:webstore/styles/theming/sizing/sizeProvider.dart';
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
        ChangeNotifierProvider(
          create: (context) => LegendDrawerProvider(
            drawerRoutes: [
              LegendDrawerRoute(
                title: "Settings",
                name: "/settings",
                contentBuilder: (context) {
                  LegendTheme theme = Provider.of<LegendTheme>(context);
                  return Container(
                    width: SizeProvider.of(context).width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LegendText(
                          padding: EdgeInsets.only(top: 20),
                          text: "Themes",
                          textStyle: LegendTextStyle.sectionHeader().copyWith(
                            color: theme.colors.textColorDark,
                            fontSize: 16,
                          ),
                        ),
                        LegendGrid(
                          margin: EdgeInsets.only(top: 8),
                          width: 400,
                          children: [
                            InkWell(
                              onTap: () {
                                Provider.of<LegendTheme>(context, listen: false)
                                    .changeColorTheme(
                                        LegendColorThemeType.DARK, context);
                              },
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.all(
                                  theme.sizing.borderInset[1],
                                ),
                                decoration: BoxDecoration(
                                  color: LegendColors.gray8,
                                  borderRadius: theme.sizing.borderRadius[1],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 4,
                                      bottom: 4,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: LegendColors.gray10,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 60,
                                      top: 40,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: LegendColors.gray9,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      right: 10,
                                      child: Container(
                                        width: 40,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: LegendColors.gray10,
                                          border: Border.all(
                                            width: 2,
                                            color: LegendColors.gray9,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 4,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: LegendColors.gray11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Provider.of<LegendTheme>(context, listen: false)
                                    .changeColorTheme(
                                        LegendColorThemeType.LIGHT, context);
                              },
                              child: Container(
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.all(
                                  theme.sizing.borderInset[1],
                                ),
                                decoration: BoxDecoration(
                                  color: LegendColors.gray2,
                                  borderRadius: theme.sizing.borderRadius[1],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 4,
                                      bottom: 4,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: LegendColors.gray5,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 60,
                                      top: 40,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: LegendColors.gray6,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      right: 10,
                                      child: Container(
                                        width: 40,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: LegendColors.gray5,
                                          border: Border.all(
                                            width: 2,
                                            color: LegendColors.gray6,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 4,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: LegendColors.gray7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                          sizes: LegendGridSize(
                            medium: LegendGridSizeInfo(2, 200),
                            layoutDirection: LegendGridSizeDirection.DOWN,
                          ),
                        )
                      ],
                    ),
                  );
                },
                actions: [],
                width: 400,
              ),
            ],
          ),
        )
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
