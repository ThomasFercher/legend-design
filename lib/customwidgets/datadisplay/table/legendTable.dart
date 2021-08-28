import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendRowValue.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTableCell.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTableRow.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/legendButton/legendButtonStyle.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/legendColorTheme.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/customwidgets/typography/typography.dart';

class LegendTable extends StatelessWidget {
  final double? height;
  final double? width;
  final List<LegendTableValueType> columnTypes;
  final List<LegendRowValue> values;
  final String? header;
  final double? rowHeight;

  const LegendTable({
    Key? key,
    this.height,
    this.width,
    this.header,
    required this.columnTypes,
    required this.values,
    this.rowHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = 0;
    double w = width ?? MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (header != null)
            Container(
              width: w,
              height: rowHeight ?? 48,
              color: LegendColorTheme.darken(
                Colors.white,
                0.16,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.centerLeft,
              child: LegendText(
                text: header!,
                textStyle: LegendTextStyle.tableHeader(),
              ),
            ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: getRows(),
          ),
        ],
      ),
    );
  }

  List<TableRow> getRows() {
    List<TableRow> rows = [];

    // Row
    TableRow row;
    for (var j = 0; j < values.length; j++) {
      var value = values[j];
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
                style: LegendButtonStyle.danger(),
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
          case LegendTableValueType.TAG:
            cell = LegendTableCell.tag(
              color: Colors.red,
              tags: val,
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
        children: [
          LegendTableRow(columnsCells: columnsCells, height: rowHeight ?? 48),
        ],
        decoration: BoxDecoration(
          border: j % 2 == 0
              ? Border.symmetric(
                  horizontal: BorderSide(
                    color: LegendColorTheme.darken(
                      Colors.white,
                      0.24,
                    ),
                    width: 2,
                  ),
                )
              : null,
        ),
      );
      rows.add(row);
    }

    return rows;
  }
}
