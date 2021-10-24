import 'package:flutter/material.dart';
import 'package:legend_design_core/styles/theming/sizing/legendSizing.dart';
import 'package:legend_design_core/typography/typography.dart';

class LegendSizingTheme {
  final LegendSizingType sizingType;

  LegendSizingTheme({
    required this.sizingType,
  });

  LegendSizing get sizing {
    switch (sizingType) {
      case LegendSizingType.WEB:
        return webSizing;
      case LegendSizingType.MOBILE:
        return webSizing;
      case LegendSizingType.TABLET:
        return webSizing;
      case LegendSizingType.DESTKOP:
        return webSizing;
      default:
        return webSizing;
    }
  }

  final LegendSizing webSizing = LegendSizing(
    borderRadius: [
      BorderRadius.all(
        Radius.circular(12),
      ),
      BorderRadius.all(
        Radius.circular(6),
      ),
    ],
    borderInset: [
      12,
      12,
    ],
    typography: LegendTypography(),
    contentPadding: 8,
  );
}
