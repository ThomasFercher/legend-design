import 'package:flutter/material.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';

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

      bool vertical = constraints.maxHeight == double.infinity;
      bool horizontal = constraints.maxWidth == double.infinity;

      if (style?.height == null ||
          (style?.height ?? 0) > constraints.maxHeight) {
        height = vertical ? 48 : constraints.maxHeight;
      }

      if (style?.width == null || (style?.width ?? 0) > constraints.maxWidth) {
        width = horizontal ? 64 : constraints.maxWidth;
      }

      return Container(
        padding: margin,
        constraints: BoxConstraints(
          minHeight: height ?? 48,
        ),
        child: TextButton(
          onPressed: () => onPressed(),
          child: Container(
            width: width,
            height: height,
            padding: padding,
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
