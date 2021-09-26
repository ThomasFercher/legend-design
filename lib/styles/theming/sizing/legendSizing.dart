import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/typography/typography.dart';

enum LegendSizingType {
  MOBILE,
  TABLET,
  WEB,
  DESTKOP,
}

class LegendSizing {
  final List<BorderRadius> borderRadius;
  final List<double> borderInset;
  final LegendTypography typography;

  LegendSizing({
    required this.borderRadius,
    required this.typography,
    required this.borderInset,
  });
}
