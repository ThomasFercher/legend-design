import 'package:flutter/material.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/pages/about.dart';
import 'package:webstore/pages/home.dart';
import 'package:webstore/pages/products.dart';
import 'package:webstore/router/delegate.dart';
import 'package:webstore/router/parser.dart';
import 'package:webstore/router/routeInfo.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/themeProvider.dart';
import 'package:webstore/styles/typography.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = new WebRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      borderRadius: BorderRadius.circular(16),
      primaryColor: Colors.teal,
      secondaryColor: Colors.blueGrey,
      typography: LegendTypography(),
      child: RouterProvider(
        routerDelegate: routerDelegate,
        routes: [
          RouteInfo(
            name: "/",
            page: Home(),
          ),
          RouteInfo(
            name: "/products",
            page: ProductsPage(),
          ),
          RouteInfo(
            name: "/about",
            page: AboutPage(),
          ),
        ],
        menuOptions: [
          MenuOptionHeader(
            title: "Products",
            page: "/products",
            icon: Icons.accessibility,
          ),
          MenuOptionHeader(
            title: "About",
            page: "/about",
            icon: Icons.info_sharp,
          ),
        ],
        child: MaterialApp.router(
          title: 'Flutter Webstore',
          routerDelegate: routerDelegate,
          routeInformationParser: const MyRouteInformationParser(),
          debugShowCheckedModeBanner: false,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
