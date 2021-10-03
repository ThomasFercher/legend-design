import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/icons/legendAnimatedIcon.dart';
import 'package:webstore/customwidgets/layout/grid/legendGrid.dart';
import 'package:webstore/customwidgets/layout/grid/legendGridSize.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/modals/drawer/legendDrawerInfo.dart';
import 'package:webstore/customwidgets/modals/drawer/legendDrawerProvider.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/styles/theming/legendTheme.dart';
import 'package:webstore/styles/theming/sizing/sizeProvider.dart';

class LegendDrawer extends StatefulWidget {
  final LegendDrawerRoute route;

  LegendDrawer({
    Key? key,
    required this.route,
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
  late Animation<Color?> background;
  late Animation<double> opcaitya;
  late Color backgroundColor;
  late double opcaity;
  @override
  void initState() {
    width = 0;
    backgroundColor = Colors.black54;
    opcaity = 0;

    controller2 = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 140,
      ),
    );
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
    );
    background = ColorTween(
      begin: Colors.transparent,
      end: backgroundColor,
    ).animate(controller)
      ..addListener(() {
        setState(() {
          backgroundColor = background.value ?? backgroundColor;
        });
      });
    animation = Tween<double>(
      begin: 0,
      end: widget.route.width,
    ).animate(controller)
      ..addListener(() {
        setState(() {
          width = animation.value;
        });
      });

    opcaitya = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controller2)
      ..addListener(() {
        setState(() {
          opcaity = opcaitya.value;
        });
      });

    controller.forward();
    controller2.forward();
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
    LegendTheme theme = Provider.of<LegendTheme>(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        width: SizeProvider.of(context).width,
        height: SizeProvider.of(context).height,
        color: backgroundColor,
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
            opacity: opcaity,
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
                                Duration(milliseconds: 200),
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
                                color: theme.colors.textColorDark,
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
                            color: theme.colors.textColorLight,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 32),
                          ),
                          Icon(
                            Icons.info_outlined,
                            color: theme.colors.textColorLight,
                            size: 30,
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
