import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_widgets/input/form/legendForm.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';

class ThemeEditor extends StatelessWidget {
  const ThemeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              LegendFormField.color(
                text: LegendTextField(
                  decoration: LegendInputDecoration.rounded(
                    textColor: Colors.white,
                  ),
                ),
                title: "Primary Color",
              ),
            ],
          ),
        );
      },
    );
  }
}
