import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:legend_design_core/styles/theming/colors/legend_colors.dart';

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
    h1 ?? LegendTextStyle.h1();
    h2 ?? LegendTextStyle.h2();
    h3 ?? LegendTextStyle.h3();
    h4 ?? LegendTextStyle.h4();
    h5 ?? LegendTextStyle.h5();
    h6 ?? LegendTextStyle.h6();
    h7 ?? LegendTextStyle.textInput();
  }
}

class LegendTextStyle extends TextStyle {
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? height;
  final double? wordSpacing;
  final double? letterSpacing;
  final TextOverflow? textOverflow;

  LegendTextStyle({
    this.textColor,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.height,
    this.letterSpacing,
    this.wordSpacing,
    this.textOverflow,
  }) : super(
          color: textColor,
          backgroundColor: backgroundColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          wordSpacing: wordSpacing,
          letterSpacing: letterSpacing,
          overflow: textOverflow,
          height: height,
        );

  factory LegendTextStyle.fromGoogleFonts(TextStyle style) {
    return LegendTextStyle(
      textColor: style.color,
      backgroundColor: style.backgroundColor,
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      fontFamily: style.fontFamily,
      height: style.height,
      letterSpacing: style.letterSpacing,
      wordSpacing: style.wordSpacing,
      textOverflow: style.overflow,
    );
  }

  factory LegendTextStyle.h1() {
    return LegendTextStyle.fromGoogleFonts(
      GoogleFonts.lobsterTwo(
        color: Colors.tealAccent[700]!,
        backgroundColor: Colors.transparent,
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        wordSpacing: 0,
      ),
    );
  }
  factory LegendTextStyle.tableHeader() {
    return LegendTextStyle(
      textColor: Colors.grey[850]!,
      backgroundColor: Colors.transparent,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: 'sans serif',
    );
  }

  factory LegendTextStyle.appBarMenuHeader() {
    return LegendTextStyle(
      textColor: Colors.grey[850]!,
      backgroundColor: Colors.transparent,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: 'sans serif',
    );
  }

  factory LegendTextStyle.h2() {
    return LegendTextStyle(
      textColor: Colors.black54,
      backgroundColor: Colors.transparent,
      fontSize: 24,
      fontWeight: FontWeight.w300,
      fontFamily: 'sans serif',
    );
  }

  factory LegendTextStyle.p() {
    return LegendTextStyle(
      textColor: LegendColors.gray6,
      backgroundColor: Colors.transparent,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'sans serif',
      letterSpacing: 0.4,
      wordSpacing: 0.4,
    );
  }

  factory LegendTextStyle.h3() {
    return LegendTextStyle(
      textColor: LegendColors.gray10,
      backgroundColor: Colors.transparent,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'sans serif',
    );
  }

  factory LegendTextStyle.h4() {
    return LegendTextStyle(
      textColor: Colors.grey[100]!,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'sans serif',
      backgroundColor: Colors.transparent,
    );
  }

  factory LegendTextStyle.bottomBar() {
    return LegendTextStyle(
      textColor: Colors.black54,
      backgroundColor: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'sans serif',
    );
  }
  factory LegendTextStyle.tag() {
    return LegendTextStyle(
      textColor: Colors.black45,
      backgroundColor: Colors.transparent,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'sans serif',
    );
  }

  factory LegendTextStyle.h5() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 12,
      fontWeight: FontWeight.w200,
      fontFamily: 'Roboto',
    );
  }

  factory LegendTextStyle.siderMenuCollapsed() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 10,
      fontWeight: FontWeight.w200,
      fontFamily: 'Roboto',
    );
  }

  factory LegendTextStyle.sectionLink() {
    return LegendTextStyle(
      textColor: Colors.teal[50]!,
      backgroundColor: Colors.transparent,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto',
    );
  }

  factory LegendTextStyle.h6() {
    return LegendTextStyle(
      textColor: Colors.white,
      backgroundColor: Colors.transparent,
      fontSize: 24.0,
      fontWeight: FontWeight.w300,
      fontFamily: 'Roboto',
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
      fontFamily: 'sans serif',
    );
  }

  factory LegendTextStyle.sectionHeader() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'sans serif',
    );
  }

  factory LegendTextStyle.formHeader() {
    return LegendTextStyle(
      textColor: Colors.black87,
      backgroundColor: Colors.transparent,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontFamily: 'sans serif',
    );
  }
}
