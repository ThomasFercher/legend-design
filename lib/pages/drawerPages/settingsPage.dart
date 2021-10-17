import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/grid/legendGrid.dart';
import 'package:webstore/customwidgets/layout/grid/legendGridSize.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/styles/theming/colors/legendColors.dart';
import 'package:webstore/styles/theming/legendTheme.dart';
import 'package:webstore/styles/theming/sizing/sizeProvider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> border;
  late AnimationController controller;
  Color borderColor = Colors.transparent;
  LegendColorThemeType? themeType;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    border = ColorTween(
      begin: Colors.transparent,
      end: Colors.tealAccent,
    ).animate(new CurvedAnimation(parent: controller, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          borderColor = border.value ?? Colors.transparent;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    themeType = theme.colorTheme;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LegendText(
            padding: EdgeInsets.only(top: 20),
            text: "Themes",
            textStyle: LegendTextStyle.sectionHeader().copyWith(
              color: theme.colors.foreground[2],
              fontSize: 16,
            ),
          ),
          LegendGrid(
            margin: EdgeInsets.only(top: 8),
            width: 400,
            children: [
              InkWell(
                onTap: () {
                  Provider.of<LegendTheme>(context, listen: false)
                      .changeColorTheme(LegendColorThemeType.DARK, context);
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: themeType == LegendColorThemeType.DARK
                        ? Border.all(
                            color: Colors.teal[400]!,
                            width: 2,
                          )
                        : null,
                    borderRadius: theme.sizing.borderRadius[0],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                      theme.sizing.borderInset[1],
                    ),
                    decoration: BoxDecoration(
                      color: LegendColors.gray8,
                      borderRadius: theme.sizing.borderRadius[1],
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
              InkWell(
                onTap: () {
                  Provider.of<LegendTheme>(context, listen: false)
                      .changeColorTheme(LegendColorThemeType.LIGHT, context);
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: themeType == LegendColorThemeType.LIGHT
                        ? Border.all(
                            color: Colors.teal[300]!,
                            width: 2,
                          )
                        : null,
                    borderRadius: theme.sizing.borderRadius[0],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                      theme.sizing.borderInset[1],
                    ),
                    decoration: BoxDecoration(
                      color: LegendColors.gray2,
                      borderRadius: theme.sizing.borderRadius[1],
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
            sizes: LegendGridSize(
              medium: LegendGridSizeInfo(2, 200),
              layoutDirection: LegendGridSizeDirection.DOWN,
            ),
          )
        ],
      ),
    );
  }
}
