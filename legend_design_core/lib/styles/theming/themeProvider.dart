import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixedAppBar.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixedBottomBar.dart';
import 'package:legend_design_core/styles/theming/colors/legendColorTheme.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/sizing/legendSizing.dart';
import 'package:legend_design_core/styles/theming/sizing/legendSizingTheme.dart';
import 'package:legend_design_core/utils/restart.dart';

enum LegendColorThemeType {
  LIGHT,
  DARK,
}

class ThemeProvider extends ChangeNotifier {
  LegendColorThemeType themeType;

  // Platform INfo
  final bool isMobile = !kIsWeb ? Platform.isIOS || Platform.isAndroid : false;

  final LegendTheme lightTheme;
  final LegendTheme darkTheme;
  final LegendSizingTheme sizingTheme;

  ThemeProvider({
    required this.lightTheme,
    required this.darkTheme,
    required this.themeType,
    required this.sizingTheme,
  }) {
    Color? _systemNavigationBarColor = bottomBarStyle.decoration.color;

    if (bottomBarStyle.margin.bottom != 0) {
      _systemNavigationBarColor = colors.scaffoldBackgroundColor;
    }

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: colors.primaryColor,
        systemNavigationBarColor: _systemNavigationBarColor,
      ),
    );
  }

  LegendColorTheme get colors {
    switch (themeType) {
      case LegendColorThemeType.DARK:
        return darkTheme.colorTheme;
      case LegendColorThemeType.LIGHT:
        return lightTheme.colorTheme;
      default:
        return darkTheme.colorTheme;
    }
  }

  LegendSizing get sizing => sizingTheme.sizing;

  FixedAppBarStyle get appBarStyle {
    switch (themeType) {
      case LegendColorThemeType.DARK:
        return darkTheme.appBarStyle;
      case LegendColorThemeType.LIGHT:
        return lightTheme.appBarStyle;
      default:
        return darkTheme.appBarStyle;
    }
  }

  BottomBarStyle get bottomBarStyle {
    switch (themeType) {
      case LegendColorThemeType.DARK:
        return darkTheme.bottomBarStyle;
      case LegendColorThemeType.LIGHT:
        return lightTheme.bottomBarStyle;
      default:
        return darkTheme.bottomBarStyle;
    }
  }

  void changeColorTheme(LegendColorThemeType type, BuildContext context) {
    this.themeType = type;

    /* _appBarTheme = new LegendAppBarTheme(
      colors: colors,
      appBarType: FixedAppBarType.ICONS,
    );*/
    notifyListeners();
    RestartWidget.restartApp(context);
  }
}
