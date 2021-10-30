import 'dart:io';

import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legendAnimatedIcon.dart';
import 'package:legend_design_core/layout/drawers/legendDrawerInfo.dart';
import 'package:legend_design_core/layout/drawers/legendDrawerProvider.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/sizing/sizeProvider.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:legend_design_core/typography/legendText.dart';
import 'package:legend_design_core/typography/typography.dart';

import 'package:provider/provider.dart';

class LegendDrawer extends StatefulWidget {
  final LegendDrawerRoute route;
  final bool isMobile;

  LegendDrawer({
    Key? key,
    required this.route,
    required this.isMobile,
  }) : super(key: key);

  @override
  _LegendDrawerState createState() => _LegendDrawerState();
}

class _LegendDrawerState extends State<LegendDrawer>
    with TickerProviderStateMixin {
  late double width;
  late double maxWidth;
  late AnimationController controller;
  late AnimationController controller2;
  late Animation<double> animation;
  late Animation<double> opacityContentA;
  late Animation<double> opacityBackgroundA;
  late double opacityContent;
  late double opacityBackground;
  @override
  void initState() {
    width = 0;
    opacityBackground = 0;
    opacityContent = 0;

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    );
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
    );

    animation = Tween<double>(
      begin: 0,
      end: widget.isMobile ? widget.route.mobileWidth : widget.route.width,
    ).animate(new CurvedAnimation(parent: controller, curve: Curves.easeInSine))
      ..addListener(() {
        setState(() {
          width = animation.value;
        });
      });

    opacityContentA = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      new CurvedAnimation(parent: controller2, curve: Curves.easeInOutExpo),
    )..addListener(() {
        setState(() {
          opacityContent = opacityContentA.value;
        });
      });

    opacityBackgroundA = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      new CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo),
    )..addListener(() {
        setState(() {
          opacityBackground = opacityBackgroundA.value;
        });
      });

    controller.forward();
    Future.delayed(
      Duration(milliseconds: 200),
      () => controller2.forward(),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Opacity(
      opacity: opacityBackground,
      child: Container(
        width: SizeProvider.of(context).width,
        height: SizeProvider.of(context).height,
        color: Colors.black54,
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 8,
                blurRadius: 4,
              )
            ],
          ),
          child: Opacity(
            opacity: opacityContent,
            child: Container(
              width: width,
              height: SizeProvider.of(context).height,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colors.foreground[0],
              ),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    child: OverflowBox(
                      maxHeight: 36,
                      minWidth: 0,
                      alignment: Alignment.centerLeft,
                      maxWidth: widget.route.width - 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LegendAnimatedIcon(
                            icon: Icons.close,
                            theme: LegendAnimtedIconTheme(
                              enabled: theme.colors.foreground[2],
                              disabled: theme.colors.foreground[1],
                            ),
                            onPressed: () {
                              controller.reverse();
                              controller2.reverse();

                              Future.delayed(
                                Duration(milliseconds: 425),
                                () {
                                  Provider.of<LegendDrawerProvider>(
                                    context,
                                    listen: false,
                                  ).closeDrawer();
                                },
                              );
                            },
                          ),
                          Flexible(
                            child: LegendText(
                              padding: EdgeInsets.only(
                                right: 8,
                              ),
                              text: "Settings",
                              textStyle: LegendTextStyle.h2().copyWith(
                                color: theme.colors.foreground[3],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Divider(
                      color: theme.colors.foreground[1],
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: widget.route.contentBuilder,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Divider(
                      color: theme.colors.foreground[1],
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    height: 30,
                    child: OverflowBox(
                      maxHeight: 30,
                      minWidth: 0,
                      maxWidth: widget.route.width - 32,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 4),
                          ),
                          Icon(
                            Icons.settings_applications,
                            color: theme.colors.foreground[2],
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 32),
                          ),
                          LegendAnimatedIcon(
                            iconSize: 30,
                            icon: Icons.info_outlined,
                            onPressed: () {
                              showAboutDialog(
                                context: context,
                                applicationIcon: Container(
                                  width: 96,
                                  height: 96,
                                  child: Image.asset(
                                      "assets/photos/larrylegend.png"),
                                ),
                                applicationLegalese: "Not for commercial use.",
                                applicationVersion: "0.0.4",
                                useRootNavigator: true,
                                applicationName: "Legend Design",
                              );
                            },
                            theme: LegendAnimtedIconTheme(
                              enabled: Colors.tealAccent,
                              disabled: theme.colors.foreground[2],
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
