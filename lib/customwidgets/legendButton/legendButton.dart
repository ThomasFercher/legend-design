import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/legendButton/legendButtonStyle.dart';

class LegendButton extends StatelessWidget {
  final LegendButtonStyle? style;
  final Widget text;
  final Function onPressed;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;

  const LegendButton({
    Key? key,
    this.style,
    required this.text,
    required this.onPressed,
    this.margin,
    this.padding,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Container(
          width: width,
          padding: padding ??
              const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(style?.borderRadius ?? Radius.circular(0)),
            gradient: style?.backgroundGradient,
            boxShadow: style?.boxShadow == null
                ? []
                : [
                    style?.boxShadow ?? BoxShadow(),
                  ],
          ),
          child: text,
        ),
        style: style ?? ButtonStyle(),
      ),
    );
  }
}
