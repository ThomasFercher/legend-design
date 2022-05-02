import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/scaffold/config/builders.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/legend_design_app.dart';
import 'package:legend_design_core/router/legend_router.dart';
import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'styles/app_styles.dart';
import 'styles/layout_info.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.yellow,
      systemNavigationBarContrastEnforced: true,
    ),
  );
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
      theme: LegendTheme(
        buildConfig: (theme) {
          return ScaffoldConfig(
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
                    LegendRouter.of(c)
                        .pushPage(settings: RouteSettings(name: "/settings"));
                  },
                );
              },
            ),
          );
        },
        colorTheme: LegendColorTheme(
          themes: [
            AppConfig.lightColorTheme,
            AppConfig.darkColorTheme,
            LegendPalette(
              primary: Colors.indigo,
              secondary: Colors.teal,
              tertiary: Colors.teal,
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
              error: Colors.red,
              disabled: LegendColors.gray7,
              shadow: Colors.black.withOpacity(0.5),
              selection: Colors.tealAccent[400]!,
              textOnDark: LegendColors.gray6,
              textOnLight: LegendColors.gray4,
              onPrimary: Colors.indigo[200]!,
              onSecondary: Colors.teal[200]!,
              onTertiary: Colors.teal[200]!,
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
        color: AppConfig.darkColorTheme.background[0],
        child: Center(
          child: SizedBox(
            height: 64,
            width: 64,
            child: CircularProgressIndicator(
              color: AppConfig.darkColorTheme.primary,
            ),
          ),
        ),
      ),
    ),
  );
}
