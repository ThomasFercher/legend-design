import 'package:flutter/material.dart';
import 'package:legend_design_core/widgets/gestures/detector.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_design_core/styles/colors/legend_color_theme.dart' as ct;
import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_utils/legend_utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();
    PaletteType? themeType = theme.colorTheme.type;
    return Container(
      height: MediaQuery.of(context).size.height,
      color: theme.colors.background1,
      width: theme.sizing.menuDrawerSizing.width,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LegendText(
                  "Themes",
                  textStyle: theme.typography.h5.copyWith(
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
          ),
          Divider(
            color: theme.colors.background3,
          ),
          Expanded(
            child: Column(
              children: [
                LegendDetector(
                  onTap: () {
                    theme.changeColorTheme(ct.PaletteType.dark(), context);
                  },
                  child: Container(
                    height: 180,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: themeType == ct.PaletteType.dark()
                          ? Border.all(
                              color: theme.colors.primary,
                              width: 2,
                            )
                          : null,
                      borderRadius: theme.sizing.radius1.asRadius(),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(
                        theme.sizing.radius2,
                      ),
                      decoration: BoxDecoration(
                        color: LegendColors.gray8,
                        borderRadius: theme.sizing.radius2.asRadius(),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 4,
                            bottom: 4,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: LegendColors.gray10,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 60,
                            top: 40,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: LegendColors.gray9,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: Container(
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                color: LegendColors.gray10,
                                border: Border.all(
                                  width: 2,
                                  color: LegendColors.gray9,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 4,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: LegendColors.gray11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                LegendDetector(
                  onTap: () {
                    theme.changeColorTheme(ct.PaletteType.light(), context);
                  },
                  child: Container(
                    height: 180,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: themeType == ct.PaletteType.light()
                          ? Border.all(
                              color: theme.colors.primary,
                              width: 2,
                            )
                          : null,
                      borderRadius: theme.sizing.radius1.asRadius(),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(
                        theme.sizing.radius2,
                      ),
                      decoration: BoxDecoration(
                        color: LegendColors.gray2,
                        borderRadius: theme.sizing.radius2.asRadius(),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 4,
                            bottom: 4,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: LegendColors.gray5,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 60,
                            top: 40,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: LegendColors.gray6,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: Container(
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                color: LegendColors.gray5,
                                border: Border.all(
                                  width: 2,
                                  color: LegendColors.gray6,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 4,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: LegendColors.gray7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                LegendDetector(
                  onTap: () {
                    Provider.of<LegendTheme>(context, listen: false)
                        .changeColorTheme(
                      ct.PaletteType.custom(
                        i: 2,
                      ),
                      context,
                    );
                  },
                  child: Container(
                    height: 180,
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: themeType == ct.PaletteType.custom(i: 0)
                          ? Border.all(
                              color: theme.colors.primary,
                              width: 2,
                            )
                          : null,
                      borderRadius: theme.sizing.radius1.asRadius(),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(
                        theme.sizing.radius2,
                      ),
                      decoration: BoxDecoration(
                        color: LegendColors.gray2,
                        borderRadius: theme.sizing.radius2.asRadius(),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 4,
                            bottom: 4,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: LegendColors.gray5,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 60,
                            top: 40,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: LegendColors.gray6,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: Container(
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                color: LegendColors.gray5,
                                border: Border.all(
                                  width: 2,
                                  color: LegendColors.gray6,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 4,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: LegendColors.gray7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
