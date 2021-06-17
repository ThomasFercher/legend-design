import 'package:webstore/customwidgets/datadisplay/table/legendTableCell.dart';

class LegendRowValue {
  List<dynamic> fields;
  Function? actionFunction;

  LegendRowValue({
    required this.fields,
    this.actionFunction,
  });
}
