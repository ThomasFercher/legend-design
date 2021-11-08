import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_widgets/input/form/legendForm.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';

class ThemeEditor extends StatelessWidget {
  const ThemeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      pageName: 'Theme Editor',
      children: [
        LegendForm(
          children: [],
        ),
      ],
    );
  }
}
