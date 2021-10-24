import 'package:flutter/material.dart';
import 'package:legend_design_core/styles/layouts/layoutType.dart';
import 'package:legend_design_core/styles/theming/sizing/sizeProvider.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';

class LegendGrid extends StatelessWidget {
  final List<Widget> children;
  final LegendGridSize sizes;
  final int? crossAxisCount;
  final EdgeInsets? margin;
  final double? width;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;

  LegendGrid({
    required this.sizes,
    required this.children,
    this.crossAxisCount,
    this.margin,
    this.width,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
  });

  @override
  Widget build(BuildContext context) {
    int crossAxisCount;
    ScreenSize ss = SizeProvider.of(context).screenSize;

    LegendGridSizeInfo size = sizes.getSizeForSize(ss);

    return LayoutBuilder(builder: (context, constraints) {
      int count = size.count;
      double singleChildWidth;

      if (constraints.maxWidth == 0.0) {
        if (width != null)
          singleChildWidth = width! / count;
        else
          throw Error();
      } else
        singleChildWidth = constraints.maxWidth / count;
      int rows = (children.length / count).ceil();
      double height = size.height * rows +
          (rows - 1) * (mainAxisSpacing ?? 4) +
          (margin?.vertical ?? 0);
      double aspectRatio = singleChildWidth /
          ((height - (rows - 1) * (mainAxisSpacing ?? 4)) / rows);
      return Container(
        height: height,
        margin: margin,
        child: GridView.count(
          childAspectRatio: aspectRatio,
          crossAxisCount: count,
          children: children,
          shrinkWrap: true,
          crossAxisSpacing: crossAxisSpacing ?? 4.0,
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: mainAxisSpacing ?? 4.0,
        ),
      );
    });
  }
}
