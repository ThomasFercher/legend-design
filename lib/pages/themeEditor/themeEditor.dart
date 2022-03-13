import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_widgets/input/form/legendForm.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';
import 'package:legend_design_widgets/layout/customFlexLayout/legend_custom_flex_layout.dart';
import 'package:provider/provider.dart';

class ThemeEditor extends StatelessWidget {
  const ThemeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return LegendScaffold(
      pageName: 'Theme Editor',
      layoutType: LayoutType.FixedHeader,
      contentBuilder: (context, size) {
        return SizedBox(
          width: size.width,
          child: LegendForm(
            onChanged: (values) {
              print(values);
            },
            height: 400,
            children: [
              LegendCustomFlexFormLayout(
                height: 400,
                dynamicItem: DynamicFlexItem(splits: [
                  720,
                  1080,
                  2560,
                ], items: [
                  LegendFlexItem.column(
                    childrenIndex: [0, 1, 2, 3, 4],
                  ),
                  LegendFlexItem.column(
                    childrenFlex: [1, 1, 1],
                    children: [
                      LegendFlexItem.row(
                        childrenIndex: [0, 1],
                        spacing: theme.sizing.padding[1],
                      ),
                      LegendFlexItem.row(
                        childrenIndex: [2, 3],
                        spacing: theme.sizing.padding[1],
                      ),
                      LegendFlexItem.row(
                        childrenIndex: [4, 4],
                        spacing: theme.sizing.padding[1],
                      ),
                    ],
                  ),
                  LegendFlexItem.column(
                    childrenFlex: [1, 1, 1],
                    children: [
                      LegendFlexItem.row(
                        childrenIndex: [0, 1, 2],
                        spacing: theme.sizing.padding[1],
                      ),
                      LegendFlexItem.row(
                        childrenIndex: [3, 4],
                        spacing: theme.sizing.padding[1],
                      ),
                    ],
                  ),
                ]),
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
                        textColor: Colors.white,
                      ),
                    ),
                    title: "Secondary Color",
                  ),
                  LegendFormField.color(
                    text: LegendTextField(
                      decoration: LegendInputDecoration.rounded(
                        textColor: Colors.white,
                      ),
                    ),
                    title: "Selection Color",
                  ),
                  LegendFormField.color(
                    text: LegendTextField(
                      decoration: LegendInputDecoration.rounded(
                        textColor: Colors.white,
                      ),
                    ),
                    title: "Text Color Dark",
                  ),
                  LegendFormField.color(
                    text: LegendTextField(
                      decoration: LegendInputDecoration.rounded(
                        textColor: Colors.white,
                      ),
                    ),
                    title: "Text Color Light",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
