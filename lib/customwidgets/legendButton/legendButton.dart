import 'package:flutter/material.dart';

class LegendButton extends StatelessWidget {
  final ButtonStyle? style;
  final Widget text;
  final Function onPressed;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const LegendButton({
    Key? key,
    this.style,
    required this.text,
    required this.onPressed,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8.0),
          child: text,
        ),
        style: style ?? ButtonStyle(),
      ),
    );
  }
}
