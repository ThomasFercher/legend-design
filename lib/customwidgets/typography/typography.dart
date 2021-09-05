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
    this.h7 ?? LegendTextStyle.textInput();
  }
}

class LegendTextStyle extends TextStyle {
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final double? height;

  LegendTextStyle({
    required this.textColor,
    required this.backgroundColor,
    required this.fontSize,
    required this.fontWeight,
    required this.fontFamily,
    this.height,
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
      fontSize: 28,
      fontWeight: FontWeight.w300,
      fontFamily: "sans serif",
    );
  }

  factory LegendTextStyle.tableHeader() {
    return LegendTextStyle(
      textColor: Colors.grey[850]!,
      backgroundColor: Colors.transparent,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: "sans serif",
    );
  }

  factory LegendTextStyle.appBarMenuHeader() {
    return LegendTextStyle(
      textColor: Colors.grey[850]!,
      backgroundColor: Colors.transparent,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: "sans serif",
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

  factory LegendTextStyle.bottomBar() {
    return LegendTextStyle(
      textColor: Colors.black54,
      backgroundColor: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontFamily: "sans serif",
    );
  }
  factory LegendTextStyle.tag() {
    return LegendTextStyle(
      textColor: Colors.black45,
      backgroundColor: Colors.transparent,
      fontSize: 14,
      fontWeight: FontWeight.w500,
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

  factory LegendTextStyle.siderMenuCollapsed() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 10,
      fontWeight: FontWeight.w200,
      fontFamily: "Roboto",
    );
  }

  factory LegendTextStyle.sectionLink() {
    return LegendTextStyle(
      textColor: Colors.black.withOpacity(0.68),
      backgroundColor: Colors.transparent,
      fontSize: 16,
      fontWeight: FontWeight.w600,
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

  factory LegendTextStyle.textInput({
    Color? textColor,
  }) {
    return LegendTextStyle(
      textColor: textColor ?? Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 18,
      fontWeight: FontWeight.w300,
      fontFamily: "sans serif",
    );
  }

  factory LegendTextStyle.sectionHeader() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      fontFamily: "sans serif",
    );
  }

  factory LegendTextStyle.formHeader() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontFamily: "sans serif",
    );
  }
}
