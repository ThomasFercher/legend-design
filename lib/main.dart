import 'package:flutter/material.dart';
import 'objects/menuOption.dart';
import 'pages/about.dart';
import 'pages/home.dart';
import 'pages/products.dart';
import 'router/delegate.dart';
import 'router/parser.dart';
import 'router/routeInfo.dart';
import 'router/routerProvider.dart';
import 'styles/themeProvider.dart';
import 'styles/typography.dart';

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
