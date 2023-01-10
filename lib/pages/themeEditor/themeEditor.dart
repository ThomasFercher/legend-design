import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_core/widgets/size_info.dart';
import 'package:legend_design_widgets/input/button/legendButton/legend_button.dart';
import 'package:legend_design_widgets/input/form/legendForm.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/dynamic_flex_layout.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/form/legendCustomFormLayout.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/form/legendDynamicFormLayout.dart';
import 'package:legend_design_widgets/layout/dynamic/flex/items/legendLayoutItem.dart';
import 'package:legend_utils/legend_utils.dart';

class ThemeEditor extends StatefulWidget {
  const ThemeEditor({Key? key}) : super(key: key);

  @override
  State<ThemeEditor> createState() => _ThemeEditorState();
}

class _ThemeEditorState extends State<ThemeEditor> {
  LegendPalette? _colorPalette;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    _colorPalette = theme.colors;

    double width = SizeInfo.of(context).width;
    return LegendRouteBody(
      builder: (context, size) {
        return Column(
          children: [
            SizedBox(
              child: LegendForm(
                onChanged: (values) {
                  print(values);
                },
                buildSubmitButton: (state, a) {
                  print(a);
                  return Container(
                    width: width / 2,
                    child: LegendButton(
                      background: Colors.blue,
                      onTap: () {},
                      text: LegendText(
                        style: theme.typography.h2,
                        "Save",
                      ),
                    ),
                  );
                },
                //  height: 400,
                children: [
                  LegendDynamicFormLayout(
                    layout: LegendCustomFormLayout.dyna(
                      fields: [
                        LegendFormField.color(
                          text: LegendTextField(
                            decoration: LegendInputDecoration.rounded(
                              textColor: Colors.red,
                            ),
                          ),
                          title: "Primary Color",
                        ),
                        LegendFormField.color(
                          text: LegendTextField(
                            decoration: LegendInputDecoration.rounded(
                              textColor: Colors.red,
                            ),
                          ),
                          title: "Primary Color",
                        ),
                        LegendFormField.color(
                          text: LegendTextField(
                            decoration: LegendInputDecoration.rounded(
                              textColor: Colors.red,
                            ),
                          ),
                          title: "Primary Color",
                        ),
                        LegendFormField.color(
                          text: LegendTextField(
                            decoration: LegendInputDecoration.rounded(
                              textColor: Colors.white,
                            ),
                          ),
                          title: "Secondary Color",
                        ),
                        LegendFormField.color(
                          text: LegendTextField(
                            decoration: LegendInputDecoration.rounded(
                              textColor: Colors.red,
                            ),
                          ),
                          title: "Primary Color",
                        ),
                        LegendFormField.color(
                          text: LegendTextField(
                            decoration: LegendInputDecoration.rounded(
                              textColor: Colors.red,
                            ),
                          ),
                          title: "Primary Color",
                        ),
                        LegendFormField.color(
                          text: LegendTextField(
                            decoration: LegendInputDecoration.rounded(
                              textColor: Colors.red,
                            ),
                          ),
                          title: "Primary Color",
                        ),
                        LegendFormField.color(
                          text: LegendTextField(
                            decoration: LegendInputDecoration.rounded(
                              textColor: Colors.white,
                            ),
                          ),
                          title: "Secondary Color",
                        ),
                      ],
                    ),
                    dynamicLayout: DynamicFlexLayout(
                      width: width,
                      splits: [960, 1200, 1600],
                      items: [
                        LegendLayoutColumn(
                          children: [
                            LegendLayoutWidget(
                              0,
                            ),
                            LegendLayoutWidget(
                              1,
                            ),
                            LegendLayoutWidget(
                              2,
                            ),
                            LegendLayoutWidget(
                              3,
                            ),
                            LegendLayoutWidget(
                              4,
                            ),
                            LegendLayoutWidget(
                              5,
                            ),
                            LegendLayoutWidget(
                              6,
                            ),
                            LegendLayoutWidget(
                              7,
                            ),
                          ],
                        ),
                        LegendLayoutColumn(
                          children: [
                            LegendLayoutRow(
                              spacing: 48,
                              children: [
                                LegendLayoutColumn(
                                  children: [
                                    LegendLayoutWidget(
                                      0,
                                    ),
                                    LegendLayoutWidget(
                                      2,
                                    ),
                                    LegendLayoutWidget(
                                      4,
                                    ),
                                    LegendLayoutWidget(
                                      6,
                                    ),
                                  ],
                                ),
                                LegendLayoutColumn(
                                  children: [
                                    LegendLayoutWidget(
                                      1,
                                    ),
                                    LegendLayoutWidget(
                                      3,
                                    ),
                                    LegendLayoutWidget(
                                      5,
                                    ),
                                    LegendLayoutWidget(
                                      7,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        LegendLayoutColumn(
                          children: [
                            LegendLayoutRow(
                              children: [
                                LegendLayoutWidget(
                                  0,
                                ),
                                LegendLayoutWidget(
                                  1,
                                ),
                                LegendLayoutWidget(
                                  2,
                                ),
                              ],
                            ),
                            LegendLayoutRow(
                              children: [
                                LegendLayoutWidget(
                                  3,
                                ),
                                LegendLayoutWidget(
                                  4,
                                ),
                                LegendLayoutWidget(
                                  5,
                                ),
                              ],
                            ),
                            LegendLayoutRow(
                              children: [
                                LegendLayoutWidget(
                                  6,
                                ),
                                LegendLayoutWidget(
                                  7,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    heights: [
                      800,
                      400,
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              height: 1200,
              child: Container(),
              decoration: BoxDecoration(
                color: theme.colors.background2,
                borderRadius: theme.sizing.radius2.asRadius(),
              ),
              width: width,
            ),
          ],
        );
      },
    );
  }
}
