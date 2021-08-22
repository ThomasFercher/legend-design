import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../objects/menuOption.dart';
import 'delegate.dart';
import 'errorpages/notfound.dart';
import 'routes/routeInfo.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'routes/sectionProvider.dart';

class RouterProvider extends InheritedWidget {
  final WebRouterDelegate routerDelegate;
  final Widget child;
  final List<RouteInfo> routes;
  final List<MenuOptionHeader> menuOptions;

  RouterProvider({
    Key? key,
    required this.routerDelegate,
    required this.child,
    required this.routes,
    required this.menuOptions,
  }) : super(key: key, child: child);

  static RouterProvider of(BuildContext context) {
    final RouterProvider? result =
        context.dependOnInheritedWidgetOfExactType<RouterProvider>();
    assert(result != null, 'No RouterProvider found in context');
    return result!;
  }

  void pushPage({required RouteSettings settings}) {
    Page p = createPage(settings, getRouteWidget(settings, routes));
    this.routerDelegate.pushPage(p);
  }

  static RouteInfo getRouteWidget(RouteSettings s, List<RouteInfo> routes) {
    if (routes == null || routes.isEmpty) {
      return RouteInfo(name: "Not Found", page: NotFoundPage());
    }

    RouteInfo? route = routes.singleWhere(
      (r) => r.name == s.name,
      orElse: () {
        return RouteInfo(name: "/notfound", page: NotFoundPage());
      },
    );

    return route;
  }

  static Page createPage(RouteSettings s, RouteInfo route) {
    String now = DateTime.now().millisecondsSinceEpoch.toString();

    // create full screen Page

    if (kIsWeb) {
      return MaterialPage(
        child: SectionProvider(
          sections: route.sections,
          child: route.page,
        ),
        key: ValueKey(s.name! + now),
        name: s.name,
        arguments: s.arguments,
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoPage(
        child: route.page,
        key: ValueKey(s.name! + now),
        name: s.name,
        arguments: s.arguments,
      );
    } else {
      return MaterialPage(
        child: SectionProvider(
          sections: route.sections,
          child: route.page,
        ),
        key: ValueKey(s.name! + now),
        name: s.name,
        arguments: s.arguments,
      );
    }
  }

  @override
  bool updateShouldNotify(covariant RouterProvider old) =>
      routerDelegate.currentConfiguration !=
      old.routerDelegate.currentConfiguration;
}
