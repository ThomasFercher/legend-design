import 'package:flutter/cupertino.dart';
import 'package:webstore/customwidgets/modals/drawer/legendDrawerInfo.dart';

class LegendDrawerProvider extends ChangeNotifier {
  final List<LegendDrawerRoute> drawerRoutes;

  LegendDrawerProvider({
    required this.drawerRoutes,
  });

  void showDrawer(String name) {
    for (LegendDrawerRoute route in drawerRoutes) {
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
    for (LegendDrawerRoute route in drawerRoutes) {
      route.visible = false;
    }
    notifyListeners();
  }
}
