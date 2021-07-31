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
  final bool? isCard;
  final EdgeInsets? margin;

  LegendSelectBar({
    required this.options,
    required this.onSelected,
    required this.aligment,
    this.iconSize,
    this.isCard,
    this.margin,
  });

  List<Widget> getOptions(BuildContext context) {
    List<Widget> widgets = [];

    for (LegendSelectOption o in options) {
      Widget w = new LegendSelectButton(
        option: o,
        size: iconSize ?? 24,
        onClick: (selOption) {
          Provider.of<LegendSelectProvider>(context, listen: false)
              .selectOption(o);
          onSelected(selOption);
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
      create: (c) => new LegendSelectProvider(options.first),
      builder: (context, snapshot) {
        return Padding(
          padding: margin ?? EdgeInsets.all(4.0),
          child: Container(
            padding: EdgeInsets.all(sizing.borderRadius.bottomLeft.x / 2),
            decoration: isCard ?? false
                ? BoxDecoration(
                    borderRadius: sizing.borderRadius,
                    color: LegendColorTheme.darken(theme.primaryColor, 0.08),
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
                  )
                : null,
            child: Row(
              mainAxisAlignment: aligment ?? MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getOptions(context),
            ),
          ),
        );
      },
    );
  }
}
