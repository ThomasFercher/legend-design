import 'package:flutter/material.dart';

class LegendColorTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color scaffoldBackgroundColor;
  final List<Color> foreground;
  final Color selectionColor;
  final Color textColorDark;
  final Color textColorLight;

  LegendColorTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.scaffoldBackgroundColor,
    required this.foreground,
    required this.selectionColor,
    required this.textColorDark,
    required this.textColorLight,
  });

  // ranges from 0.0 to 1.0

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
