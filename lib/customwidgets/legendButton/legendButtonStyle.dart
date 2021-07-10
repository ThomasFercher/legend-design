import 'package:flutter/material.dart';

/*
LegendButtonStyle has all the same Properties as ButtonStyle.
There are factory constructors which give a few prebuilt ButtonStyles.

*/

/*
  Constant Values which will be used for the factory Constructors
*/
const Duration legendAnimationDuration = Duration(milliseconds: 500);

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
  final MaterialStateProperty<OutlinedBorder?>? shape;
  final MaterialStateProperty<MouseCursor?>? mouseCursor;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? tapTargetSize;
  final Duration? animationDuration;
  final bool? enableFeedback;
  final AlignmentGeometry? alignment;
  final InteractiveInkFeatureFactory? splashFactory;

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
    this.shape,
    this.mouseCursor,
    this.visualDensity,
    this.tapTargetSize,
    this.animationDuration,
    this.enableFeedback,
    this.alignment,
    this.splashFactory,
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
          shape: shape,
          side: side,
          splashFactory: splashFactory,
          tapTargetSize: tapTargetSize,
          textStyle: textStyle,
          visualDensity: visualDensity,
        );

  factory LegendButtonStyle.danger() {
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
      foregroundColor: MaterialStateProperty.all(Colors.white),
      animationDuration: legendAnimationDuration,
    );
  }

  factory LegendButtonStyle.confirm() {
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
      elevation: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.hovered)) {
            return 5.0;
          } else {
            return 0.0;
          }
        },
      ),
    );
  }

  factory LegendButtonStyle.normal() {
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
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
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
    );
  }
}
