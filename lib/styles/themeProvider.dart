import 'package:flutter/cupertino.dart';
import 'typography.dart';

// Replace wiith class and static properties
// Create Object for  Color-Theme(Light, Dark) and Sizin Theme (Mobile, Tablet, alles wie Padding, Margin usw...)
// Create Light, Dark Color Theme

class ThemeProvider extends InheritedWidget {
  Color primaryColor;
  Color secondaryColor;
  Widget child;
  BorderRadius borderRadius;
  LegendTypography typography;

  double appbarHeight = 80.0;

  ThemeProvider({
    required this.primaryColor,
    required this.secondaryColor,
    required this.child,
    required this.borderRadius,
    required this.typography,
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
