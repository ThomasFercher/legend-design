import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:legend_design_core/typography/legendText.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_core/utils/legendUtils.dart';

import 'package:provider/provider.dart';

class FixedFooter extends StatelessWidget {
  final double? height;
  final WidgetBuilder builder;

  const FixedFooter({
    Key? key,
    this.height,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Hero(
      tag: ValueKey("footer"),
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: theme.colors.foreground[0],
          height: height,
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 1200,
            ),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Builder(builder: builder),
          ),
        ),
      ),
    );
  }
}
