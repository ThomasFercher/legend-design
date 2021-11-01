import 'package:flutter/cupertino.dart';
import 'package:legend_design_core/layout/drawers/legend_drawer_info.dart';

class LegendDrawerProvider extends ChangeNotifier {
  final List<LegendDrawerRoute> drawerRoutes;

  LegendDrawerProvider({
    required this.drawerRoutes,
  });

  void showDrawer(String name) {
    for (final LegendDrawerRoute route in drawerRoutes) {
      route.visible = false;
    }
    LegendDrawerRoute r =
        drawerRoutes.singleWhere((element) => element.name == name);

    int i = drawerRoutes.indexOf(r);
    r.visible = true;
    drawerRoutes[i] = r;
    notifyListeners();
  }

  void closeDrawer() {
    for (final LegendDrawerRoute route in drawerRoutes) {
      route.visible = false;
    }
    notifyListeners();
  }
}
