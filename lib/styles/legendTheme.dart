import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/styles/legendColorTheme.dart';
import 'legendColorTheme.dart';
import 'legendSizingTheme.dart';
import '../customwidgets/typography/typography.dart';

enum LegendColorThemeType {
  LIGHT,
  DARK,
}

enum LegendSizingType {
  MOBILE,
  TABLET,
  WEB,
}

class LegendTheme extends ChangeNotifier {
  // Colors
  LegendColorThemeType colorTheme = LegendColorThemeType.LIGHT;
  LegendSizingType sizingType = LegendSizingType.WEB;
  LegendColorTheme lightColorTheme = LegendColorTheme(
    primaryColor: Colors.teal,
    secondaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black.withOpacity(0.06),
  );
  LegendColorTheme darkColorTheme = LegendColorTheme(
    primaryColor: Colors.blueGrey,
    secondaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.black.withOpacity(0.06),
  );

  void changeColorTheme(LegendColorThemeType type) {
    this.colorTheme = type;
    notifyListeners();
  }

  // Sizing
  LegendSizing webSizing = LegendSizing(
    appbarHeight: 80.0,
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    typography: LegendTypography(),
  );

  LegendSizing get sizing {
    switch (sizingType) {
      case LegendSizingType.WEB:
        return webSizing;
      default:
        return webSizing;
    }
  }

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
}
