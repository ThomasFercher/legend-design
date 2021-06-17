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
    if (width < 400) {
      screenSize = ScreenSize.Small;
    } else if (width < 960) {
      screenSize = ScreenSize.Medium;
    } else if (width < 1200) {
      screenSize = ScreenSize.Large;
    } else {
      screenSize = ScreenSize.XXL;
    }
  }

  static SizeProvider of(context) {
    final SizeProvider? result =
        context.dependOnInheritedWidgetOfExactType<SizeProvider>();
    assert(result != null, 'No SizeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant SizeProvider old) {
    return old.width != this.width;
  }
}
