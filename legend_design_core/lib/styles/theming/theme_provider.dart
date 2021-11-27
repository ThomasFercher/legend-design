import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixed_appbar.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixed_bottom_bar.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/sizing/legend_sizing.dart';
import 'package:legend_design_core/styles/theming/sizing/legend_sizing_theme.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_core/utils/restart.dart';

enum LegendColorThemeType {
  LIGHT,
  DARK,
  SYSTEM,
}

class ThemeProvider extends ChangeNotifier {
  LegendColorThemeType themeType;
  late LegendSizingType sizingType;

  final LegendColorTheme lightTheme;
  final LegendColorTheme darkTheme;
  LegendSizingTheme sizingTheme;
  late LegendTypography typography;

  ThemeProvider({
    required this.lightTheme,
    required this.darkTheme,
    required this.themeType,
    required this.sizingTheme,
    required LegendTypography typography,
  }) {
    this.typography = LegendTypography.applyStyles(
      sizing: sizing.typographySizing,
      colors: colors.typographyColors,
      typography: typography,
    );

    sizingType = sizingTheme.sizingType;
    Color? _systemNavigationBarColor = bottomBarColors.backgroundColor;

    if (bottomBarStyle?.margin.bottom != 0) {
      _systemNavigationBarColor = colors.scaffoldBackgroundColor;
    }

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  final List<MenuOption> options = [];
  double menuWidth = 0;

  void setMenuOptionWidth(double w, MenuOption o) {
    if (!options.contains(o)) {
      options.add(o);
      menuWidth += w;
    }
  }

  void setSizing(LegendSizingType type) {
    sizingTheme.sizingType = type;
  }

  LegendColorTheme get colors {
    switch (themeType) {
      case LegendColorThemeType.DARK:
        return darkTheme;
      case LegendColorThemeType.LIGHT:
        return lightTheme;
      default:
        // Platform Default
        return darkTheme;
    }
  }

  // Getter Clean

  LegendSizing get sizing => sizingTheme.sizing;

  FixedAppBarColors get appBarColors => colors.appBarColors;

  FixedAppBarSizing get appBarSizing => sizing.appBarSizing;

  BottomBarSizing? get bottomBarStyle => sizing.bottomBarSizing;

  BottomBarColors get bottomBarColors => colors.bottomBarColors;

  void changeColorTheme(LegendColorThemeType type, BuildContext context) {
    this.themeType = type;

    /* _appBarTheme = new LegendAppBarTheme(
      colors: colors,
      appBarType: FixedAppBarType.ICONS,
    );*/

    typography = LegendTypography.applyStyles(
      sizing: sizing.typographySizing,
      colors: colors.typographyColors,
      typography: typography,
    );
    notifyListeners();
    RestartWidget.restartApp(context);
  }
}
