import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:legend_design/config/routes.dart';
import 'package:legend_design_core/legend_app.dart';
import 'config/theme.dart';

void main() {
  runApp(
    LegendApp(
      routesDelegate: const RoutesTheme(),
      themeDelegate: const AppTheme(),
      logo: SvgPicture.asset(
        "assets/photos/larrylegend.svg",
        width: 48,
        height: 48,
      ),
      title: "Legend Design",
      future: Future.delayed(Duration(seconds: 2), () => true),
      buildSplashscreen: (context, theme) {
        return Container(
          color: theme.colors.primary,
        );
      },
    ),
  );
}
