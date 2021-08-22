import 'package:flutter/widgets.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';

class RouteInfo {
  final String name;
  final Widget page;
  final Object? arguments;
  final List<SectionRouteInfo>? sections;

  RouteInfo({
    required this.name,
    required this.page,
    this.arguments,
    this.sections,
  });
}
