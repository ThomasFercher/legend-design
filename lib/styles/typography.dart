import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LegendTypography {
  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? h3;
  final TextStyle? h4;
  final TextStyle? h5;
  final TextStyle? h6;
  final TextStyle? h7;

  LegendTypography({
    this.h1,
    this.h2,
    this.h3,
    this.h4,
    this.h5,
    this.h6,
    this.h7,
  }) {
    this.h1 ?? LegendTextStyle.h1();
    this.h2 ?? LegendTextStyle.h2();
    this.h3 ?? LegendTextStyle.h3();
    this.h4 ?? LegendTextStyle.h4();
    this.h5 ?? LegendTextStyle.h5();
    this.h6 ?? LegendTextStyle.h6();
    this.h7 ?? LegendTextStyle.h7();
  }
}

class LegendTextStyle extends TextStyle {
  final TextStyle? style;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;

  LegendTextStyle({
    required this.textColor,
    required this.backgroundColor,
    required this.fontSize,
    required this.fontWeight,
    required this.fontFamily,
    this.style,
  }) : super(
          color: textColor,
          backgroundColor: backgroundColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
        );

  factory LegendTextStyle.h1() {
    return LegendTextStyle(
      textColor: Colors.grey[850]!,
      backgroundColor: Colors.transparent,
      fontSize: 22,
      fontWeight: FontWeight.w200,
      fontFamily: "Roboto",
    );
  }

  factory LegendTextStyle.h2() {
    return LegendTextStyle(
      textColor: Colors.black54,
      backgroundColor: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: "sans serif",
    );
  }

  factory LegendTextStyle.h3() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: "sans serif",
    );
  }

  factory LegendTextStyle.h4() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: "sans serif",
    );
  }

  factory LegendTextStyle.h5() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 12,
      fontWeight: FontWeight.w200,
      fontFamily: "Roboto",
    );
  }

  factory LegendTextStyle.h6() {
    return LegendTextStyle(
      textColor: Colors.white,
      backgroundColor: Colors.transparent,
      fontSize: 24.0,
      fontWeight: FontWeight.w300,
      fontFamily: "Roboto",
    );
  }

  factory LegendTextStyle.h7() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: "sans serif",
    );
  }
}
