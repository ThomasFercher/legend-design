import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/styles/themeProvider.dart';
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
  late Color color = Colors.white;
  late Color borderColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _isHovered = false;
    _isClicked = false;

    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    );
    animation = ColorTween(
      begin: Colors.white,
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
    ThemeProvider theme = ThemeProvider.of(context);

    return Container(
      margin: const EdgeInsets.only(left: 32.0),
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
      height: theme.appbarHeight,
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: color,
                size: theme.appbarHeight / 3,
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0)),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: LegendText(
                  text: widget.title,
                  selectable: false,
                  textStyle: LegendTextStyle.h1().copyWith(
                    fontSize: theme.appbarHeight / 4.5,
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
