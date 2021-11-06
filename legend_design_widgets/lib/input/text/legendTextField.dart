import 'package:flutter/material.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:provider/src/provider.dart';

class LegendTextField extends StatefulWidget {
  final LegendInputDecoration decoration;

  LegendTextField({
    required this.decoration,
    Key? key,
  }) : super(key: key);

  @override
  _LegendTextFieldState createState() => _LegendTextFieldState();
}

class _LegendTextFieldState extends State<LegendTextField> {
  late TextEditingController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();

    return Container(
      child: TextField(
        controller: ctrl,
        decoration: widget.decoration,
        cursorColor: widget.decoration.cursorColor,
        textAlignVertical: TextAlignVertical.top,
        onSubmitted: (value) {},
        onChanged: (value) {},
        style: theme.sizing.typography.h1.copyWith(
          color: widget.decoration.textColor,
        ),
        toolbarOptions:
            ToolbarOptions(copy: true, selectAll: true, paste: true, cut: true),
      ),
    );
  }
}
