import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../styles/theming/legendTheme.dart';

class FixedFooter extends StatelessWidget {
  final double? height;

  const FixedFooter({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);

    return Hero(
      tag: ValueKey("footer"),
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: theme.colors.foreground[0],
          height: height ?? 120,
          child: Center(
            child: Text("Footer"),
          ),
        ),
      ),
    );
  }
}
