import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/icons/legendGradientIcon.dart';
import 'package:webstore/customwidgets/input/selectBar/selectProvider.dart';
import 'package:webstore/styles/legendColorTheme.dart';
import 'package:webstore/styles/legendSizingTheme.dart';
import 'package:webstore/styles/legendTheme.dart';

import 'legendSelectOption.dart';
import 'legendselectButton.dart';

class LegendSelectBar extends StatelessWidget {
  final List<LegendSelectOption> options;
  final void Function(LegendSelectOption selected) onSelected;
  final MainAxisAlignment? aligment;
  final double? iconSize;

  LegendSelectBar({
    required this.options,
    required this.onSelected,
    required this.aligment,
    this.iconSize,
  });

  List<Widget> getOptions(BuildContext context) {
    List<Widget> widgets = [];

    for (LegendSelectOption o in options) {
      Widget w = new LegendIconButton(
        option: o,
        size: iconSize ?? 24,
        onClick: (selOption) {
          onSelected(selOption);
          Provider.of<LegendSelectProvider>(context, listen: false)
              .selectOption(o);
        },
      );
      widgets.add(w);
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    LegendColorTheme theme = Provider.of<LegendTheme>(context).colors;
    LegendSizing sizing = Provider.of<LegendTheme>(context).sizing;

    return ListenableProvider<LegendSelectProvider>(
      create: (c) => LegendSelectProvider(options.first),
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.all(sizing.borderRadius.bottomLeft.x / 2),
          decoration: BoxDecoration(
            borderRadius: sizing.borderRadius,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 2,
                offset: Offset(
                  0,
                  1,
                ),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: aligment ?? MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: getOptions(context),
          ),
        );
      },
    );
  }
}
