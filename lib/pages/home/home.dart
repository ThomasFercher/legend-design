import 'package:flutter/material.dart';
import 'package:legend_design/widgets/background_painter.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_config.dart';
import 'package:legend_design_core/layout/appBar.dart/legend_sliverbar.dart';
import 'package:legend_design_core/layout/navigation/section/legend_section.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/libraries/scaffold.dart';
import 'package:legend_design_core/state/legend_state.dart';
import 'package:legend_design_core/widgets/elevation/animated_card.dart';
import 'package:legend_design_widgets/datadisplay/carousel/legend_carousel.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/header/legend_header.dart';
import 'package:legend_design_widgets/datadisplay/tag/legendTag.dart';
import 'package:legend_design_widgets/input/button/legendButton/legend_button.dart';
import 'package:rive/rive.dart';

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
            SizedBox(
              height: 400,
              child: RiveAnimation.asset(
                "assets/flares/banner.riv",
                stateMachines: ["State Machine 1"],
                fit: BoxFit.cover,
              ),
            ),
            CustomPaint(
              painter: BackgroundPainter(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LegendSection(
                    padding: EdgeInsets.symmetric(
                      vertical: verticalPadding,
                      horizontal: horizontalPadding,
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
                              width: 160,
                              text: "Get Started",
                              style: theme.typography.h2.copyWith(
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.all(8),
                              elevation: 0,
                              selElevation: 2,
                              height: 64,
                              padding: EdgeInsets.symmetric(horizontal: 24),
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
                              width: 160,
                              background: Colors.pink,
                              selBackground: Colors.pinkAccent,
                              elevation: 0,
                              selElevation: 2,
                              style: theme.typography.h2.copyWith(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
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
                    title: Column(
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
                    child: SizedBox(
                      height: 400,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: theme.sizing.radius4.asRadius(),
                              child: LegendCarousel(
                                items: [
                                  Container(
                                    color: theme.colors.primary,
                                    child: LegendText(""),
                                  ),
                                  Container(
                                    color: theme.colors.secondary,
                                    child: LegendText(""),
                                  ),
                                  Container(
                                    color: theme.colors.tertiary,
                                    child: LegendText(""),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                AnimatedCard(
                                  width: 260,
                                  elevation: 1,
                                  background: theme.colors.background3,
                                  borderRadius: theme.sizing.radius4.asRadius(),
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
                                            MainAxisAlignment.center,
                                        children: [
                                          LegendTag.fromColor(
                                            color: Colors.red,
                                            text: "cool",
                                          ),
                                          LegendTag.fromColor(
                                            color: Colors.red,
                                            text: "legendary",
                                          ),
                                          LegendTag.fromColor(
                                            color: Colors.red,
                                            text: "chill",
                                          ),
                                        ].spacingInsideColumn(24),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedCard(
                                  width: 260,
                                  background: theme.colors.background3,
                                  borderRadius: theme.sizing.radius4.asRadius(),
                                  elevation: 1,
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
                                            MainAxisAlignment.center,
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
                                            text: "Text",
                                            style: theme.typography.h2.copyWith(
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.zero,
                                            background:
                                                theme.colors.background1,
                                          ),
                                        ].spacingInsideColumn(24),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Expanded(
                          //   child: LegendTable(
                          //     style: LegendTableStyle(
                          //       textStyle: theme.typography.h2,
                          //       backgroundColor: theme.colors.background1,
                          //       selectionColor: theme.colors.selection,
                          //       borderRadiusGeometry: BorderRadius.zero,
                          //     ),
                          //     columnTypes: [
                          //       LegendTableValueType.TEXT,
                          //       LegendTableValueType.TAG,
                          //       LegendTableValueType.ACTION,
                          //     ],
                          //     values: [
                          //       LegendRowValue(
                          //         fields: [
                          //           "John Doe",
                          //           [
                          //             ["Developer", Colors.redAccent],
                          //             ["Designer", Colors.blueAccent],
                          //           ],
                          //           "Test"
                          //         ],
                          //       ),
                          //       LegendRowValue(
                          //         fields: [
                          //           "John Doe",
                          //           [
                          //             ["Developer", Colors.redAccent],
                          //             ["Designer", Colors.blueAccent],
                          //           ],
                          //           "Test"
                          //         ],
                          //       ),
                          //       LegendRowValue(
                          //         fields: [
                          //           "John Doe",
                          //           [
                          //             ["Developer", Colors.redAccent],
                          //             ["Designer", Colors.blueAccent],
                          //           ],
                          //           "Test"
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  LegendSection(
                    spacing: verticalPadding2,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    color: Colors.blueGrey[900].darken(),
                    title: Column(
                      children: [
                        LegendText(
                          "Flexible Color Theme",
                          style: theme.typography.h4,
                        ),
                        const SizedBox(
                          height: verticalSpacing,
                        ),
                        LegendText(
                          "Color Themes for every liking",
                          style: theme.typography.h2,
                        ),
                      ],
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
                    title: Column(
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
