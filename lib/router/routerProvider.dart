import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/delegate.dart';
import 'package:webstore/router/errorpages/notfound.dart';
import 'package:webstore/router/routeInfo.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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

  static Widget getRouteWidget(RouteSettings s, List<RouteInfo> routes) {
    if (routes == null || routes.isEmpty) {
      return NotFoundPage();
    }

    Widget? w = routes.singleWhere(
      (r) => r.name == s.name,
      orElse: () {
        return RouteInfo(name: "/notfound", page: NotFoundPage());
      },
    ).page;

    return w;
  }

  static Page createPage(RouteSettings s, Widget page) {
    String now = DateTime.now().millisecondsSinceEpoch.toString();
    if (kIsWeb) {
      return MaterialPage(
        child: page,
        key: ValueKey(s.name! + now),
        name: s.name,
        arguments: s.arguments,
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoPage(
        child: page,
        key: ValueKey(s.name! + now),
        name: s.name,
        arguments: s.arguments,
      );
    } else {
      return MaterialPage(
        child: page,
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
