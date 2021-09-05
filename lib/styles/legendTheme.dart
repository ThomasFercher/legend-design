import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedAppBar.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/fixedBottomBar.dart';
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

  // Colors
  LegendColorThemeType colorTheme = LegendColorThemeType.LIGHT;
  LegendSizingType sizingType = LegendSizingType.WEB;

  LegendColorTheme lightColorTheme = LegendColorTheme(
    primaryColor: Colors.teal,
    secondaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: LegendColorTheme.darken(Colors.white, 0.06),
  );
  LegendColorTheme darkColorTheme = LegendColorTheme(
    primaryColor: Colors.blueGrey,
    secondaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: LegendColorTheme.darken(Colors.white, 0.06),
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
    borderRadius: Radius.circular(12.0),
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

  // Bottom Bar

  final BottomBarType bottomBarType = BottomBarType.ROUNDED;

  late final BottomBarStyle normalBottomBar = BottomBarStyle(
    showText: true,
    textAtBottom: true,
    height: 56,
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
