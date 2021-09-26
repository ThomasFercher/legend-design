import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedAppBar.dart';
import 'package:webstore/styles/legendColorTheme.dart';

enum FixedAppBarType {
  NORMAl,
  SLEEK,
  RoundedMobile,
  ICONS,
}

class LegendAppBarTheme {
  LegendAppBarTheme({
    required this.colors,
    required this.appBarType,
  });

  final LegendColorTheme colors;
  final FixedAppBarType appBarType;

  FixedAppBarStyle get appBarStyle {
    switch (appBarType) {
      case FixedAppBarType.SLEEK:
        return sleekAppBarStyle;
      case FixedAppBarType.RoundedMobile:
        return mobileRoundedStyle;
      case FixedAppBarType.ICONS:
        return iconsAppBar;
      default:
        return normalAppBarStyle;
    }
  }

  late final FixedAppBarStyle sleekAppBarStyle = FixedAppBarStyle(
    appBarHeight: 80,
    backgroundColor: Colors.transparent,
    borderRadius: Radius.circular(20),
    contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 12.0),
    cardColor: Colors.white,
    pinned: true,
    selectedColor: colors.selectionColor,
  );

  late FixedAppBarStyle iconsAppBar = FixedAppBarStyle(
    appBarHeight: 60,
    backgroundColor: colors.primaryColor,
    contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 12.0),
    iconSize: 32,
    spacing: 16.0,
    iconColor: colors.secondaryColor,
    selectedColor: colors.selectionColor,
  );

  late final FixedAppBarStyle mobileRoundedStyle = FixedAppBarStyle(
    appBarHeight: 48,
    backgroundColor: Colors.teal,
    borderRadius: Radius.circular(12.0),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    pinned: true,
    selectedColor: colors.selectionColor,
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
    selectedColor: colors.selectionColor,
  );
}
