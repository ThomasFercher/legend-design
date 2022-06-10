import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design_core/interfaces/theme_interface.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/colors/legend_palette.dart';
import 'package:legend_design_core/styles/colors/sub_palettes/menu_drawer_palette.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/footer_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/menu_drawer_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/sider_sizing.dart';
import 'package:legend_design_core/styles/typography/typography.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_router/router/legend_router.dart';

import 'global_widgets.dart';

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
        ),
        LegendPalette(
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
          bottomBarPalette: BottomBarPalette(
            backgroundColor: LegendColors.gray3,
          ),
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
        )
      ],
    );
  }

  @override
  LegendSizingTheme buildSizingTheme() {
    return LegendSizingTheme(
      defaultSizing: LegendSizing(
        key: 720,
        footerSizing: FixedFooterSizing(
          height: 100,
          maxWidth: 1000,
          padding: EdgeInsets.all(24),
        ),
        siderSizing: SiderSizing(
          width: 200,
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
          horizontalPadding: 12,
        ),
        elevations: [0, 1, 2, 4],
        typographySizing: TypographySizing(baseSize: 12, maxSize: 36),
        borderRadius: [
          BorderRadius.all(
            Radius.circular(16.0),
          ),
          BorderRadius.all(
            Radius.circular(12.0),
          ),
        ],
        borderInset: [
          16,
          12,
        ],
        padding: [
          12,
          16,
          24,
        ],
        appBarSizing: AppBarSizing(
          appBarHeight: 80,
          contentPadding: EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          iconSize: 22,
          spacing: 12,
          logoSize: 48,
        ),
        iconSizes: [28, 24, 22, 18],
        menuDrawerSizing: MenuDrawerSizing(
          width: 200,
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
      ),
      overrides: [
        LegendSizingOverride(
          key: 480,
          sider: SiderSizingOverride(
            width: 200,
          ),
        ),
        LegendSizingOverride(
          key: 720,
          sider: SiderSizingOverride(
            width: 160,
          ),
          appBar: AbbBarSizingOverride(
            appBarHeight: 60,
          ),
        ),
        LegendSizingOverride(
          key: 1080,
          sider: SiderSizingOverride(
            width: 200,
          ),
        ),
        LegendSizingOverride(
          key: 1600,
          sider: SiderSizingOverride(
            width: 240,
          ),
        ),
      ],
    );
  }

  @override
  LegendTypography buildTypography() {
    return LegendTypography(
      //   base: GoogleFonts.nunito(),
      h6: GoogleFonts.lobsterTwo(),
    );
  }

  @override
  ScaffoldConfig Function(LegendTheme theme)? buildConfig() =>
      (LegendTheme theme) => ScaffoldConfig(
            builders: ScaffoldBuilders(
              appBarActions: (c) {
                return LegendAnimatedIcon(
                  icon: Icons.color_lens,
                  theme: LegendAnimtedIconTheme(
                    enabled: theme.colors.selection,
                    disabled: theme.colors.appBarPalette.foreground,
                  ),
                  iconSize: theme.appBarSizing.iconSize,
                  disableShadow: true,
                  onPressed: () {
                    LegendRouter.of(c).pushGlobalModal(
                      settings: RouteSettings(name: "/settings"),
                      useKey: true,
                    );
                  },
                );
              },
              customFooter: LayoutInfo.footer,
            ),
          );
}
