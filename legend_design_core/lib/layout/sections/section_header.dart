import 'package:flutter/material.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';

import 'package:provider/provider.dart';

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
              color: Provider.of<ThemeProvider>(context).colors.textColorDark,
            ),
      ),
    );
  }
}
