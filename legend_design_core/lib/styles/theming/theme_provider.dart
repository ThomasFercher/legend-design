import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixed_appbar.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixed_bottom_bar.dart';
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

  // Platform INfo
  final bool isMobile = !kIsWeb ? Platform.isIOS || Platform.isAndroid : false;

  final LegendColorTheme lightTheme;
  final LegendColorTheme darkTheme;
  final LegendSizingTheme sizingTheme;
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
