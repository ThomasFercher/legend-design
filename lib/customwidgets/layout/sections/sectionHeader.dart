import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/styles/theming/legendTheme.dart';

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
        textStyle: textStyle ??
            LegendTextStyle.sectionHeader().copyWith(
              color: Provider.of<LegendTheme>(context).colors.textColorDark,
            ),
      ),
    );
  }
}
