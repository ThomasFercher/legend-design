import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'layoutType.dart';

class SizeProvider extends InheritedWidget {
  final Widget child;
  final double width;
  late final ScreenSize screenSize;
  final double height;
  late final bool _isMobile;

  double? titleWidth;

  // AppBar Menu Width
  late double _menuWidth;
  void setMenuWidth(double width) {
    this._menuWidth = width;
  }

  double get menuWidth => this._menuWidth;

  SizeProvider({
    required this.child,
    required this.width,
    required this.height,
  }) : super(child: child) {
    screenSize = getScreenSizeFromWidth(width);
    _isMobile = !kIsWeb ? Platform.isIOS || Platform.isAndroid : false;
  }

  bool get isMobile => _isMobile;

  double getTitleIndent() {
    return this.titleWidth ?? 0;
  }

  bool isMenuCollapsed() {
    return width - getTitleIndent() <= 620;
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

  static SizeProvider of(context) {
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
    return old.width != this.width;
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
