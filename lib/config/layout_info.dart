import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/fixed/footer/fixed_footer.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/footer_sizing.dart';
import 'package:legend_design_core/styles/typography/legend_text.dart';
import 'package:legend_utils/functions/functions.dart';
import 'package:provider/provider.dart';

class LayoutInfo {
  static FixedFooterSizing sizing = FixedFooterSizing(
    height: 140,
    maxWidth: 1200,
    padding: EdgeInsets.all(32),
  );

  static FixedFooter footer = FixedFooter(
    sizing: sizing,
    builder: (context, sizing, colors) {
      LegendTheme theme = context.watch<LegendTheme>();
      FooterPalette colors = theme.colors.footerPalette;
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LegendText(
                    text: "Repository",
                    textStyle: theme.typography.h2.copyWith(
                      color: colors.foreground,
                    ),
                  ),
                  Expanded(flex: 4, child: Container()),
                  Row(
                    children: [
                      LegendAnimatedIcon(
                        onPressed: () {
                          LegendFunctions.launchInBrowser(
                            "https://github.com/ThomasFercher/Legend-Design",
                          );
                        },
                        icon: AntIcons.githubFilled,
                        iconSize: 32,
                        theme: LegendAnimtedIconTheme(
                          disabled: theme.colors.footerPalette.foreground,
                          enabled: theme.colors.selection,
                        ),
                      ),
                    ],
                  ),
                  Expanded(flex: 3, child: Container()),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LegendText(
                    text: "Useful Links",
                    textStyle: theme.typography.h2.copyWith(
                      color: colors.foreground,
                    ),
                  ),
                  Row()
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LegendText(
                    text: "Contact Us",
                    textStyle:
                        theme.typography.h2.copyWith(color: colors.foreground),
                  ),
                  Expanded(flex: 4, child: Container()),
                  Row(
                    children: [
                      LegendAnimatedIcon(
                        icon: AntIcons.mailFilled,
                        theme: LegendAnimtedIconTheme(
                          enabled: theme.colors.selection,
                          disabled: theme.colors.footerPalette.foreground,
                        ),
                        onPressed: () => {},
                        iconSize: 32,
                      ),
                    ],
                  ),
                  Expanded(flex: 3, child: Container()),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: LegendText(
                      textAlign: TextAlign.left,
                      text: "Social Media",
                      textStyle: theme.typography.h2.copyWith(
                        color: colors.foreground,
                      ),
                    ),
                  ),
                  Expanded(flex: 4, child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LegendAnimatedIcon(
                        icon: AntIcons.instagramFilled,
                        theme: LegendAnimtedIconTheme(
                          enabled: theme.colors.selection,
                          disabled: theme.colors.footerPalette.foreground,
                        ),
                        onPressed: () => {},
                        iconSize: 32,
                      ),
                      /* Padding(padding: EdgeInsets.only(left: 32)),
                      LegendAnimatedIcon(
                        icon: AntIcons.linkedinFilled,
                        theme: LegendAnimtedIconTheme(
                          enabled: theme.colors.selectionColor,
                          disabled: theme.colors.foreground[2],
                        ),
                        onPressed: () => {},
                        iconSize: 12,
                      ),
                      Padding(padding: EdgeInsets.only(left: 32)),
                      LegendAnimatedIcon(
                        icon: AntIcons.twitterCircleFilled,
                        theme: LegendAnimtedIconTheme(
                          enabled: theme.colors.selectionColor,
                          disabled: theme.colors.foreground[2],
                        ),
                        onPressed: () => {},
                        iconSize: 12,
                      ),*/
                    ],
                  ),
                  Expanded(flex: 3, child: Container()),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
