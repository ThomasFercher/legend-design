import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webstore/customwidgets/icons/legendAnimatedIcon.dart';
import 'package:webstore/customwidgets/icons/legendGradientIcon.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/utils/legendUtils.dart';
import '../../../styles/theming/legendTheme.dart';

class FixedFooter extends StatelessWidget {
  final double? height;

  const FixedFooter({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);

    return Hero(
      tag: ValueKey("footer"),
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: theme.colors.foreground[0],
          height: height,
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 1200,
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
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
                        textStyle: LegendTextStyle.h4(),
                      ),
                      Expanded(flex: 4, child: Container()),
                      Row(
                        children: [
                          LegendAnimatedIcon(
                            onPressed: () {
                              LegendUtils.launchInBrowser(
                                "https://github.com/ThomasFercher/Legend-Design",
                              );
                            },
                            icon: AntIcons.githubFilled,
                            iconSize: 32,
                            theme: LegendAnimtedIconTheme(
                                disabled: theme.colors.foreground[2],
                                enabled: theme.colors.selectionColor),
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
                        textStyle: LegendTextStyle.h4(),
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
                        textStyle: LegendTextStyle.h4(),
                      ),
                      Expanded(flex: 4, child: Container()),
                      Row(
                        children: [
                          LegendAnimatedIcon(
                            icon: AntIcons.mailFilled,
                            theme: LegendAnimtedIconTheme(
                              enabled: theme.colors.selectionColor,
                              disabled: theme.colors.foreground[2],
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
                          textStyle: LegendTextStyle.h4(),
                        ),
                      ),
                      Expanded(flex: 4, child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LegendAnimatedIcon(
                            icon: AntIcons.linkedinFilled,
                            theme: LegendAnimtedIconTheme(
                              enabled: theme.colors.selectionColor,
                              disabled: theme.colors.foreground[2],
                            ),
                            onPressed: () => {},
                            iconSize: 32,
                          ),
                          Padding(padding: EdgeInsets.only(left: 32)),
                          LegendAnimatedIcon(
                            icon: AntIcons.instagramFilled,
                            theme: LegendAnimtedIconTheme(
                              enabled: theme.colors.selectionColor,
                              disabled: theme.colors.foreground[2],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
