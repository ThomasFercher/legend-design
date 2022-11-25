import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design/config/routes.dart';
import 'package:legend_design_core/legend_app.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'config/theme.dart';
import 'package:legend_utils/urlstrategy/url_strategy.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: LegendApp(
        routesDelegate: const RoutesTheme(),
        themeDelegate: const AppTheme(),
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
