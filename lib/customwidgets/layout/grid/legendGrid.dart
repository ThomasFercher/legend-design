import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/layout/grid/legendGridSize.dart';
import 'package:webstore/customwidgets/layout/sections/sectionHeader.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/layoutType.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/customwidgets/typography/typography.dart';

class LegendGrid extends StatelessWidget {
  final List<Widget> children;
  final LegendGridSize sizes;
  final int? crossAxisCount;
  final EdgeInsets? margin;

  LegendGrid({
    required this.children,
    required this.sizes,
    this.crossAxisCount,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    int crossAxisCount;
    ScreenSize ss = SizeProvider.of(context).screenSize;

    LegendGridSizeInfo size = sizes.getSizeForSize(ss);

    return LayoutBuilder(builder: (context, constraints) {
      int count = size.count;

      double singleChildWidth = constraints.maxWidth / count;
      int rows = (children.length / count).ceil();
      double height = size.height * rows;
      double aspectRatio = singleChildWidth / (height / rows);
      return Container(
        height: height,
        margin: margin,
        child: GridView.count(
          childAspectRatio: aspectRatio,
          crossAxisCount: count,
          children: children,
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
        ),
      );
    });
  }
}
