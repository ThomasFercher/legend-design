import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/typography.dart';

enum LegendTableValueType {
  TEXT,
  TEXTHIGHLIGHT,
  ADRESS,
  TAG,
  ACTION,
}

class LegendTableCell extends StatelessWidget {
  late String text;
  late LegendTextStyle typography;
  LegendButton? button;
  late Color color;
  late List<String> tags;

  LegendTableCell.text({
    required this.typography,
    required this.text,
  });

  LegendTableCell.action({
    required this.button,
    required this.color,
  });

  LegendTableCell.tag({
    required this.tags,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return button ??
        Container(
          padding: EdgeInsets.all(8.0),
          child: LegendText(text: text),
        );
  }
}
