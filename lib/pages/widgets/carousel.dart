import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_palette.dart';
import 'package:legend_design_core/styles/theming/colors/legend_colors.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/carousel/legendCarousel.dart';
import 'package:legend_design_widgets/datadisplay/header/legendHeader.dart';
import 'package:legend_design_widgets/datadisplay/table/legendRowValue.dart';
import 'package:legend_design_widgets/datadisplay/table/legendTable.dart';
import 'package:legend_design_widgets/datadisplay/table/legendTableCell.dart';
import 'package:legend_design_widgets/input/text/paragraph/legendParagraph.dart';
import 'package:provider/src/provider.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    ParagraphType heading =
        ParagraphType(textStyle: theme.typography.h5, bottom: 8);
    ParagraphType heading2 =
        ParagraphType(textStyle: theme.typography.h4, bottom: 6);
    ParagraphType content =
        ParagraphType(textStyle: theme.typography.h1, bottom: 32);

    return LegendScaffold(
      pageName: 'Carousel',
      layoutType: LayoutType.FixedHeader,
      showSiderMenu: false,
      isUnderlyingRoute: true,
      disableContentDecoration: true,
      contentBuilder: (context, s) {
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
            Container(
              margin: EdgeInsets.all(theme.sizing.padding[0] * 2),
              padding: EdgeInsets.all(theme.sizing.padding[0] * 1.5),
              decoration: BoxDecoration(
                color: theme.colors.foreground[0],
                borderRadius: theme.sizing.borderRadius[0],
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LegendParagraph(
                    margin: EdgeInsets.only(
                      bottom: 8,
                    ),
                    values: {
                      heading: "Carousel",
                      content:
                          "Carousel is a widget that displays a set of items in a carousel. It is a special type of scrollable list that can be used to display a series of elements. The user can swipe left and right on the carousel to scroll through the list of items. The carousel can be controlled using a controller that can be used to control the carousel programmatically. ",
                      heading2: "When to use",
                      content.withId:
                          "Carousel is a widget that displays a set of items in a carousel. It is a special type of scrollable list that can be used to display a series of elements. The user can swipe left and right on the carousel to scroll through the list of items. The carousel can be controlled using a controller that can be used to control the carousel programmatically. ",
                    },
                  ),
                  LegendHeader(
                    margin: EdgeInsets.only(
                      bottom: 32,
                    ),
                    spacing: 8,
                    header: LegendText(
                      text: "Api",
                      textStyle: theme.typography.h4,
                    ),
                    child: LegendTable(
                      columnNames: [
                        "Parameter",
                        "Description",
                        "Type",
                      ],
                      showHeader: true,
                      style: LegendTableStyle(
                        backgroundColor: theme.colors.foreground[1],
                        selectionColor: LegendColorPalette.lighten(
                          theme.colors.foreground[1],
                        ),
                        borderRadiusGeometry: theme.sizing.borderRadius[1],
                        textStyle: theme.typography.h1,
                        rowPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        headerColor: LegendColorPalette.lighten(
                          theme.colors.foreground[1],
                        ),
                        headerTextStyle: theme.typography.h0,
                      ),
                      rowHeight: 56,
                      columnTypes: [
                        LegendTableValueType.TEXT,
                        LegendTableValueType.TEXT,
                        LegendTableValueType.TAG,
                      ],
                      flexValues: [
                        1,
                        4,
                        2,
                      ],
                      values: [
                        LegendRowValue(
                          fields: [
                            "items",
                            "List of Widgets which will be displayed in the carousel.",
                            [
                              ["List<Widget>", Colors.teal],
                              ["required", Colors.red],
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
                              ["Duration", Colors.orange],
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
                                Colors.grey,
                              ],
                              ["nullable", Colors.pink],
                            ],
                          ],
                        )
                      ],
                    ),
                  ),
                  LegendHeader(
                    margin: EdgeInsets.only(
                      bottom: 32,
                    ),
                    spacing: 8,
                    header: LegendText(
                      text: "Example",
                      textStyle: theme.typography.h4,
                    ),
                    child: ClipRRect(
                      borderRadius: theme.sizing.borderRadius[0],
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
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
