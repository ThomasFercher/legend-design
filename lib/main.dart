import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design/config/routes.dart';
import 'package:legend_design/config/sizing.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/legend_app.dart';

import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/typography/typography.dart';
import 'package:legend_router/router/legend_router.dart';
import 'config/colors.dart';
import 'config/layout_info.dart';

void main() {
  LegendTheme legendTheme = LegendTheme(
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
                LegendRouter.of(c).pushPage(
                  settings: RouteSettings(name: "/settings"),
                  useKey: true,
                );
              },
            );
          },
        ),
      );
    },
    colorTheme: LegendColorTheme(
      themes: [
        ColorTheme.lightColorTheme,
        ColorTheme.darkColorTheme,
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
    sizingTheme: SizingTheme.sizingTheme,
    typography: LegendTypography(
      //   base: GoogleFonts.nunito(),
      h6: GoogleFonts.lobsterTwo(),
    ),
  );

  runApp(
    LegendApp(
      routeDisplays: RoutesTheme.menuOptions,
      buildRoutes: RoutesTheme.buildRoutes,
      logo: SvgPicture.asset(
        "assets/photos/larrylegend.svg",
        width: 48,
        height: 48,
      ),
      title: "Legend Design",
      theme: legendTheme,
      globalFooter: LayoutInfo.footer,
      future: Future.delayed(Duration(seconds: 2), () => true),
      splashScreen: Container(
        color: ColorTheme.darkColorTheme.background[0],
        child: Center(
          child: SizedBox(
            height: 64,
            width: 64,
            child: CircularProgressIndicator(
              color: ColorTheme.darkColorTheme.primary,
            ),
          ),
        ),
      ),
    ),
  );
}
