import 'package:flutter/widgets.dart';

class RouteInfo {
  final String name;
  final Widget page;
  final Object? arguments;

  RouteInfo({
    required this.name,
    required this.page,
    this.arguments,
  });
}
