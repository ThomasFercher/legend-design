import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/styles/theming/sizing/legendSizing.dart';

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
  );
}
