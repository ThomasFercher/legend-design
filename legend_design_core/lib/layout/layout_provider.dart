import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/fixed/fixed_footer.dart';

class LayoutProvider extends InheritedWidget {
  final FixedFooter? globalFooter;
  final Widget? logo;

  LayoutProvider({
    Key? key,
    required this.child,
    this.globalFooter,
    this.logo,
  }) : super(key: key, child: child);

  final Widget child;

  static LayoutProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LayoutProvider>();
  }

  @override
  bool updateShouldNotify(LayoutProvider oldWidget) {
    return true;
  }
}
