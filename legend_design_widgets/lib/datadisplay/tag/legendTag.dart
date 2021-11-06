import 'package:flutter/cupertino.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_theme.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:provider/src/provider.dart';

class LegendTag extends StatelessWidget {
  final Color color;
  final String text;
  final bool? dissmissable;

  const LegendTag({
    required this.color,
    required this.text,
    this.dissmissable,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return Container(
      height: 32,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: LegendColorTheme.lighten(color, 0.25),
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: LegendText(
        text: text,
        textStyle: theme.sizing.typography.h1.copyWith(
          color: color,
          fontSize: 16,
        ),
      ),
    );
  }
}
