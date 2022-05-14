import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/layout/scaffold/config/whether.dart';
import 'package:legend_design_core/styles/sizing/size_info.dart';
import 'package:legend_design_core/styles/typography/legend_text.dart';
import 'package:legend_design_widgets/layout/dynamic/custom/legend_widget_layout.dart';
import 'package:provider/src/provider.dart';

class ModalsPage extends StatelessWidget {
  const ModalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();
    double width = SizeInfo.of(context).width;
    return LegendRouteBody(
      builder: (context, s) {
        return Column(
          children: [
            LegendText(
              text:
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
              textStyle: theme.typography.h1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
            ),
            Container(
              child: LegendWidgetLayout.dyn(
                layouts: {
                  400: LegendCustomRow(
                    children: [
                      LegendCustomColumn(
                        children: [
                          LegendCustomWidget(0),
                        ],
                      ),
                      LegendCustomColumn(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LegendCustomWidget(1),
                          LegendCustomWidget(2),
                          LegendCustomWidget(3),
                        ],
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                  ),
                  /*1000: LegendCustomRow(
                    [
                      LegendCustomWidget(0),
                      LegendCustomWidget(1),
                      LegendCustomWidget(2),
                      LegendCustomWidget(3),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                  ),
                  1400: LegendCustomRow(
                    [
                      LegendCustomWidget(0),
                      LegendCustomWidget(1),
                      LegendCustomColumn(
                        [
                          LegendCustomWidget(2),
                          LegendCustomWidget(3),
                        ],
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.end,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                  ),*/
                },
                width: width,
                children: [
                  Container(
                    width: 200,
                    child: LegendText(
                      text:
                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                      textStyle: theme.typography.h1,
                    ),
                  ),
                  Container(
                    height: 20,
                    color: Colors.blue,
                    width: 40,
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            /*  Container(
              child: LegendWidgetLayout(
                layout: LegendCustomColumn(
                  [
                    LegendCustomWidget(0),
                    LegendCustomWidget(1),
                    LegendCustomWidget(2),
                    LegendCustomWidget(3),
                  ],
                  spacing: 12,
                  flex: 2,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
                children: [
                  Container(
                    //   width: 200,
                    child: LegendText(
                      text:
                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                      textStyle: theme.typography.h1,
                    ),
                  ),
                  Container(
                    height: 20,
                    color: Colors.blue,
                    width: 40,
                  ),
                  Container(
                    height: 100,
                    // width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              child: LegendWidgetLayout(
                layout: LegendCustomColumn(
                  [
                    LegendCustomWidget(0),
                    LegendCustomRow(
                      [
                        LegendCustomWidget(
                          1,
                          flex: 1,
                        ),
                        LegendCustomWidget(
                          2,
                          flex: 4,
                        ),
                        LegendCustomWidget(3),
                      ],
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.end,

                      // crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ],
                  spacing: 12,
                ),
                children: [
                  Container(
                    height: 40,
                    color: Colors.green,
                  ),
                  Container(
                    height: 50,
                    color: Colors.brown,
                  ),
                  Container(
                    height: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 120,
                    width: 100,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              child: LegendWidgetLayout(
                layout: LegendCustomColumn(
                  [
                    LegendCustomWidget(0),
                    LegendCustomRow(
                      [
                        LegendCustomWidget(
                          1,
                        ),
                        LegendCustomWidget(2),
                        LegendCustomWidget(3),
                      ],
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      expandCrossAxis: true,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ],
                  spacing: 4,
                ),
                children: [
                  Container(
                    height: 40,
                    color: Colors.green,
                  ),
                  Container(
                    // height: 50,
                    width: 20,
                    color: Colors.brown,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 120,
                    width: 100,
                    color: Colors.green,
                  ),
                ],
              ),
            ),*/
            /*  LegendGrid(
              sizes: LegendGridSize(
                small: LegendGridSizeInfo(1, 48),
                medium: LegendGridSizeInfo(3, 48),
                large: LegendGridSizeInfo(4, 48),
                xxl: LegendGridSizeInfo(4, 48),
              ),
              children: [
                LegendButton(
                  text: Text("Show Success Alert"),
                  onPressed: () {
                    LegendPopups.showAlert(
                      context: context,
                      alert: LegendAlert.success(
                        message: "Ja geschafft du verdammta Trottlwichsa!",
                      ),
                    );
                  },
                  style: LegendButtonStyle.normal(
                    borderRadius: Radius.circular(
                      theme.sizing.borderInset[1],
                    ),
                  ),
                ),
                LegendButton(
                  text: Text("Show Modal Bottom"),
                  onPressed: () => {
                    Scaffold.of(context).showBottomSheet(
                      (context) {
                        return LegendBottomSheet(
                          title: "Cookies",
                          onCancel: () {},
                          onConfirm: () {},
                          content: LegendText(
                            text: "Bitte aktzeptieren Sie unsere Cookies! LIT",
                            textStyle: theme.typography.h4,
                          ),
                        );
                      },
                      backgroundColor: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                    ),
                  },
                  style: LegendButtonStyle.normal(
                    borderRadius: Radius.circular(
                      theme.sizing.borderInset[1],
                    ),
                  ),
                ),
                LegendButton(
                  text: Text("Show Modal"),
                  onPressed: () => {
                    LegendPopups.showLegendModal(
                      context: context,
                      modal: Modal(
                        content: Text("test"),
                        onConfirm: () => {},
                        onCancle: () => {},
                        height: 400,
                        width: 400,
                      ),
                    ),
                  },
                  style: LegendButtonStyle.normal(
                    borderRadius: Radius.circular(
                      theme.sizing.borderInset[1],
                    ),
                  ),
                )
              ],
            ),*/
          ],
        );
      },
    );
  }
}
