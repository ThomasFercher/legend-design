import 'package:flutter/cupertino.dart';
import 'layoutType.dart';

class SizeProvider extends InheritedWidget {
  final Widget child;
  final double width;
  late final ScreenSize screenSize;
  final double height;

  SizeProvider({
    required this.child,
    required this.width,
    required this.height,
  }) : super(child: child) {
    screenSize = getScreenSizeFromWidth(width);
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
}
