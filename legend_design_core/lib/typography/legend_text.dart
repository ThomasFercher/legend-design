import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LegendText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final bool? selectable;
  final TextAlign? textAlign;
  final EdgeInsets? padding;

  LegendText({
    required this.text,
    this.selectable,
    this.textStyle,
    this.textAlign,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      height: textStyle?.height,
      child: kIsWeb && (selectable ?? false) ? webText() : normalText(),
    );
  }

  Widget webText() {
    return SelectableText(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }

  Widget normalText() {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
