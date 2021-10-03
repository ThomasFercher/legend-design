import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedAppBar.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/fixedBottomBar.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';
import 'package:webstore/styles/theming/colors/legendColors.dart';
import 'package:webstore/styles/theming/sizing/legendSizing.dart';
import 'package:webstore/styles/theming/widget/appBarTheme.dart';
import 'package:webstore/utils/restart.dart';
import 'colors/legendColorTheme.dart';
import 'sizing/legendSizingTheme.dart';
import '../../customwidgets/typography/typography.dart';

enum LegendColorThemeType {
  LIGHT,
  DARK,
}

enum BottomBarType {
  NORMAl,
  HALFROUNDED,
  ROUNDED,
}

class LegendTheme extends ChangeNotifier {
  LegendTheme() {
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
  // Platform INfo

  final bool isMobile = !kIsWeb ? Platform.isIOS || Platform.isAndroid : false;

  // Colors
  LegendColorThemeType colorTheme = LegendColorThemeType.DARK;

  LegendColorTheme lightColorTheme = LegendColorTheme(
    primaryColor: Colors.teal,
    secondaryColor: Colors.teal[50]!,
    scaffoldBackgroundColor: LegendColors.gray2,
    foreground: [
      LegendColors.gray4,
      LegendColors.gray6,
      LegendColors.gray8,
      LegendColors.gray10,
    ],
    selectionColor: Colors.tealAccent,
    textColorDark: Colors.tealAccent,
    textColorLight: Colors.tealAccent,
  );
  LegendColorTheme darkColorTheme = LegendColorTheme(
    primaryColor: Colors.teal[900]!,
    secondaryColor: Colors.tealAccent,
    scaffoldBackgroundColor: LegendColors.gray12,
    foreground: [
      LegendColors.gray10,
      LegendColors.gray8,
      LegendColors.gray6,
      LegendColors.gray4,
    ],
    selectionColor: Colors.tealAccent,
    textColorDark: LegendColors.gray6,
    textColorLight: LegendColors.gray4,
  );

  void changeColorTheme(LegendColorThemeType type, BuildContext context) {
    this.colorTheme = type;

    _appBarTheme = new LegendAppBarTheme(
      colors: colors,
      appBarType: FixedAppBarType.ICONS,
    );
    notifyListeners();
    RestartWidget.restartApp(context);
  }

//Sizing
  LegendSizingTheme _sizing = LegendSizingTheme(
    sizingType: LegendSizingType.WEB,
  );
  LegendSizing get sizing => _sizing.sizing;

  LegendColorTheme get colors {
    switch (colorTheme) {
      case LegendColorThemeType.LIGHT:
        return lightColorTheme;
      case LegendColorThemeType.DARK:
        return darkColorTheme;
      default:
        return lightColorTheme;
    }
  }

  // Custom Widgets / Overrides)

  // App Bar

  late LegendAppBarTheme _appBarTheme = new LegendAppBarTheme(
    colors: colors,
    appBarType: FixedAppBarType.ICONS,
  );
  FixedAppBarStyle get appBarStyle => _appBarTheme.appBarStyle;

  // Bottom Bar
  final BottomBarType bottomBarType = BottomBarType.NORMAl;

  late final BottomBarStyle normalBottomBar = BottomBarStyle(
    showText: false,
    textAtBottom: true,
    height: 48,
    margin: EdgeInsets.all(0),
    activeColor: colors.primaryColor,
    disabledColor: Colors.black26,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2.0,
          spreadRadius: 2.0,
        ),
      ],
    ),
  );

  late final BottomBarStyle roundedBottomBar = BottomBarStyle(
    showText: true,
    textAtBottom: true,
    height: 64,
    margin: EdgeInsets.all(0),
    activeColor: colors.primaryColor,
    disabledColor: Colors.black26,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2.0,
          spreadRadius: 2.0,
        ),
      ],
    ),
  );

  late final BottomBarStyle cardBottomBar = BottomBarStyle(
    showText: true,
    textAtBottom: true,
    height: 80,
    margin: EdgeInsets.all(8.0),
    activeColor: colors.primaryColor,
    disabledColor: Colors.black26,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 2.0,
          spreadRadius: 2.0,
        ),
      ],
    ),
  );

  BottomBarStyle get bottomBarStyle {
    switch (bottomBarType) {
      case BottomBarType.NORMAl:
        return normalBottomBar;
      case BottomBarType.HALFROUNDED:
        return roundedBottomBar;
      case BottomBarType.ROUNDED:
        return cardBottomBar;
      default:
        return normalBottomBar;
    }
  }
}
