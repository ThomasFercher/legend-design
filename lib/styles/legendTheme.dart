import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedAppBar.dart';
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

enum FixedAppBarType {
  NORMAl,
  SLEEK,
  RoundedMobile,
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

  // Custom Widgets / Overrides)

  final FixedAppBarType appBarType = FixedAppBarType.RoundedMobile;

  late final FixedAppBarStyle sleekAppBarStyle = FixedAppBarStyle(
    appBarHeight: 80,
    backgroundColor: Colors.transparent,
    borderRadius: Radius.circular(20),
    contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
    cardColor: Colors.white,
    pinned: true,
  );

  late final FixedAppBarStyle mobileRoundedStyle = FixedAppBarStyle(
    appBarHeight: 80,
    backgroundColor: Colors.teal,
    borderRadius: Radius.circular(20),
    contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
    pinned: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(12.0),
      ),
    ),
  );

  late final FixedAppBarStyle normalAppBarStyle = FixedAppBarStyle(
    appBarHeight: 80,
    backgroundColor: colors.primaryColor,
    borderRadius: Radius.circular(20),
    contentPadding: EdgeInsets.all(8),
  );

  FixedAppBarStyle get appBarStyle {
    switch (appBarType) {
      case FixedAppBarType.SLEEK:
        return sleekAppBarStyle;
      case FixedAppBarType.RoundedMobile:
        return mobileRoundedStyle;
      default:
        return normalAppBarStyle;
    }
  }
}
