import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design_core/interfaces/theme_interface.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/menuDrawer/menu_drawer_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/micros/menu/menu_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/micros/sidemenu/sidemenu_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/micros/tabbar/tabbar_colors.dart';
import 'package:legend_design_core/styles/colors/subcolors/sub_colors.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/sizing/core/override.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/legend_sub_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/micros/menu/menu_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/micros/sidemenu/sidemenu_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/micros/tabbar/tabbar_sizing.dart';
import 'package:legend_design_core/styles/typography/style/typography_sizing.dart';

class AppTheme extends ThemeInterface {
  const AppTheme() : super();

  @override
  LegendColorTheme buildColorTheme() {
    return LegendColorTheme(
      themes: [
        LegendPalette(
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
        ),
        LegendPalette(
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
                    tabbarColors: TabbarColorsOverride(),
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
        ),
      ],
    );
  }

  @override
  LegendSizingTheme buildSizingTheme() {
    return LegendSizingTheme(
      defaultSizing: LegendSizing(
        custom: {
          'test': 20,
        },
        key: 720,
        elevation1: 0,
        elevation2: 1,
        elevation3: 2,
        elevation4: 4,
        iconSize1: 14,
        iconSize2: 20,
        iconSize3: 26,
        iconSize4: 32,
        radius1: 4,
        radius2: 8,
        radius3: 12,
        radius4: 16,
        spacing1: 8,
        spacing2: 16,
        spacing3: 24,
        spacing4: 32,
        subSizing: (sizing) {
          return LegendSubSizing(
            footerSizing: FooterSizing(
              height: 100,
              maxWidth: 1000,
              padding: EdgeInsets.all(24),
            ),
            siderSizing: SiderSizing(
              width: 200,
              iconSize: 24,
              spacing: 8,
              padding: EdgeInsets.all(4),
              buildComponents: (SiderSizingInfo sizing) {
                return SiderSizingComponents(
                  sideMenuSizing: SideMenuSizing(
                    borderRadius: BorderRadius.circular(12),
                    iconSize: 24,
                    itemHeight: 48,
                    spacing: 8,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                  ),
                );
              },
            ),
            typographySizing: TypographySizing(
              h0: 12,
              h1: 14,
              h2: 16,
              h3: 20,
              h4: 26,
              h5: 30,
            ),
            appBarSizing: AppBarSizing(
              appBarHeight: 80,
              contentPadding: EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              iconSize: 22,
              spacing: 12,
              logoSize: 48,
              buildComponents: (sizing) {
                return AppBarSizingComponents(
                  menuSizing: MenuSizing(
                    borderRadius: BorderRadius.circular(12),
                    iconSize: 24,
                    height: 48,
                    itemSpacing: 8,
                    spacing: 12,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                  subMenuSizing: SideMenuSizing(
                    borderRadius: BorderRadius.circular(12),
                    iconSize: 24,
                    itemHeight: 48,
                    spacing: 4,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                  tabbarSizing: TabbarSizing(
                    height: 48,
                    alignment: MainAxisAlignment.center,
                  ),
                );
              },
            ),
            menuDrawerSizing: MenuDrawerSizing(
              width: 320,
              iconSize: 24,
              itemHeight: 48,
              spacing: 8,
              itemPadding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              subMenuHeaderHeight: 48,
              subItemPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              subMenuIconSize: 12,
              buildComponents: (sizing) {
                return MenuDrawerSizingComponents(
                  sideMenuSizing: SideMenuSizing(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    iconSize: 24,
                    itemHeight: 48,
                    spacing: 12,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                );
              },
            ),
            bottomBarSizing: BottomBarSizing(
              iconSize: 24,
              height: 80,
              itemWidth: 72,
              margin: EdgeInsets.zero,
              itemPadding: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              alignment: MainAxisAlignment.spaceAround,
              showText: true,
              fillBottom: true,
              textAtBottom: true,
            ),
          );
        },
      ),
      overrides: [
        LegendSizingOverride(
          key: 480,
          spacing1: 16,
          spacing2: 12,
          subSizing: (sizing) {
            return LegendSubSizingOverride(
              typographySizing: TypographySizingOverride(
                h0: 12,
                h5: 22,
              ),
              appBarSizing: AppBarSizingOverride(
                appBarHeight: 64,
                logoSize: 40,
              ),
            );
          },
        ),
        LegendSizingOverride(
          key: 720,
          spacing1: 12,
          spacing2: 16,
          subSizing: (sizing) {
            return LegendSubSizingOverride(
              typographySizing: TypographySizingOverride(
                h0: 16,
                h5: 26,
              ),
              appBarSizing: AppBarSizingOverride(
                appBarHeight: 72,
                logoSize: 48,
              ),
            );
          },
        ),
        LegendSizingOverride(
          key: 1080,
          spacing1: 16,
          spacing2: 22,
        ),
        LegendSizingOverride(
          key: 1600,
          spacing1: 18,
          spacing2: 26,
        ),
      ],
    );
  }

  @override
  LegendTypography buildTypography() {
    return LegendTypography(
      h5: GoogleFonts.lobsterTwo(),
      h4: TextStyle(),
      h3: TextStyle(),
      h2: TextStyle(),
      h1: TextStyle(),
      h0: TextStyle(),
    );
  }
}
