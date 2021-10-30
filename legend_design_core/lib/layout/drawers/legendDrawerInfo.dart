import 'package:flutter/cupertino.dart';

class LegendDrawerRoute {
  final String title;
  final String name;
  final WidgetBuilder contentBuilder;
  final List<Widget> actions;
  late bool visible;
  late final double width;
  final double mobileWidth;

  LegendDrawerRoute({
    required this.title,
    required this.name,
    required this.contentBuilder,
    required this.actions,
    bool? visible,
    required this.width,
    required this.mobileWidth,
  }) {
    this.visible = visible ?? false;
  }
}
