import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:legend_design_core/styles/theming/colors/legend_colors.dart';

class LegendTypographyColors {
  final List<Color>? textColors;
  final Color baseColor;

  LegendTypographyColors({
    this.textColors,
    required this.baseColor,
  });
}

class LegendTypographySizing {
  final double baseSize;
  final double maxSize;
  late final List<double> sizes;

  LegendTypographySizing({
    required this.baseSize,
    required this.maxSize,
  }) {
    sizes = generateSizes(baseSize, maxSize);
  }

  List<double> generateSizes(double baseSize, double maxSize) {
    List<double> sizes = [];
    double diff = 2;
    double c;

    int length = 6;

    for (var i = -1; i < length; i++) {
      if (i > 1 && i < 4) {
        diff *= 1.1;
      } else if (i >= 4) {
        List<double> fill = fillRemaining(sizes[i], maxSize, length - i);
        sizes.addAll(fill);
        break;
      }

      c = i * diff;
      sizes.add((baseSize + c).roundToDouble());
    }

    return sizes;
  }

  List<double> fillRemaining(double currentSize, double maxSize, int steps) {
    List<double> sizes = [];
    double diff = maxSize - currentSize;

    double increment = diff / steps;

    for (var i = 1; i <= steps; i++) {
      sizes.add((currentSize + increment * i).roundToDouble());
    }

    return sizes;
  }
}

class LegendTypography {
  late final LegendTypographySizing? sizing;
  late final LegendTypographyColors? colors;
  late final TextStyle baseTextStyle;
  late final TextStyle h0;
  late final TextStyle h1;
  late final TextStyle h2;
  late final TextStyle h3;
  late final TextStyle h4;
  late final TextStyle h5;
  late final TextStyle h6;

  LegendTypography.applyStyles({
    required LegendTypographySizing sizing,
    required LegendTypographyColors colors,
    required LegendTypography typography,
  }) {
    this.sizing = sizing;
    this.colors = colors;

    h0 = typography.h0.copyWith(
      color: colors.baseColor,
      fontSize: sizing.sizes[0],
    );
    h1 = typography.h1.copyWith(
      color: colors.baseColor,
      fontSize: sizing.sizes[1],
    );
    h2 = typography.h2.copyWith(
      color: colors.baseColor,
      fontSize: sizing.sizes[2],
    );
    h3 = typography.h3.copyWith(
      color: colors.baseColor,
      fontSize: sizing.sizes[3],
    );
    h4 = typography.h4.copyWith(
      color: colors.baseColor,
      fontSize: sizing.sizes[4],
    );
    h5 = typography.h5.copyWith(
      color: colors.baseColor,
      fontSize: sizing.sizes[5],
    );
    h6 = typography.h6.copyWith(
      color: colors.baseColor,
      fontSize: typography.h6.fontSize ?? sizing.sizes[6],
    );
  }

  LegendTypography({
    this.sizing,
    this.colors,
    TextStyle? base,
    TextStyle? h0,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? h6,
  }) {
    baseTextStyle = base ?? TextStyle();
    this.h0 = h0 ?? LegendTextStyle.generateFrom(style: baseTextStyle);
    this.h1 = h1 ?? LegendTextStyle.generateFrom(style: baseTextStyle);
    this.h2 = h2 ?? LegendTextStyle.generateFrom(style: baseTextStyle);
    this.h3 = h3 ?? LegendTextStyle.generateFrom(style: baseTextStyle);
    this.h4 = h4 ?? LegendTextStyle.generateFrom(style: baseTextStyle);
    this.h5 = h5 ?? LegendTextStyle.generateFrom(style: baseTextStyle);
    this.h6 = h6 ?? LegendTextStyle.generateFrom(style: baseTextStyle);
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

  factory LegendTextStyle.copyFrom(TextStyle style) {
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

  factory LegendTextStyle.generateFrom({
    required TextStyle style,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return LegendTextStyle(
      textColor: style.color,
      backgroundColor: Colors.transparent, //style.backgroundColor,
      fontSize: fontSize ?? style.fontSize,
      fontWeight: fontWeight ?? style.fontWeight,
      fontFamily: style.fontFamily,
      height: style.height,
      letterSpacing: style.letterSpacing,
      wordSpacing: style.wordSpacing,
      textOverflow: style.overflow,
    );
  }
/*
  factory LegendTextStyle.h0() {
    return LegendTextStyle.copyFrom(
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

  factory LegendTextStyle.h1() {
    return LegendTextStyle.copyFrom(
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
  }*/
}
