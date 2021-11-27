import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/router/routes/route_info.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/input/form/legendForm.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';
import 'package:legend_design_widgets/layout/grid/legendGrid.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/src/provider.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return LegendScaffold(
      pageName: 'Form',
      layoutType: LayoutType.FixedHeader,
      showSiderMenu: false,
      isUnderlyingRoute: true,
      contentBuilder: (context) {
        return Column(
          children: [
            LegendForm(
              children: [
                LegendFormField.text(
                  text: LegendTextField(
                    decoration: LegendInputDecoration.rounded(
                      focusColor: Colors.teal,
                      textColor: Colors.grey[800],
                      radius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  onSave: (value) {
                    print("save $value");
                  },
                ),
                LegendFormField.text(
                  isRequired: true,
                  text: LegendTextField(
                    decoration: LegendInputDecoration.rounded(
                      focusColor: Colors.teal,
                      textColor: Colors.grey[800],
                      radius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  onSave: (value) {
                    print("save $value");
                  },
                ),
                LegendFormRow(
                  children: [
                    LegendFormField.boolean(
                      title: "Test",
                      isRequired: true,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    LegendFormField.boolean(
                      isRequired: true,
                      title: "Test",
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
