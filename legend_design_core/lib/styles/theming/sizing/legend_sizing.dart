import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixed_appbar.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixed_bottom_bar.dart';
import 'package:legend_design_core/layout/fixed/fixed_footer.dart';
import 'package:legend_design_core/typography/typography.dart';

enum LegendSizingType {
  MOBILE,
  TABLET,
  WEB,
  DESTKOP,
}

class LegendSizing {
  final List<BorderRadius> borderRadius;
  final List<double> borderInset;
  final List<double> padding;
  final FixedAppBarSizing appBarSizing;
  final BottomBarSizing? bottomBarSizing;
  final LegendTypographySizing typographySizing;

  LegendSizing({
    required this.borderRadius,
    required this.borderInset,
    required this.padding,
    required this.appBarSizing,
    required this.typographySizing,
    this.bottomBarSizing,
  });
}
