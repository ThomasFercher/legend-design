import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/sections/sectionHeader.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/legendColorTheme.dart';
import 'package:webstore/styles/legendTheme.dart';
import 'package:webstore/styles/typography.dart';

class Section extends StatelessWidget {
  final List<Widget> children;
  final String header;
  final TextStyle? headerTextStyle;
  final double? verticalSpacing;

  Section({
    required this.children,
    required this.header,
    this.headerTextStyle,
    this.verticalSpacing,
  });

  List<Widget> getChildren() {
    children.insert(
      0,
      SectionHeader(
        text: header,
        textStyle: headerTextStyle,
      ),
    );
    if (verticalSpacing != null) {
      for (var i = 1; i < children.length; i += 2) {
        children.insert(
            i,
            Padding(
              padding: EdgeInsets.only(top: verticalSpacing!),
            ));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    LegendColorTheme colors = Provider.of<LegendTheme>(context).colors;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
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
          children: getChildren(),
        ),
      );
    });
  }
}
