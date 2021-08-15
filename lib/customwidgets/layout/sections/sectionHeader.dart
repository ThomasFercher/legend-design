import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';

class SectionHeader extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const SectionHeader({Key? key, required this.text, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 4.0),
      child: LegendText(
        text: text,
        textStyle: textStyle ?? LegendTextStyle.sectionHeader(),
      ),
    );
  }
}
