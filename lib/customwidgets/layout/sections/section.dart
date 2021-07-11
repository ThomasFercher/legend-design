import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/layout/sections/sectionHeader.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/typography.dart';

class Section extends StatelessWidget {
  final List<Widget> children;
  final String header;
  final TextStyle? headerTextStyle;

  Section({
    required this.children,
    required this.header,
    this.headerTextStyle,
  });

  List<Widget> getChildren() {
    children.insert(
      0,
      SectionHeader(
        text: header,
        textStyle: headerTextStyle,
      ),
    );
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getChildren(),
      ),
    );
  }
}
