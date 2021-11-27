import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixed_appbar.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixed_bottom_bar.dart';
import 'package:legend_design_core/layout/fixed/fixed_footer.dart';
import 'package:legend_design_core/layout/fixed/sider/siderTheme.dart';
import 'package:legend_design_core/typography/typography.dart';

class LegendColorTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color scaffoldBackgroundColor;
  final List<Color> foreground;
  final List<Color> background;
  final SiderColorTheme siderColorTheme;
  final Color selectionColor;
  final Color textColorDark;
  final Color textColorLight;
  final Color cardBackgroundColor;
  final FixedAppBarColors appBarColors;
  final BottomBarColors bottomBarColors;
  final List<double>? elevations;
  final Color textContrast;

  final FixedFooterColors fixedFooterColors;
  final LegendTypographyColors typographyColors;

  LegendColorTheme({
    required this.textContrast,
    required this.primaryColor,
    required this.secondaryColor,
    required this.scaffoldBackgroundColor,
    required this.foreground,
    required this.selectionColor,
    required this.textColorDark,
    required this.textColorLight,
    required this.appBarColors,
    required this.bottomBarColors,
    required this.background,
    required this.fixedFooterColors,
    required this.cardBackgroundColor,
    required this.typographyColors,
    required this.siderColorTheme,
    this.elevations,
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
