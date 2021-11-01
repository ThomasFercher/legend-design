import 'package:flutter/widgets.dart';
import 'package:legend_design_core/router/routes/section_route_info.dart';

class RouteInfo {
  final String name;
  final Widget page;
  final Object? arguments;
  final List<SectionRouteInfo>? sections;

  const RouteInfo({
    required this.name,
    required this.page,
    this.arguments,
    this.sections,
  });
}
