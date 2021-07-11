import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LegendText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final bool? selectable;

  LegendText({
    required this.text,
    this.selectable,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textStyle?.height,
      child: kIsWeb && (selectable ?? true) ? webText() : normalText(),
    );
  }

  webText() {
    return SelectableText(text, style: textStyle);
  }

  normalText() {
    return Text(text, style: textStyle);
  }
}
