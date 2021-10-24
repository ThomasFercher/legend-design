import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LegendBookshelfItem extends StatelessWidget {
  final Widget item;
  final Duration duration;
  final bool selected;
  final double maxWidth;

  LegendBookshelfItem({
    required this.item,
    required this.duration,
    required this.selected,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: SizedBox(
        child: item,
        width: maxWidth,
        height: MediaQuery.of(context).size.height,
      ),
      secondChild: Container(
        width: 0,
        child: item,
        height: MediaQuery.of(context).size.height,
      ),
      crossFadeState:
          selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: duration,
    );
  }
}
