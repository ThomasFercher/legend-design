import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendRowValue.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTable.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTableCell.dart';
import '../customwidgets/layout/legendScaffold.dart';
import '../styles/layoutType.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      contentBuilder: (context) {
        return Column(
          children: [
            LegendTable(
              columnTypes: [
                LegendTableValueType.TEXT,
                LegendTableValueType.TEXT,
                LegendTableValueType.ACTION,
              ],
              values: [
                LegendRowValue(
                    fields: ["test", "tata", "delete"],
                    actionFunction: () {
                      print("hello");
                    }),
                LegendRowValue(
                    fields: ["test", "tata", "delete"],
                    actionFunction: () {
                      print("hello");
                    }),
                LegendRowValue(
                    fields: ["test", "tata", "delete"],
                    actionFunction: () {
                      print("hello");
                    }),
              ],
            ),
          ],
        );
      },
      pageName: "About",
      layoutType: LayoutType.FixedSider,
    );
  }
}
