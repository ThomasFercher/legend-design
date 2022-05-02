import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/layout/scaffold/config/whether.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';
import 'package:provider/src/provider.dart';

class TextfieldPage extends StatelessWidget {
  const TextfieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();
    return LegendScaffold(
        pageName: 'Textfield',
        layoutType: LayoutType.FixedHeader,
        whether: ScaffoldWhether(
          showSiderMenu: false,
          isUnderlyingRoute: true,
        ),
        child: Column(
          children: [
            LegendTextField(
              decoration: LegendInputDecoration.rounded(
                focusColor: Colors.teal,
                textColor: Colors.grey[800],
                radius: BorderRadius.all(
                  Radius.circular(2),
                ),
              ),
            ),
          ],
        ));
  }
}
