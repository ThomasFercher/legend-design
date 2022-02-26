import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixed_appbar_colors.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixed_bottom_bar.dart';
import 'package:legend_design_core/layout/fixed/fixed_footer.dart';
import 'package:legend_design_core/layout/fixed/sider/siderTheme.dart';
import 'package:legend_design_core/legend_design_app.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_palette.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/colors/legend_colors.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:webstore/styles/layoutInfo.dart';

import 'styles/appStyles.dart';

void main() {
  /* TODO:

  give ThemeProvider a basic typrography (fontFamily, Weight, Sacing, etc, Color and Size (overiides))
  also create Typography Color System

  if Color not specifed give Colors over theme ColorTheme; 
 them same  TextStyle Sizing and the Sizing Themes
*/
  runApp(
    LegendApp(
      menuOptions: AppConfig.menuOptions,
      routes: AppConfig.routes,
      logo: SvgPicture.asset(
        "assets/photos/larrylegend.svg",
        width: 48,
        height: 48,
      ),
      title: "Legend Design",
      theme: ThemeProvider(
        colorTheme: LegendColorTheme(
          themes: [
            AppConfig.lightColorTheme,
            AppConfig.darkColorTheme,
            LegendColorPalette(
              textContrast: Color(0xFFb3dedb),
              siderColorTheme: SiderColorTheme(
                background: Colors.teal,
                backgroundMenu: Colors.teal[600]!,
                foreground: Colors.teal[50]!,
              ),
              typographyColors: LegendTypographyColors(
                baseColor: Colors.white,
              ),
              bottomBarColors: BottomBarColors(
                activeColor: Colors.white,
                disabledColor: Colors.black26,
                backgroundColor: LegendColors.gray10,
              ),
              fixedFooterColors: FixedFooterColors(
                backgroundColor: LegendColors.gray8,
                foreground: LegendColors.gray4,
              ),
              cardBackgroundColor: LegendColors.gray9,
              primaryColor: Colors.white,
              secondaryColor: Color(0xFFb3dedb),
              scaffoldBackgroundColor: LegendColors.gray11,
              foreground: [
                LegendColors.gray10,
                LegendColors.gray8,
                LegendColors.gray6,
                LegendColors.gray4,
              ],
              background: [
                LegendColors.gray10,
                LegendColors.gray9,
                LegendColors.gray8,
                LegendColors.gray7,
                LegendColors.gray6,
                LegendColors.gray5,
              ],
              selectionColor: Colors.tealAccent,
              textColorDark: LegendColors.gray6,
              textColorLight: LegendColors.gray4,
              appBarColors: FixedAppBarColors(
                backgroundColor: Colors.yellow,
                iconColor: Colors.tealAccent,
                selectedColor: Colors.tealAccent,
                foreground: LegendColors.gray10,
              ),
              disabledColor: Colors.black12,
            ),
          ],
        ),
        sizingTheme: AppConfig.sizingTheme,
        typography: LegendTypography(
          //   base: GoogleFonts.nunito(),
          h6: GoogleFonts.lobsterTwo(),
        ),
      ),
      globalFooter: LayoutInfo.footer,
      future: Future.delayed(Duration(seconds: 2), () => true),
      splashScreen: Container(
        color: AppConfig.darkColorTheme.scaffoldBackgroundColor,
        child: Center(
          child: SizedBox(
            height: 64,
            width: 64,
            child: CircularProgressIndicator(
              color: AppConfig.darkColorTheme.primaryColor,
            ),
          ),
        ),
      ),
    ),
  );
}
