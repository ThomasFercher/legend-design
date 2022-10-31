import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legend_design/config/routes.dart';
import 'package:legend_design/firebase_options.dart';
import 'package:legend_design_core/legend_app.dart';
import 'config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: LegendApp(
        routesDelegate: const RoutesTheme(),
        themeDelegate: const AppTheme(),
        logo: SizedBox(
          width: 240,
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/photos/larrylegend.svg",
                width: 48,
                height: 48,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Legend Design",
                style: GoogleFonts.lobsterTwo(
                  fontSize: 32,
                ),
              )
            ],
          ),
        ),
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
