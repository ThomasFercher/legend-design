import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/sections/section_header.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';

import 'package:provider/provider.dart';

class Section extends StatelessWidget {
  final String? name;
  final List<Widget> children;
  final String header;
  final TextStyle? headerTextStyle;
  final double? margin;
  late final bool isFirst;
  late final bool isLast;

  Section({
    required this.header,
    required this.children,
    this.name,
    this.headerTextStyle,
    this.margin,
    bool? isFirst,
    bool? isLast,
  }) {
    this.isFirst = isFirst ?? false;
    this.isLast = isLast ?? false;
  }

  List<Widget> getWidgets() {
    List<Widget> widgets = [
      SectionHeader(
        text: header,
        textStyle: headerTextStyle,
      ),
    ];
    widgets.addAll(children);

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        margin: EdgeInsets.all(margin ?? 0),
        color: theme.colors.background[0],
        shape: RoundedRectangleBorder(
          borderRadius: theme.sizing.borderRadius[0],
        ),
        elevation: theme.colors.elevations?[0],
        child: Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(
            theme.sizing.borderInset[0] + 6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getWidgets(),
          ),
        ),
      );
    });
  }
}
