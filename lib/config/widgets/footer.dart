import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/state/legend_state.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_design_widgets/datadisplay/header/legend_header.dart';

class GlobalFooter extends LegendWidget {
  const GlobalFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LegendTheme theme) {
    final colors = theme.footerColors;
    final double verticalSpacing = theme.sizing.spacing1;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: LegendHeader(
              header: LegendText(
                "Repository",
                style: theme.typography.h2.copyWith(
                  color: colors.foreground,
                ),
              ),
              spacing: verticalSpacing,
              child: LegendAnimatedIcon(
                onPressed: () {
                  //   LegendFunctions.launchInBrowser(
                  //      "https://github.com/ThomasFercher/Legend-Design",
                  //    );
                },
                icon: AntIcons.githubFilled,
                iconSize: 32,
                theme: LegendAnimtedIconTheme(
                  disabled: theme.colors.footer.foreground,
                  enabled: theme.colors.selection,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: LegendHeader(
              header: LegendText(
                "Useful Links",
                style: theme.typography.h2.copyWith(
                  color: colors.foreground,
                ),
              ),
              spacing: verticalSpacing,
              child: Row(),
            ),
          ),
          Expanded(
            flex: 2,
            child: LegendHeader(
              header: LegendText(
                "Contact Us",
                style: theme.typography.h2.copyWith(color: colors.foreground),
              ),
              spacing: verticalSpacing,
              child: Row(
                children: [
                  LegendAnimatedIcon(
                    icon: AntIcons.mailFilled,
                    theme: LegendAnimtedIconTheme(
                      enabled: theme.colors.selection,
                      disabled: theme.colors.footer.foreground,
                    ),
                    onPressed: () => {},
                    iconSize: 32,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: LegendHeader(
              header: LegendText(
                textAlign: TextAlign.left,
                "Social Media",
                style: theme.typography.h2.copyWith(
                  color: colors.foreground,
                ),
              ),
              spacing: verticalSpacing,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LegendAnimatedIcon(
                    icon: AntIcons.instagramFilled,
                    theme: LegendAnimtedIconTheme(
                      enabled: theme.colors.selection,
                      disabled: theme.colors.footer.foreground,
                    ),
                    onPressed: () => {},
                    iconSize: 32,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
