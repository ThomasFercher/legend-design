import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';

class LegendBookshelf extends StatefulWidget {
  final double? height;
  final List<Widget> items;
  final Duration? animationDuration;

  LegendBookshelf({
    Key? key,
    this.height,
    required this.items,
    this.animationDuration,
  }) : super(key: key);

  @override
  _LegendBookshelfState createState() => _LegendBookshelfState();
}

class _LegendBookshelfState extends State<LegendBookshelf> {
  late int selected;
  late CrossFadeState state;

  @override
  void initState() {
    super.initState();
    selected = widget.items.indexOf(widget.items.first);
    state = CrossFadeState.showFirst;
  }
/*
  List<Widget> getItems(double width) {
    List<Widget> items = widget.items
        .map(
          (w) => LegendCarouselItem(
            maxWidth: width,
            item: w,
            duration: widget.animationDuration ?? Duration(milliseconds: 250),
            selected: selected == widget.items.indexOf(w),
          ),
        )
        .toList();

    return items;
  }*/

  void changedSelected(bool right) {
    int dir = right ? 1 : -1;

    if ((right && selected < widget.items.length - 1) ||
        (!right && selected > 0)) {
      setState(() {
        selected += dir;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      double w = c.maxWidth;
      return Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [], //getItems(w),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100,
                child: LegendButton(
                  text: Text("next"),
                  onPressed: () {
                    changedSelected(true);
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 100,
                child: LegendButton(
                  text: Text("back"),
                  onPressed: () {
                    changedSelected(false);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
