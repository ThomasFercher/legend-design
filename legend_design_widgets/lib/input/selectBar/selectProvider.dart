import 'package:flutter/cupertino.dart';
import 'package:legend_design_widgets/input/selectBar/legendSelectOption.dart';

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
