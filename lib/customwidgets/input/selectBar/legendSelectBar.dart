import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/icons/legendGradientIcon.dart';
import 'package:webstore/customwidgets/input/selectBar/selectProvider.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';
import 'package:webstore/styles/theming/sizing/legendSizing.dart';
import 'package:webstore/styles/theming/sizing/legendSizingTheme.dart';
import 'package:webstore/styles/theming/legendTheme.dart';

import 'legendSelectOption.dart';
import 'legendselectButton.dart';

class LegendSelectBar extends StatelessWidget {
  final List<LegendSelectOption> options;
  final void Function(LegendSelectOption selected) onSelected;
  final MainAxisAlignment? aligment;
  final double? iconSize;
  final bool? isCard;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadius? borderRadius;

  LegendSelectBar({
    required this.options,
    required this.onSelected,
    required this.aligment,
    this.color,
    this.iconSize,
    this.isCard,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
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
            width: width,
            height: height,
            padding: EdgeInsets.all(sizing.borderInset[0] / 2),
            decoration: isCard ?? false
                ? BoxDecoration(
                    borderRadius: borderRadius ?? sizing.borderRadius[0],
                    color: color ?? Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        spreadRadius: 1,
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
