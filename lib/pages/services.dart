import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:legend_design_core/icons/legend_gradient_icon.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';

import 'package:legend_design_core/layout/sections/section.dart';

import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';

import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_widgets/datadisplay/card/legendCard.dart';
import 'package:legend_design_widgets/layout/grid/legendGrid.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';
import 'package:provider/src/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage();

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();

    return LegendScaffold(
      contentBuilder: (context) {
        return Container(
          child: Column(
            children: [
              Section(
                header: "Services",
                children: [
                  LegendGrid(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: [
                      LegendCard(
                        title: "Packages",
                        children: [
                          Positioned(
                            child: GradientIcon(
                              Icons.drive_file_move_rounded,
                              48,
                              LinearGradient(
                                colors: [
                                  Colors.orange[300]!,
                                  Colors.orangeAccent,
                                ],
                              ),
                            ),
                            right: 0,
                          ),
                          Align(
                            child: LegendText(
                              text: "We provide a whole ecosystem of packages.",
                              textStyle: theme.typography.h0,
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                      LegendCard(
                        title: "Prebuilt Apps",
                        children: [
                          Positioned(
                            child: GradientIcon(
                              Icons.web_stories,
                              48,
                              LinearGradient(
                                colors: [
                                  Colors.purple[300]!,
                                  Colors.deepPurple,
                                ],
                              ),
                            ),
                            right: 0,
                          ),
                          Align(
                            child: LegendText(
                              text:
                                  "Using our Design Templates simple Apps can be created on demand. We have a whole cataloge to choose from.",
                              textStyle: theme.typography.h0,
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                      LegendCard(
                        title: "Custom Apps",
                        children: [
                          Positioned(
                            child: GradientIcon(
                              Icons.laptop,
                              48,
                              LinearGradient(
                                colors: [
                                  Colors.green[300]!,
                                  Colors.greenAccent,
                                ],
                              ),
                            ),
                            right: 0,
                          ),
                          Align(
                            child: LegendText(
                              text:
                                  "We offer building and supporting your custom Application. ",
                              textStyle: theme.typography.h0,
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                      LegendCard(
                        title: "Consultation & Guidance",
                        children: [
                          Positioned(
                            child: GradientIcon(
                              Icons.help,
                              48,
                              LinearGradient(
                                colors: [
                                  Colors.red[300]!,
                                  Colors.red,
                                ],
                              ),
                            ),
                            right: 0,
                          ),
                          Align(
                            child: LegendText(
                              text:
                                  "We offer building and supporting your custom Application. ",
                              textStyle: theme.typography.h0,
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                    ],
                    sizes: LegendGridSize(
                      medium: LegendGridSizeInfo(
                        2,
                        140,
                      ),
                      small: LegendGridSizeInfo(
                        1,
                        140,
                      ),
                      xxl: LegendGridSizeInfo(
                        4,
                        140,
                      ),
                    ),
                  )
                ],
              ),
              Section(
                header: "Theme Editor",
                children: [],
              ),
            ],
          ),
        );
      },
      pageName: "Products",
      layoutType: LayoutType.FixedHeader,
    );
  }
}
