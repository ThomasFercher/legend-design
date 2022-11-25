import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/state/legend_state.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';

class GlobalFooter extends LegendWidget {
  const GlobalFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LegendTheme theme) {
    final colors = theme.footerColors;
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
                  "Repository",
                  textStyle: theme.typography.h2.copyWith(
                    color: colors.foreground,
                  ),
                ),
                Expanded(flex: 4, child: Container()),
                Row(
                  children: [
                    LegendAnimatedIcon(
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
                  "Useful Links",
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
                  "Contact Us",
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
                        disabled: theme.colors.footer.foreground,
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
                    "Social Media",
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
                        disabled: theme.colors.footer.foreground,
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
  }
}
