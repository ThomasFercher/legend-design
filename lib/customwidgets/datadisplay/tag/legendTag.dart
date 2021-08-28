import 'package:flutter/cupertino.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/styles/legendColorTheme.dart';
import 'package:webstore/styles/legendColors.dart';

class LegendTag extends StatelessWidget {
  final Color color;
  final String text;
  final bool? dissmissable;

  const LegendTag({
    required this.color,
    required this.text,
    this.dissmissable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: LegendColorTheme.lighten(color, 0.25),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: LegendText(
        text: text,
        textStyle: LegendTextStyle.tag().copyWith(
          color: color,
          fontSize: 16,
        ),
      ),
    );
  }
}
