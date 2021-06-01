import 'package:flutter/cupertino.dart';

class ThemeProvider extends InheritedWidget {
  Color primaryColor;
  Color secondaryColor;
  Widget child;

  ThemeProvider({
    required this.primaryColor,
    required this.secondaryColor,
    required this.child,
  }) : super(child: child);

  static ThemeProvider of(BuildContext context) {
    final ThemeProvider? result =
        context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(result != null, 'No ThemeProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider old) {
    return old != this;
  }
}
