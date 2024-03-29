import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';

import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_utils/extensions/extensions.dart';
import 'package:legend_design_widgets/datadisplay/carousel/legend_carousel.dart';
import 'package:legend_design_widgets/datadisplay/header/legend_header.dart';
import 'package:legend_design_widgets/datadisplay/table/legendRowValue.dart';
import 'package:legend_design_widgets/datadisplay/table/legendTable.dart';
import 'package:legend_design_widgets/datadisplay/table/legendTableCell.dart';
import 'package:legend_design_widgets/input/text/paragraph/legendParagraph.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    ParagraphType heading = ParagraphType(theme.typography.h5, bottom: 8);
    ParagraphType heading2 = ParagraphType(theme.typography.h4, bottom: 6);
    ParagraphType content = ParagraphType(theme.typography.h1, bottom: 32);

    final tableStyle = LegendTableStyle(
      backgroundColor: theme.colors.background1,
      selectionColor: theme.colors.background2,
      borderRadiusGeometry: theme.sizing.radius2.asRadius(),
      textStyle: theme.typography.h1,
      rowPadding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      headerColor: theme.colors.background1,
      headerTextStyle: theme.typography.h3,
    );

    return LegendRouteBody(
      builder: (context, s) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendCarousel(
              height: 640,
              intervall: Duration(seconds: 20),
              items: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.teal,
                ),
                Container(
                  color: Colors.orange,
                ),
                Container(
                  color: Colors.green,
                ),
                Image.network(
                  "http://wallup.net/wp-content/uploads/2016/01/291399-California-landscape-mountain.jpg",
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.colors.background2,
                borderRadius: theme.sizing.radius1.asRadius(),
              ),
              padding: EdgeInsets.all(theme.sizing.spacing3),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LegendParagraph(
                    values: {
                      heading: "Carousel",
                      content:
                          "Carousel is a widget that displays a set of items in a carousel. It is a special type of scrollable list that can be used to display a series of elements. The user can swipe left and right on the carousel to scroll through the list of items. The carousel can be controlled using a controller that can be used to control the carousel programmatically. ",
                      heading2: "When to use",
                      content.withId:
                          "Carousel is a widget that displays a set of items in a carousel. It is a special type of scrollable list that can be used to display a series of elements. The user can swipe left and right on the carousel to scroll through the list of items. The carousel can be controlled using a controller that can be used to control the carousel programmatically. ",
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LegendHeader(
                    spacing: theme.sizing.spacing1,
                    header: LegendText(
                      "Api",
                      style: theme.typography.h4,
                    ),
                    child: LegendTable(
                      columnNames: [
                        "Parameter",
                        "Description",
                        "Type",
                      ],
                      style: tableStyle,
                      rowHeight: 56,
                      columnTypes: [
                        LegendTableValueType.TEXT,
                        LegendTableValueType.TEXT,
                        LegendTableValueType.TAG,
                      ],
                      flexValues: [
                        1,
                        3,
                        2,
                      ],
                      values: [
                        LegendRowValue(
                          fields: [
                            "items",
                            "List of Widgets which will be displayed in the carousel.",
                            [
                              ["List<Widget>", Colors.blue],
                              ["required", Colors.purple[400]!],
                            ],
                          ],
                        ),
                        LegendRowValue(
                          fields: [
                            "height",
                            "This controlls the height of the carousel.",
                            [
                              ["double", Colors.deepPurple],
                              ["nullable", Colors.pink],
                            ],
                          ],
                        ),
                        LegendRowValue(
                          fields: [
                            "width",
                            "This controlls the width of the carousel.",
                            [
                              ["double", Colors.deepPurple],
                              ["nullable", Colors.pink],
                            ],
                          ],
                        ),
                        LegendRowValue(
                          fields: [
                            "intervall",
                            "If specified the carousel will automatically scroll to the next item after the given duration.",
                            [
                              ["Duration", Colors.orange[400]!],
                              ["nullable", Colors.pink],
                            ],
                          ],
                        ),
                        LegendRowValue(
                          fields: [
                            "padding",
                            "Padding which will be applied to all items.",
                            [
                              [
                                "EdgeInsetGeometry",
                                Colors.blueGrey[400]!,
                              ],
                              ["nullable", Colors.pink],
                            ],
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  /*  LegendHeader(
                    margin: EdgeInsets.only(
                      bottom: 32,
                    ),
                    spacing: 8,
                    header: LegendText(
                      "Example",
                      textStyle: theme.typography.h4,
                    ),
                    child: ClipRRect(
                      borderRadius: theme.sizing.radius1.asRadius(),
                      child: HighlightView(
                        "LegendCarousel(\n"
                        "  height: 640,\n"
                        "  intervall: Duration(seconds: 20),\n"
                        "  items: [\n"
                        "    Container(\n"
                        "      color: Colors.red,\n"
                        "     ),\n"
                        "    Container(\n"
                        "      color: Colors.teal,\n"
                        "    ),\n"
                        "    Container(\n"
                        "       color: Colors.orange,\n"
                        "    ),\n"
                        "    Container(\n"
                        "     color: Colors.green,\n"
                        "    ),\n"
                        "    Image.network(\n"
                        "     \"http://wallup.net/wp-content/uploads/2016/01/22291399-California-landscape-mountain.jpg\",\n"
                        "     fit: BoxFit.cover,\n"
                        "    ),\n"
                        " ],\n"
                        "),\n",
                        textStyle: theme.typography.h1.copyWith(
                          color: LegendColors.gray5,
                        ),
                        padding: EdgeInsets.all(theme.sizing.padding[2]),
                        language: 'dart',
                        theme: atomOneDarkTheme,
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
