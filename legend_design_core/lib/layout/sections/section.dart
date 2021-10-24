import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/sections/sectionHeader.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';

import 'package:provider/provider.dart';

class Section extends StatelessWidget {
  final String? name;
  final List<Widget> children;
  final String header;
  final TextStyle? headerTextStyle;
  final double? verticalSpacing;
  final double? margin;

  Section({
    required this.header,
    required this.children,
    this.name,
    this.headerTextStyle,
    this.verticalSpacing,
    this.margin,
  });

  List<Widget> getWidgets() {
    List<Widget> widgets = [
      SectionHeader(
        text: header,
        textStyle: headerTextStyle,
      ),
    ];
    widgets.addAll(children);
    if (verticalSpacing != null) {
      for (var i = 1; i < widgets.length; i += 2) {
        widgets.insert(
          i,
          Padding(
            padding: EdgeInsets.only(top: verticalSpacing!),
          ),
        );
      }
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Container(
      color: Colors.transparent,
      child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.all(margin ?? 8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 24),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: theme.colors.foreground[0],
              borderRadius: theme.sizing.borderRadius[0],
            ),
            width: constraints.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getWidgets(),
            ),
          ),
        );
      }),
    );
  }
}
