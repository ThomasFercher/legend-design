import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/legendButton/legendButtonStyle.dart';

class LegendButton extends StatelessWidget {
  final LegendButtonStyle? style;
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
    return LayoutBuilder(builder: (context, constraints) {
      double? height = style?.height;
      double? width = style?.width;
      double? v;
      double? w;
      if (constraints.maxHeight == double.infinity) {
        v = margin?.vertical ?? 8.0;
      } else {
        v = height != null ? (constraints.maxHeight - height) / 2 : null;
      }

      w = width != null ? (constraints.maxWidth - width) / 2 : null;

      return Container(
        height: constraints.maxHeight == double.infinity
            ? null
            : constraints.maxHeight,
        width: constraints.maxWidth == double.infinity
            ? null
            : constraints.maxWidth,
        constraints: height != null ? BoxConstraints(maxHeight: height) : null,
        padding: EdgeInsets.symmetric(
          vertical: v ?? 8.0,
          horizontal: w ?? 8.0,
        ),
        child: TextButton(
          onPressed: () => onPressed(),
          child: Container(
            width: width,
            height: height,
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
    });
  }
}
