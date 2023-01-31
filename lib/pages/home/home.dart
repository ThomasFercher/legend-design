import 'package:flutter/material.dart';
import 'package:legend_design/widgets/background_painter.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_config.dart';
import 'package:legend_design_core/layout/appBar.dart/legend_sliverbar.dart';
import 'package:legend_design_core/layout/navigation/section/legend_section.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/libraries/scaffold.dart';
import 'package:legend_design_core/state/legend_state.dart';
import 'package:legend_design_core/widgets/elevation/elevation_box.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_design_widgets/datadisplay/avatar/legend_avatar.dart';
import 'package:legend_design_widgets/datadisplay/carousel/legend_carousel.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/header/legend_header.dart';
import 'package:legend_design_widgets/datadisplay/loading/shimmer/loading_container.dart';
import 'package:legend_design_widgets/datadisplay/loading/shimmer/loading_shimmer.dart';
import 'package:legend_design_widgets/datadisplay/loading/shimmer/shimmer.dart';
import 'package:legend_design_widgets/datadisplay/tag/legendTag.dart';
import 'package:legend_design_widgets/input/button/legendButton/legend_button.dart';
import 'package:legend_design_widgets/input/color/legend_color_input.dart';
import 'package:legend_design_widgets/input/switch/legendSwitch.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/items/legendFlexItem.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/legend_dynamic_flex_layout.dart';

class Home extends LegendWidget {
  const Home();

