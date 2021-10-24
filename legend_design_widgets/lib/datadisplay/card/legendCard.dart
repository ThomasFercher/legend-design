import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:legend_design_core/typography/legendText.dart';
import 'package:legend_design_core/typography/typography.dart';

import 'package:provider/provider.dart';

class LegendCard extends StatelessWidget {
  const LegendCard({
    this.height,
    this.width,
    this.icon,
    this.subtitle,
    this.title,
    this.value,
    this.children,
  });

  final double? height;
  final double? width;
  final String? title;
  final String? value;
  final String? subtitle;
  final IconData? icon;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    print(theme);
    List<Widget> content = [
      Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: LegendText(
                    text: title ?? "",
                    textStyle: LegendTextStyle.h3().copyWith(
                      color: theme.colors.foreground[3],
                    ),
                  ),
                ),
                LegendText(
                  text: subtitle ?? "",
                  textStyle: LegendTextStyle.h3().copyWith(
                    color: Colors.greenAccent[400],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  size: 64,
                  color: Colors.pinkAccent,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: LegendText(
                      text: value ?? "",
                      textStyle: LegendTextStyle.h2().copyWith(
                        color: theme.colors.foreground[3],
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ];
    if (children != null) content.addAll(children!);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
          ),
        ],
        color: theme.colors.foreground[1],
        borderRadius: theme.sizing.borderRadius[1],
      ),
      padding: EdgeInsets.all(
        18.0,
      ),
      child: Stack(
        children: content,
      ),
    );
  }
}
