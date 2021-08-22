import 'package:flutter/cupertino.dart';
import 'package:webstore/customwidgets/input/selectBar/legendSelectOption.dart';

class LegendSelectProvider with ChangeNotifier {
  late List<LegendSelectOption> options;
  late LegendSelectOption selected;

  LegendSelectProvider(
    this.selected,
  );

  selectOption(LegendSelectOption selectOption) {
    selected = selectOption;
    notifyListeners();
  }
}