  @override
  Widget build(BuildContext context, LegendTheme theme) {
    const double verticalSpacing = 60;
    const double verticalPadding = 100;
    const double verticalPadding2 = 80;

    const double horizontalPadding = 24;
    final info = ScaffoldInfo.of(context);

    return LegendRouteBody(
      sliverAppBar: LegendSliverBar(
        config: LegendAppBarConfig(
          appBarHeight: 80,
          elevation: 1,
          floating: true,
        ),
        actions: info?.scaffold.builders.appBarActions,
      ),
      disableContentDecoration: true,
      builder: (context, s) {
        return Column(
          children: [
            /* SizedBox(
              height: 400,
              child: RiveAnimation.asset(
                "assets/flares/banner.riv",
                stateMachines: ["State Machine 1"],
                fit: BoxFit.cover,
              ),
            ),*/
            CustomPaint(
              painter: BackgroundPainter(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LegendSection(
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPadding,
                      horizontal: theme.sizing.spacing1,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: LegendText(
                            "Legend Design",
                            style: theme.typography.h5,
                            fontSize: 64,
                            dynamicSizing: true,
                          ),
                        ),
                        const SizedBox(
                          height: verticalSpacing * 1.8,
                        ),
                        Center(
                          child: LegendText(
                            "Helps Development of Cross Platform Applications with Flutter",
                            style: theme.typography.h3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: verticalSpacing,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LegendButton.text(
                              text: "Get Started",
                              style: theme.typography.h2.copyWith(
                                color: Colors.white,
                              ),
                              elevation: 0,
                              selElevation: 2,
                              height: 64,
                              padding: EdgeInsets.symmetric(horizontal: 36),
                              onTap: () {
                                LegendRouter.of(context)
                                    .pushPage("/getting-started");
                              },
                              background: theme.colors.primary,
                              selBackground: theme.colors.primary.lighten(),
                              borderRadius: theme.sizing.radius4.asRadius(),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            LegendButton.text(
                              background: Colors.pink,
                              selBackground: Colors.pinkAccent,
                              elevation: 0,
                              selElevation: 2,
                              style: theme.typography.h2.copyWith(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 36),
                              height: 64,
                              borderRadius: theme.sizing.radius4.asRadius(),
                              text: "Buy Now",
                              onTap: () {
                                print("testaaaaaaaaaa");
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  LegendSection(
                    color: theme.colors.background2,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    spacing: verticalPadding2,
                    title: Center(
                      child: Column(
                        children: [
                          LegendText(
                            "Widget Library",
                            style: theme.typography.h5,
                          ),
                          const SizedBox(
                            height: verticalSpacing,
                          ),
                          LegendText(
                            "A whole library of Widgets for every use case",
                            style: theme.typography.h2,
                          ),
                        ],
                      ),
                    ),
                    child: LegendDynamicFlexLayout(
                      layout: LegendCustomFlexLayout.dyna(
                        children: [
                          ClipRRect(
                            borderRadius: theme.sizing.radius4.asRadius(),
                            child: LegendCarousel(
                              items: [
                                Container(
                                  color: theme.colors.primary,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 64,
                                    vertical: 24,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      LegendHeader(
                                        expand: true,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        header: LegendText(
                                          "Animated Icons",
                                          style: theme.typography.h3,
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            LegendAnimatedIcon(
                                              icon: Icons.currency_bitcoin,
                                              iconSize: 32,
                                              disableShadow: true,
                                              theme: LegendAnimtedIconTheme(
                                                enabled: Colors.orangeAccent,
                                                disabled: Colors.orange,
                                              ),
                                              onPressed: () {},
                                            ),
                                            LegendAnimatedIcon(
                                              icon:
                                                  Icons.camera_outdoor_rounded,
                                              iconSize: 32,
                                              theme: LegendAnimtedIconTheme(
                                                enabled: Colors.purpleAccent,
                                                disabled: Colors.purple,
                                              ),
                                              onPressed: () {},
                                            ),
                                            LegendAnimatedIcon(
                                              icon: Icons.data_saver_on_rounded,
                                              iconSize: 32,
                                              disableShadow: true,
                                              theme: LegendAnimtedIconTheme(
                                                enabled: Colors.white,
                                                disabled: Colors.white54,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                      LegendHeader(
                                        expand: true,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        header: LegendText(
                                          "Avatars",
                                          style: theme.typography.h3,
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            LegendAvatar(
                                              backgroundColor:
                                                  theme.colors.onPrimary,
                                              child: Container(
                                                height: 48,
                                                width: 48,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            LegendAvatar(
                                              borderRadius: 24,
                                              child: Container(
                                                height: 48,
                                                width: 48,
                                                child: Icon(
                                                  Icons.person_3,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: theme.colors.secondary,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 64,
                                    vertical: 24,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      LegendHeader(
                                        expand: true,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        header: LegendText(
                                          "Loading",
                                          style: theme.typography.h3,
                                          color: Colors.white,
                                        ),
                                        child: Shimmer(
                                          linearGradient: shimmerGradient,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ShimmerLoading(
                                                isLoading: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: theme
                                                        .sizing.radius2
                                                        .asRadius(),
                                                  ),
                                                  height: 48,
                                                  width: 96,
                                                ),
                                              ),
                                              ShimmerLoading(
                                                isLoading: true,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: theme
                                                        .sizing.radius3
                                                        .asRadius(),
                                                  ),
                                                  height: 32,
                                                  width: 120,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      LegendHeader(
                                        expand: true,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        header: LegendText(
                                          "Input",
                                          style: theme.typography.h3,
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            LegendSwitch(
                                              activeColor:
                                                  theme.colors.selection,
                                            ),
                                            SizedBox(
                                              width: 120,
                                              child: LegendTextField(
                                                decoration:
                                                    LegendInputDecoration
                                                        .rounded(
                                                  textColor: Colors.black87,
                                                  backgroundColor:
                                                      Colors.grey[50],
                                                  borderColor:
                                                      theme.colors.primary,
                                                  focusColor:
                                                      theme.colors.selection,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: theme.colors.background3,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 80,
                                    vertical: 24,
                                  ),
                                  child: LegendHeader(
                                    expand: true,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    header: LegendText(
                                      "Color Selection",
                                      style: theme.typography.h3,
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        LegendColorInput(
                                          onChanged: (color) {
                                            print(color);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedBox(
                            elevation: 0.1,
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: theme.colors.background1,
                              borderRadius: theme.sizing.radius4.asRadius(),
                            ),
                            child: LegendHeader(
                              header: LegendText(
                                "Tags",
                                style: theme.typography.h3,
                              ),
                              spacing: 0,
                              margin: EdgeInsets.all(24),
                              expand: true,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    LegendTag.fromColor(
                                      color: Colors.red,
                                      text: "Basic",
                                    ),
                                    LegendTag.fromColor(
                                      color: Colors.blue,
                                      text: "Chill",
                                    ),
                                    LegendTag.fromColor(
                                      color: Colors.greenAccent,
                                      text: "Environment friendly",
                                    ),
                                    LegendTag.fromColor(
                                      color: Colors.purpleAccent,
                                      text: "Ephoric",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ElevatedBox(
                            margin: EdgeInsets.all(0.4),
                            decoration: BoxDecoration(
                              color: theme.colors.background1,
                              borderRadius: theme.sizing.radius4.asRadius(),
                            ),
                            elevation: 0.1,
                            child: LegendHeader(
                              header: LegendText(
                                "Buttons",
                                style: theme.typography.h3,
                              ),
                              spacing: 0,
                              margin: EdgeInsets.all(24),
                              expand: true,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: horizontalPadding,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    LegendButton.text(
                                      text: "Primary",
                                      style: theme.typography.h2.copyWith(
                                        color: Colors.white,
                                      ),
                                      background: theme.colors.primary,
                                    ),
                                    LegendButton.text(
                                      text: "Danger",
                                      style: theme.typography.h2.copyWith(
                                        color: Colors.white,
                                      ),
                                      background: theme.colors.error,
                                    ),
                                    LegendButton.text(
                                      text: "Border",
                                      style: theme.typography.h2.copyWith(
                                        color: theme.colors.primary,
                                      ),
                                      borderRadius:
                                          theme.sizing.radius3.asRadius(),
                                      selBackground: theme.colors.background1,
                                      background: theme.colors.background1,
                                      border: Border.all(
                                        color: theme.colors.primary,
                                        width: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      dynamicLayout: DynamicFlexLayout(
                        splits: [
                          theme.splits[0],
                          theme.splits[1],
                          theme.splits[2],
                          theme.splits.last
                        ],
                        items: [
                          LegendLayoutColumn(
                            spacing: theme.sizing.spacing1,
                            children: [
                              LegendLayoutWidget(0),
                              LegendLayoutWidget(1),
                              LegendLayoutWidget(2),
                            ],
                          ),
                          LegendLayoutColumn(
                            spacing: theme.sizing.spacing1,
                            children: [
                              LegendLayoutWidget(0),
                              LegendLayoutRow(
                                spacing: theme.sizing.spacing1,
                                children: [
                                  LegendLayoutWidget(1),
                                  LegendLayoutWidget(2),
                                ],
                              ),
                            ],
                          ),
                          LegendLayoutColumn(
                            spacing: theme.sizing.spacing1,
                            children: [
                              LegendLayoutWidget(0),
                              LegendLayoutRow(
                                spacing: theme.sizing.spacing1,
                                children: [
                                  LegendLayoutWidget(1),
                                  LegendLayoutWidget(2),
                                ],
                              ),
                            ],
                          ),
                          LegendLayoutRow(
                            spacing: theme.sizing.spacing1,
                            childrenFlex: [
                              ChildrenFlexValue(2),
                              ChildrenFlexValue(1),
                              ChildrenFlexValue(1),
                            ],
                            children: [
                              LegendLayoutWidget(0),
                              LegendLayoutWidget(1),
                              LegendLayoutWidget(2),
                            ],
                          ),
                        ],
                        width: s.width,
                      ),
                      heights: [
                        800,
                        600,
                        600,
                        400,
                      ],
                    ),
                  ),
                  LegendSection(
                    spacing: verticalPadding2,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    color: Colors.blueGrey[900].darken(),
                    title: Center(
                      child: Column(
                        children: [
                          LegendText(
                            "Flexible Color Theme",
                            style: theme.typography.h4,
                            color: theme.colors.background2,
                          ),
                          const SizedBox(
                            height: verticalSpacing,
                          ),
                          LegendText(
                            "Color Themes for every liking",
                            style: theme.typography.h2,
                            color: theme.colors.background2,
                          ),
                        ],
                      ),
                    ),
                    child: SizedBox(
                      height: 400,
                      child: Row(
                        children: [],
                      ),
                    ),
                  ),
                  LegendSection(
                    spacing: verticalPadding2,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    color: theme.colors.background2,
                    title: Center(
                      child: Column(
                        children: [
                          LegendText(
                            "Sizing",
                            style: theme.typography.h4,
                          ),
                          const SizedBox(
                            height: verticalSpacing,
                          ),
                          LegendText(
                            "Dynamic Sizing for every Screen Resolution imaginable",
                            style: theme.typography.h2,
                          ),
                        ],
                      ),
                    ),
                    child: SizedBox(
                      height: 400,
                      child: Row(
                        children: [],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
