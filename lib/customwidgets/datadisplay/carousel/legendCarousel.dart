import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/datadisplay/carousel/legendCarouselItem.dart';
import 'package:webstore/customwidgets/icons/legendAnimatedIcon.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';

const Duration duration = const Duration(milliseconds: 360);
Curve curve = Curves.easeInOutSine;

class LegendCarousel extends StatefulWidget {
  final double? height;
  final List<Widget> items;
  final Duration? animationDuration;
  final EdgeInsetsGeometry? padding;
  late bool isInfinite;

  LegendCarousel({
    required this.items,
    this.height,
    this.animationDuration,
    this.padding,
    bool? isInfinite,
  }) {
    this.isInfinite = isInfinite ?? false;
  }

  @override
  _LegendCarouselState createState() => _LegendCarouselState();
}

class _LegendCarouselState extends State<LegendCarousel> {
  late int selected;
  late PageController _scrollController;

  @override
  void initState() {
    super.initState();
    selected = widget.items.indexOf(widget.items.first);

    _scrollController = PageController(initialPage: selected, keepPage: true)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    int page = _scrollController.page?.toInt() ?? -1;
    print(page);
  }

  void selectPage(int page) {
    _scrollController.animateToPage(page, duration: duration, curve: curve);
  }

  List<Widget> getItems(double width) {
    List<Widget> items = widget.items
        .map(
          (w) => LegendCarouselItem(
            maxWidth: width,
            item: w,
            duration: widget.animationDuration ?? Duration(milliseconds: 250),
          ),
        )
        .toList();

    return items;
  }

  void changedSelected(bool right) {
    int toSelect = selected + (right ? 1 : -1);

    if (toSelect >= 0 && toSelect < widget.items.length) {
      setState(() {
        selected = toSelect;
      });

      selectPage(toSelect);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      double width = MediaQuery.of(context).size.width;
      List<Widget> items = getItems(width);
      return Container(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: PageView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: items,
                pageSnapping: true,
                controller: _scrollController,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: LegendAnimatedIcon(
                icon: Icons.arrow_forward_ios,
                theme: LegendAnimtedIconTheme(
                  enabled: Colors.black87,
                  disabled: Colors.black38,
                ),
                padding: EdgeInsets.all(32.0),
                onPressed: () {
                  changedSelected(true);
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: LegendAnimatedIcon(
                icon: Icons.arrow_back_ios,
                theme: LegendAnimtedIconTheme(
                  enabled: Colors.black87,
                  disabled: Colors.black38,
                ),
                padding: EdgeInsets.all(32.0),
                onPressed: () {
                  changedSelected(false);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
