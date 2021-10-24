import 'package:flutter/cupertino.dart';
import 'package:legend_design_core/objects/menuOption.dart';

class BottomBarProvider with ChangeNotifier {
  late MenuOption selected;

  BottomBarProvider(
    this.selected,
  );

  selectOption(MenuOption selectOption) {
    selected = selectOption;
    notifyListeners();
  }
}
