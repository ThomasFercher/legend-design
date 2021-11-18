import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_widgets/input/form/legendForm.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';

class ThemeEditor extends StatelessWidget {
  const ThemeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      pageName: 'Theme Editor',
      children: [
        LegendForm(
          children: [
            LegendColorPicker(),
          ],
        ),
      ],
    );
  }
}

class LegendColorPicker extends StatefulWidget {
  LegendColorPicker({Key? key}) : super(key: key);

  @override
  _LegendColorPickerState createState() => _LegendColorPickerState();
}

class _LegendColorPickerState extends State<LegendColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ColorPicker(
        onColorChanged: (Color value) {},
        pickerColor: Colors.red,
      ),
    );
  }
}
