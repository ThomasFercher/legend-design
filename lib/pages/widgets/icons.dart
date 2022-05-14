import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/layout/scaffold/config/whether.dart';
import 'package:legend_design_core/styles/sizing/size_info.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/dynamic_flex_layout.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/items/legendFlexItem.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/items/legendLayoutItem.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/legend_custom_flex_layout.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/legend_dynamic_flex_layout.dart';
import 'package:provider/src/provider.dart';

class IconsPage extends StatelessWidget {
  const IconsPage({Key? key}) : super(key: key);
  /*  Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GradientIcon(
                  Icons.read_more,
                  64,
                  LinearGradient(
                    colors: [
                      Colors.greenAccent,
                      Colors.greenAccent[700]!,
                    ],
                  ),
                ),
                GradientIcon(
                  Icons.data_saver_off,
                  64,
                  LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.deepPurple,
                    ],
                  ),
                ),
                GradientIcon(
                  Icons.adb_sharp,
                  64,
                  LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.redAccent,
                    ],
                  ),
                ),
              ],
            ),*/
  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();
    double width = SizeInfo.of(context).width;
    return LegendRouteBody(
      builder: (context, s) {
        return Column(
          children: [
            LegendDynamicFlexLayout(
              heights: [
                1200,
                800,
              ],
              dynamicLayout: DynamicFlexLayout(
                width: width,
                splits: [
                  600,
                  1200,
                ],
                items: [
                  LegendLayoutColumn(
                    children: [
                      LegendLayoutWidget(0),
                      LegendLayoutWidget(1),
                      LegendLayoutWidget(2),
                      LegendLayoutWidget(3),
                      LegendLayoutWidget(4),
                      LegendLayoutWidget(5),
                    ],
                  ),
                  LegendLayoutRow(
                    spacing: 12,
                    children: [
                      LegendLayoutWidget(0),
                      LegendLayoutColumn(
                        spacing: 12,
                        children: [
                          LegendLayoutWidget(1),
                          LegendLayoutColumn(
                            spacing: 12,
                            children: [
                              LegendLayoutWidget(2),
                              LegendLayoutWidget(3),
                              LegendLayoutColumn(
                                childrenFlex: [
                                  ChildrenFlexValue(1),
                                  ChildrenFlexValue(3),
                                ],
                                spacing: 12,
                                children: [
                                  LegendLayoutWidget(4),
                                  LegendLayoutWidget(
                                    5,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                        childrenFlex: [
                          ChildrenFlexValue(1),
                          ChildrenFlexWidth(200),
                        ],
                      )
                    ],
                    childrenFlex: [
                      ChildrenFlexValue(1),
                      ChildrenFlexWidth(300),
                    ],
                  ),
                ],
              ),
              layout: LegendCustomFlexLayout.dyna(
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            /*    LegendGrid.fixedCrossAxisCount(
              crossAxisCount: 4,
              verticalSpacing: 16,
              horizontalSpacing: 32,
              rowHeight: 64,
              children: [
                Container(
                  height: 64,
                  width: 600,
                  color: Colors.red,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.yellow,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.green,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.black,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.yellow,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.green,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            LegendGrid.fixedCrossAxisCountWithHeighz(
              crossAxisCount: 3,
              verticalSpacing: 16,
              horizontalSpacing: 32,
              rowHeights: [
                64,
                64,
                64,
                100,
                100,
                100,
              ],
              children: [
                Container(
                  height: 64,
                  width: 600,
                  color: Colors.red,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.yellow,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.green,
                ),
                Container(
                  height: 64,
                  width: 600,
                  color: Colors.red,
                ),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.green,
                ),
              ],
            ),
            LegendGrid.contentSized(
              rowHeight: 80,
              verticalSpacing: 16,
              horizontalSpacing: 32,
              children: [
                Container(
                  height: 64,
                  width: 600,
                  color: Colors.red,
                ),
                Container(
                  height: 80,
                  width: 64,
                  color: Colors.yellow,
                ),
                Container(
                  height: 100,
                  width: 64,
                  color: Colors.yellow,
                ),
                Container(
                  height: 64,
                  width: 64,
                  color: Colors.green,
                ),
              ],
            ),*/
          ],
        );
      },
    );
  }
}
