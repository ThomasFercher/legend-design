import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendRowValue.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTableCell.dart';
import 'package:webstore/customwidgets/legendButton/buttonStyle.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/styles/typography.dart';

class LegendTable extends StatelessWidget {
  final double? height;
  final double? width;
  final List<LegendTableValueType> columnTypes;
  final List<LegendRowValue> values;

  const LegendTable({
    Key? key,
    this.height,
    this.width,
    required this.columnTypes,
    required this.values,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h;
    var w;

    return Container(
      child: LayoutBuilder(builder: (context, constraints) {
        if (height == null) {
          if (!constraints.hasBoundedHeight) {
            h = SizeProvider.of(context).height * 0.8;
          } else {
            h = constraints.maxHeight;
          }
        }
        if (width == null) {
          if (!constraints.hasBoundedWidth) {
            w = SizeProvider.of(context).width * 0.8;
          } else {
            w = constraints.maxWidth;
          }
        }
        print(constraints.hasBoundedHeight);
        print(constraints.hasBoundedWidth);

        return Container(
          height: height ?? h,
          width: width ?? w,
          child: Container(
            child: Table(
              children: getRows(),
            ),
          ),
        );
      }),
    );
  }

  List<TableRow> getRows() {
    List<TableRow> rows = [];

    // Row
    TableRow row;
    for (var value in values) {
      // Columns
      List<LegendTableCell> columnsCells = [];
      for (var i = 0; i < value.fields.length; i++) {
        LegendTableValueType type = columnTypes[i];
        LegendTableCell cell;

        dynamic val = value.fields[i];

        switch (type) {
          case LegendTableValueType.TEXT:
            cell = LegendTableCell.text(
              typography: LegendTextStyle.h1(),
              text: val.toString(),
            );
            break;
          case LegendTableValueType.ACTION:
            cell = LegendTableCell.action(
              button: LegendButton(
                style: LegendButtonStyle.danger().style,
                text: Text(
                  val.toString(),
                ),
                onPressed: () {
                  value.actionFunction!();
                },
              ),
              color: Colors.red,
            );
            break;
          default:
            cell = LegendTableCell.text(
              typography: LegendTextStyle.h1(),
              text: val.toString(),
            );
            break;
        }
        columnsCells.add(cell);
      }

      row = new TableRow(
        children: columnsCells,
      );
      rows.add(row);
    }

    return rows;
  }
}
