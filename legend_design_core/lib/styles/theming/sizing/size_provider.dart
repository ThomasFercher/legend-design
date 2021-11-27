import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/styles/theming/sizing/legend_sizing.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:provider/src/provider.dart';
import '../../layouts/layout_type.dart';

class SizeProvider extends InheritedWidget {
  final Widget child;
  final double width;
  final bool useMobilDesign;
  late final ScreenSize screenSize;
  final double height;
  late bool _isMobile;
  final BuildContext context;

  SizeProvider({
    required this.child,
    required this.width,
    required this.height,
    required this.context,
    required this.useMobilDesign,
  }) : super(child: child) {
    screenSize = getScreenSizeFromWidth(width);
    ThemeProvider theme = context.watch<ThemeProvider>();
    _isMobile = !kIsWeb ? Platform.isIOS || Platform.isAndroid : false;

    if (useMobilDesign) {
      if (width <= 480) {
        theme.setSizing(LegendSizingType.MOBILE);
        _isMobile = true;
      } else {
        theme.setSizing(theme.sizingType);
        _isMobile = false;
      }
    }
  }

  bool get isMobile => _isMobile;

  double getTitleIndent(TextStyle style) {
    return calcTextSize(
          'Legend Design',
          style,
        ).width +
        26.0;
  }

  List<MenuOption> options = [];

  bool isMenuCollapsed(double menuWidth, ThemeProvider theme) {
    return width -
            (getTitleIndent(theme.typography.h6) +
                    (theme.appBarSizing.titleSize ??
                        theme.appBarSizing.appBarHeight / 3 * 2)) *
                2 -
            8 - //
            menuWidth <
        0;
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
    return old != this;
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
