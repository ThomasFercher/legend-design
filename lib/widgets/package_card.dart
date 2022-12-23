import 'package:flutter/material.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_core/widgets/elevation/animated_card.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';

class PackageCard extends StatelessWidget {
  final String name;
  final String version;
  final IconData icon;
  final String? url;
  final double? width;

  const PackageCard({
    Key? key,
    required this.name,
    required this.version,
    required this.icon,
    this.width,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    return AnimatedCard(
      borderRadius: theme.sizing.radius2.asRadius(),
      elevation: 1,
      padding: EdgeInsets.all(4),
      child: Container(
        height: 64,
        width: width,
        color: theme.colors.background3,
        padding: EdgeInsets.symmetric(
          horizontal: theme.sizing.spacing1,
        ),
        child: Row(
          children: [
            Expanded(
              child: LegendText(
                name,
                style: theme.typography.h4,
                dynamicSizing: true,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Container(
              width: 48,
              decoration: BoxDecoration(
                color: theme.colors.secondary,
                borderRadius: theme.sizing.radius2.asRadius(),
              ),
              alignment: Alignment.center,
              child: LegendText(
                version,
                style: theme.typography.h0.copyWith(color: Colors.white),
              ),
              height: 20,
            ),
            const SizedBox(
              width: 24,
            ),
            LegendAnimatedIcon(
              icon: icon,
              iconSize: 32,
              theme: LegendAnimtedIconTheme(
                enabled: theme.colors.selection,
                disabled: theme.colors.foreground4,
              ),
              onPressed: () {
                if (url != null) LegendFunctions.launchInBrowser(url!);
              },
            )
          ],
        ),
      ),
    );
  }
}
