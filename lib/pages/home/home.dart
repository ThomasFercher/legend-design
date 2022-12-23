import 'package:flutter/material.dart';
import 'package:legend_design/widgets/background_painter.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_config.dart';
import 'package:legend_design_core/layout/appBar.dart/legend_sliverbar.dart';
import 'package:legend_design_core/layout/navigation/section/legend_section.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/libraries/scaffold.dart';
import 'package:legend_design_core/state/legend_state.dart';
import 'package:legend_design_widgets/datadisplay/carousel/legend_carousel.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/tag/legendTag.dart';
import 'package:legend_design_widgets/input/button/legendButton/legend_button.dart';
import 'package:rive/rive.dart';

class Home extends LegendWidget {
  const Home();

  @override
  Widget build(BuildContext context, LegendTheme theme) {
    const double verticalSpacing = 32;

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
                      vertical: verticalSpacing * 4,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: LegendText(
                            "Legend Design",
                            style: theme.typography.h5.copyWith(
                              fontSize: verticalSpacing * 1.8,
                            ),
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
                              onTap: () {
                                LegendRouter.of(context)
                                    .pushPage("/getting-started");
                              },
                              background: theme.colors.primary,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            LegendButton.text(
                              background: Colors.cyan,
                              selBackground: Colors.cyanAccent,
                              elevation: 0,
                              selElevation: 2,
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              height: 48,
                              margin: EdgeInsets.all(4),
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                              text: "testaaaaaaaaaaaaaaaaaaaaaaaa",
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
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 96),
                    spacing: 48,
                    title: Column(
                      children: [
                        LegendText(
                          "Widget Library",
                          style: theme.typography.h4,
                        ),
                        const SizedBox(
                          height: 24,
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
                            child: LegendCarousel(
                              items: [
                                Container(
                                  color: Colors.yellow,
                                ),
                                Container(
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Row(
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
                                      text: "Text",
                                      style: theme.typography.h2.copyWith(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.zero,
                                      background: theme.colors.background1,
                                    ),
                                  ],
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
                    spacing: 48,
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 96),
                    color: Colors.blueGrey[900].darken(),
                    title: Column(
                      children: [
                        LegendText(
                          "Flexible Color Theme",
                          style: theme.typography.h4,
                        ),
                        const SizedBox(
                          height: 24,
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
                    spacing: 48,
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 96),
                    color: theme.colors.background2,
                    title: Column(
                      children: [
                        LegendText(
                          "Sizing",
                          style: theme.typography.h4,
                        ),
                        const SizedBox(
                          height: 24,
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
