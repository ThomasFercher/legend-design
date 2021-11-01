import 'package:flutter/material.dart';
import 'package:legend_design_core/router/routes/section_route_info.dart';

class SectionNavigation extends InheritedWidget {
  SectionNavigation({
    Key? key,
    required this.onNavigate,
    required this.child,
    List<SectionRouteInfo>? sections,
  }) : super(key: key, child: child) {
    this.sections = sections ?? [];
  }

  late final List<SectionRouteInfo> sections;
  final Widget child;
  final void Function(SectionRouteInfo section) onNavigate;

  void navigateToSection(SectionRouteInfo section) {
    onNavigate(section);
  }

  static SectionNavigation? of(BuildContext context) {
    final SectionNavigation? result =
        context.dependOnInheritedWidgetOfExactType<SectionNavigation>();
    assert(result != null, 'No SizeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SectionNavigation oldWidget) {
    return true;
  }
}
