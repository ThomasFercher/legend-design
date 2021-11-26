import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:legend_design_core/styles/theming/sizing/legend_sizing.dart';

class LegendSizingTheme {
  final LegendSizing mobile;
  final LegendSizing tablet;
  final LegendSizing web;
  final LegendSizing desktop;
  late LegendSizingType sizingType;

  LegendSizingTheme({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.web,
  }) {
    if (kIsWeb) {
      sizingType = LegendSizingType.WEB;
    } else if (Platform.isIOS || Platform.isAndroid) {
      sizingType = LegendSizingType.MOBILE;
    } else if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sizingType = LegendSizingType.DESTKOP;
    } else {
      LegendSizingType.WEB;
    }
  }

  LegendSizing get sizing {
    switch (sizingType) {
      case LegendSizingType.WEB:
        return web;
      case LegendSizingType.MOBILE:
        return mobile;
      case LegendSizingType.TABLET:
        return tablet;
      case LegendSizingType.DESTKOP:
        return desktop;
      default:
        return web;
    }
  }
}
