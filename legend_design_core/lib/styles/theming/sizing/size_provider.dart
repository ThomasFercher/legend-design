import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:legend_design_core/styles/theming/sizing/legend_sizing.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:provider/src/provider.dart';
import '../../layouts/layout_type.dart';

class SizeProvider extends InheritedWidget {
  final Widget child;
  final double width;
  late final ScreenSize screenSize;
  final double height;
  late final bool _isMobile;
  final BuildContext context;

  double? titleWidth;

  // AppBar Menu Width
  late double _menuWidth;
  void setMenuWidth(double width) {
    _menuWidth = width;
  }

  double get menuWidth => _menuWidth;

  SizeProvider({
    required this.child,
    required this.width,
    required this.height,
    required this.context,
  }) : super(child: child) {
    screenSize = getScreenSizeFromWidth(width);
    _isMobile = !kIsWeb ? Platform.isIOS || Platform.isAndroid : false;
    context.watch<ThemeProvider>().setSizing(LegendSizingType.MOBILE);
  }

  bool get isMobile => _isMobile;

  double getTitleIndent() {
    return titleWidth ?? 0;
  }

  bool isMenuCollapsed() {
    return width - getTitleIndent() <= 820;
  }

  static ScreenSize getScreenSizeFromWidth(double width) {
    if (width < 480) {
      return ScreenSize.Small;
    } else if (width < 960) {
      return ScreenSize.Medium;
    } else if (width < 1200) {
      return ScreenSize.Large;
    } else {
      return ScreenSize.XXL;
    }
  }

  static SizeProvider of(BuildContext context) {
    final SizeProvider? result =
        context.dependOnInheritedWidgetOfExactType<SizeProvider>();
    assert(result != null, 'No SizeProvider found in context');
    return result!;
  }

  static Size? getSizeFromKey(GlobalKey k) {
    final RenderBox? renderBoxRed =
        k.currentContext!.findRenderObject() as RenderBox?;
    return renderBoxRed?.size;
  }

  @override
  bool updateShouldNotify(covariant SizeProvider old) {
    return old.width != width;
  }

  static Size calcTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance?.window.textScaleFactor ?? 1,
    )..layout();
    return textPainter.size;
  }
}
