import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

const Duration animationDuration = Duration(milliseconds: 500);

class LegendButtonStyle {
  final ButtonStyle style;

  LegendButtonStyle({
    required this.style,
  });

  factory LegendButtonStyle.danger() {
    return LegendButtonStyle(
      style: ButtonStyle(
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
        animationDuration: animationDuration,
      ),
    );
  }

  factory LegendButtonStyle.confirm() {
    return LegendButtonStyle(
      style: ButtonStyle(
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
        animationDuration: animationDuration,
        elevation: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return 5.0;
            } else {
              return 0.0;
            }
          },
        ),
      ),
    );
  }

  factory LegendButtonStyle.normal() {
    return LegendButtonStyle(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Colors.white),
        animationDuration: animationDuration,
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
      ),
    );
  }
}
