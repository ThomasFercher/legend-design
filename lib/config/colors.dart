import 'package:flutter/material.dart';
import 'package:legend_design_core/interfaces/color_delegate.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/colors/legend_palette.dart';
import 'package:legend_design_core/styles/colors/subcolors/appbar/appBar_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/footer/footer_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/menuDrawer/menu_drawer_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/micros/menu/menu_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/micros/sidemenu/sidemenu_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/micros/tabbar/tabbar_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/sider/sider_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/sub_colors.dart';

class AppColors extends ColorsDelegate {
  @override
  Map<String, LegendPalette>? get customThemes => null;

  @override
  LegendPalette get darkTheme {
    return LegendPalette(
      primary: Colors.indigo[800]!,
      secondary: Colors.teal[600]!,
      tertiary: Colors.teal,
      foreground1: LegendColors.gray5,
      foreground2: LegendColors.gray5,
      foreground3: LegendColors.gray4,
      foreground4: LegendColors.gray4,
      foreground5: LegendColors.gray3,
      background1: LegendColors.gray12,
      background2: LegendColors.gray11,
      background3: LegendColors.gray10,
      background4: LegendColors.gray9,
      background5: LegendColors.gray8,
      error: Colors.red,
      disabled: LegendColors.gray7,
      selection: Colors.tealAccent[400]!,
      onPrimary: Colors.indigo[200]!,
      onSecondary: Colors.teal[200]!,
      onTertiary: Colors.teal[200]!,
      custom: {
        "test": Colors.red,
      },
      subcolors: (colors) {
        return LegendSubColors(
          appBar: AppBarColorsOverride(
            background: colors.primary,
            foreground: Colors.indigo[50],
            buildComponents: (_colors) {
              return AppBarColorsComponentsOverride(
                menuColors: MenuColorsOverride(
                  foreground: colors.foreground3,
                ),
                subMenuColors: SideMenuColorsOverride(
                  background: colors.background3,
                  menuBackground: colors.background3,
                ),
                tabbarColors: TabbarColorsOverride(
                  background: colors.background2,
                  foreground: colors.foreground1,
                  selection: colors.primary.lighten(0.2),
                ),
              );
            },
          ),
          sider: SiderColorsOverride(
            background: colors.primary,
            backgroundMenu: colors.primary,
            foreground: colors.foreground1,
            buildComponents: (_colors) {
              return SiderColorsComponentsOverride(
                menuColors: SideMenuColorsOverride(
                  background: colors.primary.lighten(0.05),
                  menuBackground: colors.primary,
                  //foreground: colors.b,
                  activeBackground: colors.onPrimary.lighten(),
                  activeForeground: colors.selection,
                ),
              );
            },
          ),
          menuDrawer: MenuDrawerColorsOverride(
            background: colors.background1,
            backgroundMenu: Colors.black,
            foreground: colors.onPrimary,
            backgroundSelection: colors.secondary,
            backgroundMenuSelection: colors.primary,
            buildComponents: (sizing) {
              return MenuDrawerColorsComponentsOverride(
                menuColors: SideMenuColorsOverride(
                  background: colors.background3,
                  menuBackground: colors.background1,
                  foreground: colors.foreground1,
                ),
              );
            },
          ),
          footer: FooterColorsOverride(
            background: colors.background4,
            foreground: colors.foreground3,
          ),
        );
      },
    );
  }

  @override
  LegendPalette get lightTheme {
    return LegendPalette(
      primary: Colors.indigo,
      secondary: Colors.teal,
      tertiary: Colors.teal,
      foreground1: LegendColors.gray10,
      foreground2: LegendColors.gray10,
      foreground3: LegendColors.gray11,
      foreground4: LegendColors.gray11,
      foreground5: LegendColors.gray12,
      background1: LegendColors.gray2,
      background2: LegendColors.gray3,
      background3: LegendColors.gray4,
      background4: LegendColors.gray6,
      background5: LegendColors.gray8,
      error: Colors.redAccent,
      disabled: LegendColors.gray7,
      selection: Colors.tealAccent[400]!,
      onPrimary: Colors.indigo[400]!,
      onSecondary: Colors.teal[200]!,
      onTertiary: Colors.teal[200]!,
      custom: {
        "test": Colors.red,
      },
      subcolors: (colors) {
        return LegendSubColors(
          appBar: AppBarColorsOverride(
            background: colors.primary,
            foreground: Colors.indigo[50],
            buildComponents: (_colors) {
              return AppBarColorsComponentsOverride(
                menuColors: MenuColorsOverride(
                  foreground: colors.background1,
                ),
                subMenuColors: SideMenuColorsOverride(
                  background: colors.background1,
                  menuBackground: colors.background1,
                ),
                tabbarColors: TabbarColorsOverride(),
              );
            },
          ),
          sider: SiderColorsOverride(
            background: colors.primary,
            buildComponents: (_colors) {
              return SiderColorsComponentsOverride(
                menuColors: SideMenuColorsOverride(
                  background: colors.primary.lighten(0.05),
                  menuBackground: colors.primary,
                  foreground: colors.background1,
                  activeBackground: colors.onPrimary.lighten(),
                  activeForeground: colors.selection,
                ),
              );
            },
          ),
          menuDrawer: MenuDrawerColorsOverride(
            background: colors.background1,
            backgroundMenu: Colors.black,
            foreground: colors.onPrimary,
            backgroundSelection: colors.secondary,
            backgroundMenuSelection: colors.primary,
            buildComponents: (sizing) {
              return MenuDrawerColorsComponentsOverride(
                menuColors: SideMenuColorsOverride(
                  background: colors.background3,
                  menuBackground: colors.background1,
                  foreground: colors.foreground1,
                ),
              );
            },
          ),
          footer: FooterColorsOverride(
            background: colors.foreground1,
            foreground: colors.background1,
          ),
        );
      },
    );
  }
}
