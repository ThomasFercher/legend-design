import 'package:flutter/material.dart';
import 'package:webstore/pages/home.dart';
import 'package:webstore/pages/products.dart';
import 'package:webstore/router/delegate.dart';
import 'package:webstore/router/parser.dart';
import 'package:webstore/router/routeInfo.dart';
import 'package:webstore/router/routerProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = new WebRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return RouterProvider(
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
      ],
      child: MaterialApp.router(
        title: 'Flutter Webstore',
        routerDelegate: routerDelegate,
        routeInformationParser: const MyRouteInformationParser(),
        debugShowCheckedModeBanner: false,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
