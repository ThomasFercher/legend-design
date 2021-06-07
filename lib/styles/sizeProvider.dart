import 'package:flutter/cupertino.dart';
import 'package:webstore/styles/layoutType.dart';

class SizeProvider extends InheritedWidget {
  final Widget child;
  final double width;
  late final ScreenSize screenSize;

  SizeProvider({
    required this.child,
    required this.width,
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
