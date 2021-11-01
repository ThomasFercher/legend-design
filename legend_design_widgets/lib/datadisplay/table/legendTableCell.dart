import 'package:flutter/material.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_widgets/datadisplay/tag/legendTag.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';

enum LegendTableValueType {
  TEXT,
  TEXTHIGHLIGHT,
  ADRESS,
  TAG,
  ACTION,
}

class LegendTableCell extends StatelessWidget {
  late String? text;
  late LegendTableValueType type;
  late LegendTextStyle typography;
  LegendButton? button;
  late Color color;
  late List<List<dynamic>> tags;

  LegendTableCell.text({
    required this.typography,
    required this.text,
  }) {
    type = LegendTableValueType.TEXT;
  }

  LegendTableCell.action({
    required this.button,
    required this.color,
  }) {
    type = LegendTableValueType.ACTION;
  }

  LegendTableCell.tag({
    required this.tags,
    required this.color,
  }) {
    type = LegendTableValueType.TAG;
  }

  Widget getChild() {
    switch (type) {
      case LegendTableValueType.TEXT:
        return Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.red,
          child: LegendText(text: text ?? ""),
        );
      case LegendTableValueType.ACTION:
        return button!;
      case LegendTableValueType.TAG:
        return Container(
          child: Row(
            children: List.of(
              tags.map(
                (t) => LegendTag(
                  text: t[0],
                  color: t[1] ?? Colors.red,
                ),
              ),
            ),
          ),
        );
      default:
        return Container(
          padding: EdgeInsets.all(8.0),
          child: LegendText(text: text ?? ""),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getChild(),
    );
  }
}
