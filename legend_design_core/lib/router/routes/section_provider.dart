import 'package:flutter/material.dart';
import 'package:legend_design_core/router/routes/section_route_info.dart';

class SectionProvider extends InheritedWidget {
  SectionProvider({
    Key? key,
    required this.child,
    required this.sections,
  }) : super(key: key, child: child);

  final Widget child;
  final List<SectionRouteInfo>? sections;

  static SectionProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SectionProvider>();
  }

  @override
  bool updateShouldNotify(SectionProvider oldWidget) {
    return true;
  }
}
