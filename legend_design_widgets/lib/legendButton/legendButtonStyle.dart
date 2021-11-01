import 'package:flutter/material.dart';

/*
LegendButtonStyle has all the same Properties as ButtonStyle.
There are factory constructors which give a few prebuilt ButtonStyles.

*/

/*
  Constant Values which will be used for the factory Constructors
*/
const Duration legendAnimationDuration = Duration(milliseconds: 500);
const Radius legendBorderRadius = Radius.circular(20);
BoxShadow legendBoxShadow = BoxShadow(
  color: Colors.pink.withOpacity(0.2),
  spreadRadius: 4,
  blurRadius: 10,
  offset: Offset(0, 3),
);

class LegendButtonStyle extends ButtonStyle {
  final MaterialStateProperty<TextStyle?>? textStyle;
  final MaterialStateProperty<Color?>? backgroundColor;
  final MaterialStateProperty<Color?>? foregroundColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final MaterialStateProperty<Color?>? shadowColor;
  final MaterialStateProperty<double?>? elevation;
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
  final MaterialStateProperty<Size?>? minimumSize;
  final MaterialStateProperty<Size?>? fixedSize;
  final MaterialStateProperty<BorderSide?>? side;
  final MaterialStateProperty<MouseCursor?>? mouseCursor;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? tapTargetSize;
  final Duration? animationDuration;
  final bool? enableFeedback;
  final AlignmentGeometry? alignment;
  final InteractiveInkFeatureFactory? splashFactory;
  final Radius? borderRadius;
  final Gradient? backgroundGradient;
  final BoxShadow? boxShadow;
  final double? height;
  final double? width;

  LegendButtonStyle({
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.overlayColor,
    this.shadowColor,
    this.elevation,
    this.padding,
    this.minimumSize,
    this.fixedSize,
    this.side,
    this.mouseCursor,
    this.visualDensity,
    this.tapTargetSize,
    this.animationDuration,
    this.enableFeedback,
    this.alignment,
    this.splashFactory,
    this.borderRadius,
    this.backgroundGradient,
    this.boxShadow,
    this.height,
    this.width,
  }) : super(
          alignment: alignment,
          animationDuration: animationDuration,
          backgroundColor: backgroundColor,
          elevation: elevation,
          enableFeedback: enableFeedback,
          fixedSize: fixedSize,
          foregroundColor: foregroundColor,
          minimumSize: minimumSize,
          mouseCursor: mouseCursor,
          overlayColor: overlayColor,
          padding: padding,
          shadowColor: shadowColor,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                borderRadius ?? Radius.zero,
              ),
            ),
          ),
          side: side,
          splashFactory: splashFactory,
          tapTargetSize: tapTargetSize,
          textStyle: textStyle,
          visualDensity: visualDensity,
        );

  factory LegendButtonStyle.gradient(List<Color> colors,
      {double? height, double? width}) {
    return LegendButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return Colors.transparent;
        },
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      animationDuration: legendAnimationDuration,
      borderRadius: legendBorderRadius,
      backgroundGradient: LinearGradient(
        colors: colors,
      ),
      elevation: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return 4.0;
        } else {
          return 0;
        }
      }),
      shadowColor: MaterialStateProperty.all(
        legendBoxShadow.color.withOpacity(0.4),
      ),
      boxShadow: legendBoxShadow,
      height: height,
      width: width,
    );
  }

  factory LegendButtonStyle.danger({double? height, double? width}) {
    return LegendButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.red;
          } else {
            return Colors.red[700];
          }
        },
      ),
      minimumSize: width != null && height != null
          ? MaterialStateProperty.all(Size(width, height))
          : null,
      foregroundColor: MaterialStateProperty.all(Colors.white),
      animationDuration: legendAnimationDuration,
      height: height,
      width: width,
    );
  }

  factory LegendButtonStyle.confirm({double? height, double? width}) {
    return LegendButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.blueAccent;
          } else {
            return Colors.blueAccent[700];
          }
        },
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      animationDuration: legendAnimationDuration,
      minimumSize: width != null && height != null
          ? MaterialStateProperty.all(Size(width, height))
          : null,
      elevation: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return 5.0;
          } else {
            return 0.0;
          }
        },
      ),
      borderRadius: legendBorderRadius,
      height: height,
      width: width,
    );
  }

  factory LegendButtonStyle.normal({
    double? height,
    double? width,
    Radius? borderRadius,
  }) {
    return LegendButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.white),
      animationDuration: legendAnimationDuration,
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.blueAccent;
          } else {
            return Colors.black87;
          }
        },
      ),
      fixedSize: width != null && height != null
          ? MaterialStateProperty.all(Size(width, height))
          : null,
      borderRadius: borderRadius ?? Radius.circular(4),
      side: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return BorderSide(
              color: Colors.blueAccent,
            );
          } else {
            return BorderSide(
              color: Colors.black12,
            );
          }
        },
      ),
      height: height,
      width: width,
    );
  }

  @override
  LegendButtonStyle copyWith({
    AlignmentGeometry? alignment,
    Duration? animationDuration,
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<double?>? elevation,
    bool? enableFeedback,
    MaterialStateProperty<Size?>? fixedSize,
    MaterialStateProperty<Color?>? foregroundColor,
    MaterialStateProperty<Size?>? minimumSize,
    MaterialStateProperty<MouseCursor?>? mouseCursor,
    MaterialStateProperty<Color?>? overlayColor,
    MaterialStateProperty<EdgeInsetsGeometry?>? padding,
    MaterialStateProperty<Color?>? shadowColor,
    MaterialStateProperty<OutlinedBorder?>? shape,
    MaterialStateProperty<BorderSide?>? side,
    InteractiveInkFeatureFactory? splashFactory,
    MaterialTapTargetSize? tapTargetSize,
    MaterialStateProperty<TextStyle?>? textStyle,
    VisualDensity? visualDensity,
    MaterialStateProperty<Size?>? maximumSize,
  }) {
    return LegendButtonStyle(
      alignment: alignment,
      animationDuration: animationDuration,
      backgroundColor: backgroundColor,
      elevation: elevation,
      enableFeedback: enableFeedback,
      fixedSize: fixedSize,
      foregroundColor: foregroundColor,
      minimumSize: minimumSize,
      mouseCursor: mouseCursor,
      overlayColor: overlayColor,
      padding: padding,
      shadowColor: shadowColor,
      side: side,
      splashFactory: splashFactory,
      tapTargetSize: tapTargetSize,
      textStyle: textStyle,
      visualDensity: visualDensity,
    );
  }
}
