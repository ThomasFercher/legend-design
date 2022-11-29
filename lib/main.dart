import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design/config/colors.dart';
import 'package:legend_design/config/layout.dart';
import 'package:legend_design/config/routes.dart';
import 'package:legend_design/config/sizing.dart';
import 'package:legend_design/config/typography.dart';
import 'package:legend_design_core/interfaces/legend_config.dart';
import 'package:legend_design_core/legend_app.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_utils/urlstrategy/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';

const colorThemeKey = 'colorTheme';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();
  final key = pref.getString(colorThemeKey);
  final initalColorTheme = key == null ? PaletteType.light() : PaletteType(key);

  runApp(
    ProviderScope(
      child: LegendApp(
        config: LegendConfig(
          colorsDelegate: AppColors(),
          layoutDelegate: AppLayout(),
          sizingDelegate: AppSizing(),
          routesDelegate: AppRoutes(),
          typographyDelegate: AppTypography(),
          initalColors: initalColorTheme,
        ),
        logoBuilder: (context) {
          final theme = LegendTheme.of(context);

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/photos/larrylegend.svg",
                width: theme.appBarSizing.logoSize,
                height: theme.appBarSizing.logoSize,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "Legend",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w300,
                  color: theme.appBarColors.foreground,
                  fontSize: theme.typography.h5.fontSize,
                ),
              )
            ],
          );
        },
        title: "Legend Design",
        buildSplashscreen: (context, theme) {
          return Container(
            color: theme.colors.primary,
          );
        },
      ),
    ),
  );
}
