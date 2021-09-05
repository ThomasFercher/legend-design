import 'package:flutter/cupertino.dart';
import 'package:webstore/customwidgets/input/selectBar/legendSelectOption.dart';
import 'package:webstore/objects/menuOption.dart';

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
