import 'package:flutter/material.dart';
import 'package:legend_design/main.dart';
import 'package:legend_design_core/state/legend_state.dart';
import 'package:legend_design_core/styles/theme_provider.dart';
import 'package:legend_design_core/widgets/elevation/animated_card.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_core/widgets/size_info.dart';
import 'package:legend_utils/legend_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends LegendWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, LegendTheme theme) {
    final colorTheme = context.watch<ThemeProvider>().colorTheme;
    final dark = theme.colors == colorTheme.dark;
    final light = theme.colors == colorTheme.light;

    return Container(
      height: SizeInfo.of(context).height,
      color: theme.colors.background1,
      width: theme.sizing.menuDrawerSizing.width,
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LegendText(
                "Themes",
                style: theme.typography.h5.copyWith(
                  color: theme.colors.foreground1,
                ),
              ),
              LegendAnimatedIcon(
                icon: Icons.close,
                disableShadow: true,
                theme: LegendAnimtedIconTheme(
                  enabled: theme.colors.selection,
                  disabled: theme.colors.foreground1,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Divider(
            color: theme.colors.background3,
            height: 32,
          ),
          AnimatedCard(
            border: Border.all(
              color: theme.colors.selection,
              width: 2,
            ).boolInit(light),
            borderRadius: theme.sizing.radius4.asRadius(),
            background: colorTheme.light.background1,
            elevation: 1,
            selElevation: 3,
            height: 128,
            onTap: () {
              context
                  .read<ThemeProvider>()
                  .changeColorTheme(PaletteType.light());

              SharedPreferences.getInstance().then(
                (pref) => pref.setString(colorThemeKey, lightKey),
              );
            },
            padding: EdgeInsets.zero,
            child: Center(
              child: LegendText(
                "Light",
                style: theme.typography.h3.copyWith(
                  color: colorTheme.light.foreground3,
                ),
                selectable: false,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          AnimatedCard(
            border: Border.all(
              color: theme.colors.selection,
              width: 2,
            ).boolInit(dark),
            borderRadius: theme.sizing.radius4.asRadius(),
            background: colorTheme.dark.background3,
            elevation: 1,
            selElevation: 3,
            height: 128,
            onTap: () {
              context
                  .read<ThemeProvider>()
                  .changeColorTheme(PaletteType.dark());

              SharedPreferences.getInstance().then(
                (pref) => pref.setString(colorThemeKey, darkKey),
              );
            },
            padding: EdgeInsets.zero,
            child: Center(
              child: LegendText(
                "Dark",
                style: theme.typography.h3.copyWith(
                  color: colorTheme.dark.foreground3,
                ),
                selectable: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
