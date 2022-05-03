import 'package:flutter/material.dart';
import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/colors/legend_palette.dart';
import 'package:legend_design_core/styles/colors/sub_palettes/menu_drawer_palette.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

class ColorTheme {
  static LegendPalette lightColorTheme = LegendPalette(
    primary: Colors.indigo,
    secondary: Colors.teal,
    tertiary: Colors.teal,
    foreground: [
      LegendColors.gray8,
      LegendColors.gray9,
      LegendColors.gray10,
      LegendColors.gray11,
      LegendColors.gray12,
      LegendColors.gray13,
    ],
    siderPalette: SiderPalette(
      foreground: Colors.indigo[50],
    ),
    appBarPalette: AppBarPalette(
      foreground: Colors.indigo[50],
    ),
    background: [
      LegendColors.gray2,
      LegendColors.gray4,
      LegendColors.gray5,
      LegendColors.gray8,
      LegendColors.gray9,
      LegendColors.gray10,
    ],
    error: Colors.red,
    disabled: LegendColors.gray7,
    shadow: Colors.black.withOpacity(0.5),
    selection: Colors.tealAccent[400]!,
    textOnDark: LegendColors.gray9,
    textOnLight: LegendColors.gray8,
    onPrimary: Colors.indigo[200]!,
    onSecondary: Colors.teal[200]!,
    onTertiary: Colors.teal[200]!,
    footerPalette: FooterPalette(
      background: LegendColors.gray9,
      foreground: LegendColors.gray2,
    ),
    bottomBarPalette: BottomBarPalette(
      backgroundColor: LegendColors.gray2,
      disabledColor: LegendColors.gray6,
      activeColor: Colors.indigoAccent,
    ),
    menuDrawerPalette: MenuDrawerPalette(
      background: Colors.indigo,
      background_selection: Colors.indigo[700],
      backgroundMenu: Colors.indigo[700],
      background_menu_selection: Colors.indigo[900],
      foreground: Colors.indigo[50],
    ),
  );
  static LegendPalette darkColorTheme = LegendPalette(
    primary: Colors.indigo,
    secondary: Colors.teal,
    tertiary: Colors.teal,
    foreground: [
      LegendColors.gray3,
      LegendColors.gray4,
      LegendColors.gray5,
      LegendColors.gray8,
      LegendColors.gray9,
      LegendColors.gray10,
    ],
    background: [
      LegendColors.gray9,
      LegendColors.gray8,
      LegendColors.gray7,
      LegendColors.gray6,
      LegendColors.gray5,
      LegendColors.gray4,
    ],
    siderPalette: SiderPalette(
      foreground: Colors.indigo[50],
    ),
    appBarPalette: AppBarPalette(
      foreground: Colors.indigo[50],
    ),
    error: Colors.red,
    disabled: LegendColors.gray7,
    shadow: Colors.black.withOpacity(0.5),
    selection: Colors.tealAccent[400]!,
    textOnDark: LegendColors.gray3,
    textOnLight: LegendColors.gray4,
    onPrimary: Colors.indigo[200]!,
    onSecondary: Colors.teal[200]!,
    onTertiary: Colors.teal[200]!,
    footerPalette: FooterPalette(
      background: LegendColors.gray8,
      foreground: LegendColors.gray2,
    ),
  );
}
