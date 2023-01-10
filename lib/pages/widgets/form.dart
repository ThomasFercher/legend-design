import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_widgets/input/form/legendForm.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    return LegendRouteBody(
      builder: ((context, s) {
        return Container(
          child: Column(
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
                    title: '',
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
                    title: '',
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
          ),
        );
      }),
    );
  }
}
