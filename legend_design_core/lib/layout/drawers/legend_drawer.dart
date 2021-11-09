import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/drawers/legend_drawer_info.dart';
import 'package:legend_design_core/layout/drawers/legend_drawer_provider.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
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
  late double positiion;
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
    positiion = 0;
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
      begin: widget.isMobile ? widget.route.mobileWidth : widget.route.width,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOutCubic,
      ),
    )..addListener(() {
        setState(() {
          positiion = animation.value;
        });
      });

    opacityContentA = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: controller2, curve: Curves.easeIn),
    )..addListener(() {
        setState(() {
          opacityContent = opacityContentA.value;
        });
      });

    opacityBackgroundA = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(parent: controller2, curve: Curves.easeInOutCubic),
    )..addListener(() {
        setState(() {
          opacityBackground = opacityBackgroundA.value;
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
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    double widthPadding = widget.route.width - 48;
    return Opacity(
      opacity: opacityBackground,
      child: Container(
        width: SizeProvider.of(context).width,
        height: SizeProvider.of(context).height,
        color: Colors.black45,
        alignment: Alignment.centerRight,
        child: Container(
          height: SizeProvider.of(context).height,
          width: widget.route.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 4,
                blurRadius: 2,
              )
            ],
            color: theme.colors.scaffoldBackgroundColor,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(
                theme.sizing.borderInset[0],
              ),
            ),
          ),
          transform: Matrix4.translationValues(positiion, 0, 0),
          padding: EdgeInsets.only(
            left: 24,
            top: SizeProvider.of(context).isMobile ? 40 : 24,
            bottom: 24,
            right: 24,
          ),
          child: Opacity(
            opacity: opacityContent,
            child: Column(
              children: [
                Container(
                  height: 36,
                  child: OverflowBox(
                    maxHeight: 36,
                    minWidth: 0,
                    alignment: Alignment.centerLeft,
                    maxWidth: widthPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LegendAnimatedIcon(
                          disableShadow: true,
                          icon: Icons.close,
                          iconSize: 32,
                          theme: LegendAnimtedIconTheme(
                            enabled: theme.colors.selectionColor,
                            disabled: theme.colors.foreground[2],
                            boxShadow: BoxShadow(
                              blurRadius: 0,
                              color: Colors.transparent,
                            ),
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
                            text: 'Settings',
                            textStyle: theme.typography.h5.copyWith(
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
                    color: theme.colors.foreground[0],
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
                    color: theme.colors.foreground[0],
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
                          disableShadow: true,
                          onPressed: () {
                            showAboutDialog(
                              context: context,
                              applicationIcon: Container(
                                width: 96,
                                height: 96,
                                child: Image.asset(
                                    'assets/photos/larrylegend.png'),
                              ),
                              applicationLegalese: 'Not for commercial use.',
                              applicationVersion: '0.0.4',
                              useRootNavigator: true,
                              applicationName: 'Legend Design',
                            );
                          },
                          theme: LegendAnimtedIconTheme(
                            enabled: theme.colors.selectionColor,
                            disabled: theme.colors.foreground[1],
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
    );
  }
}
