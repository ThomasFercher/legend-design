import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/styles/legendTheme.dart';
import 'package:webstore/styles/typography.dart';
import '../router/routerProvider.dart';

class MenuOptionHeader extends StatefulWidget {
  final String title;
  final String page;
  final IconData icon;

  MenuOptionHeader({
    required this.title,
    required this.page,
    required this.icon,
  });

  @override
  _MenuOptionHeaderState createState() => _MenuOptionHeaderState();
}

class _MenuOptionHeaderState extends State<MenuOptionHeader>
    with SingleTickerProviderStateMixin {
  late bool _isHovered;
  late bool _isClicked;
  late AnimationController controller;
  late Animation animation;
  late Animation animation2;
  late Color color = Colors.black87;
  late Color borderColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _isHovered = false;
    _isClicked = false;

    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 260,
      ),
    );
    animation = ColorTween(
      begin: color,
      end: Colors.blueAccent,
    ).animate(controller);

    animation2 = ColorTween(
      begin: Colors.teal,
      end: Colors.blueAccent,
    ).animate(controller);

    animation2.addListener(() {
      setState(() {
        borderColor = animation2.value;
      });
    });

    animation.addListener(() {
      setState(() {
        color = animation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: borderColor,
            width: 4,
            style: BorderStyle.solid,
          ),
          bottom: BorderSide(
            color: borderColor,
            width: 4,
            style: BorderStyle.none,
          ),
        ),
      ),
      height: theme.sizing.appbarHeight,
      child: InkWell(
        onHover: (value) {
          if (value && !_isClicked) {
            if (!controller.isAnimating || !_isHovered) {
              controller.forward();
              _isHovered = true;
            }
          } else {
            if (!controller.isAnimating || _isHovered && !_isClicked) {
              controller.reverse();
              _isHovered = false;
            }
          }
        },
        onTap: () {
          _isClicked = !_isClicked;
          RouterProvider.of(context).pushPage(
            settings: RouteSettings(name: widget.page),
          );
        },
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: color,
                size: theme.sizing.appbarHeight / 3,
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0)),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: LegendText(
                  text: widget.title,
                  selectable: false,
                  textStyle: LegendTextStyle.h1().copyWith(
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
