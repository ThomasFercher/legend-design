import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/sections/sectionHeader.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/legendColorTheme.dart';
import 'package:webstore/styles/legendTheme.dart';
import 'package:webstore/customwidgets/typography/typography.dart';

class Section extends StatelessWidget {
  final String? name;
  final List<Widget> children;
  final String header;
  final TextStyle? headerTextStyle;
  final double? verticalSpacing;
  final double? margin;

  Section({
    required this.children,
    required this.header,
    this.name,
    this.headerTextStyle,
    this.verticalSpacing,
    this.margin,
  });

  List<Widget> getWidgets() {
    List<Widget> widgets = [
      SectionHeader(
        text: header,
        textStyle: headerTextStyle,
      ),
    ];
    widgets.addAll(children);
    if (verticalSpacing != null) {
      for (var i = 1; i < widgets.length; i += 2) {
        widgets.insert(
          i,
          Padding(
            padding: EdgeInsets.only(top: verticalSpacing!),
          ),
        );
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    LegendColorTheme colors = Provider.of<LegendTheme>(context).colors;

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.all(margin ?? 12.0),
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 24),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.06),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          width: constraints.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getWidgets(),
          ),
        ),
      );
    });
  }
}
