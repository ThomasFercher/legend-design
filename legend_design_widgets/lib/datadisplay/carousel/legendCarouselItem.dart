import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LegendCarouselItem extends StatelessWidget {
  final Widget item;
  final Duration duration;

  final double maxWidth;

  LegendCarouselItem({
    required this.item,
    required this.duration,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: item,
        width: maxWidth,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
