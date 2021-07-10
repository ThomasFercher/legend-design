import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendRowValue.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTable.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTableCell.dart';
import 'package:webstore/customwidgets/layout/legendGridSize.dart';
import 'package:webstore/customwidgets/layout/sections/gridChild.dart';
import 'package:webstore/customwidgets/layout/sections/gridSection.dart';
import 'package:webstore/customwidgets/layout/sections/section.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/legendButton/legendButtonStyle.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/typography.dart';
import '../customwidgets/layout/legendScaffold.dart';
import '../styles/layoutType.dart';

class WidgetComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      contentBuilder: (context) {
        return Container(
          child: Column(
            children: [
              Section(
                header: "Buttons",
                children: [
                  Container(
                    height: 100,
                    color: Colors.red,
                  ),
                ],
              ),
              GridSection(
                header: "Buttons",
                sizes: LegendGridSize(
                  small: LegendGridSizeInfo(1, 800),
                  medium: LegendGridSizeInfo(3, 160),
                  large: LegendGridSizeInfo(4, 80),
                  xxl: LegendGridSizeInfo(4, 80),
                ),
                children: [
                  LegendButton(
                    margin: EdgeInsets.all(16),
                    text: LegendText(
                      text: "Alert",
                    ),
                    onPressed: () => {},
                    style: LegendButtonStyle.danger(),
                  ),
                  LegendButton(
                    margin: EdgeInsets.all(16),
                    text: LegendText(
                      text: "Sucess",
                    ),
                    onPressed: () => {},
                    style: LegendButtonStyle.confirm(),
                  ),
                  LegendButton(
                    margin: EdgeInsets.all(16),
                    text: LegendText(
                      text: "Info",
                    ),
                    onPressed: () => {},
                    style: LegendButtonStyle.normal(),
                  ),
                  LegendButton(
                    margin: EdgeInsets.all(16),
                    text: LegendText(text: "Gradient"),
                    onPressed: () => {},
                    style: LegendButtonStyle.gradient(
                      [
                        Colors.red[200]!,
                        Colors.redAccent,
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      pageName: "Widget Components",
      layoutType: LayoutType.FixedHeaderSider,
    );
  }
}
