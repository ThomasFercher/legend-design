import 'package:flutter/material.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';

import 'legendTableCell.dart';

class LegendTableRow extends StatefulWidget {
  final List<LegendTableCell> columnsCells;
  final double height;
  LegendTableRow({
    Key? key,
    required this.columnsCells,
    required this.height,
  }) : super(key: key);

  @override
  _LegendTableRowState createState() => _LegendTableRowState();
}

class _LegendTableRowState extends State<LegendTableRow>
    with SingleTickerProviderStateMixin {
  late Color color;
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    color = LegendColorTheme.darken(Colors.white, 0.06);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    )..addListener(() {
        setState(() {
          color = _animation.value ?? Colors.white;
        });
      });

    _animation = ColorTween(
      begin: LegendColorTheme.darken(Colors.white, 0.06),
      end: LegendColorTheme.darken(Colors.white, 0.12),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: color,
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: MouseRegion(
        onEnter: (event) {
          _controller.forward();
        },
        onExit: (event) {
          _controller.reverse();
        },
        child: Row(
          children: List.of(
            widget.columnsCells.map(
              (e) => Expanded(child: OverflowBox(child: e)),
            ),
          ),
        ),
      ),
    );
  }
}
