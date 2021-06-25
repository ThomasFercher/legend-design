import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/legendTheme.dart';
import 'package:webstore/styles/typography.dart';
import '../router/routerProvider.dart';

class SiderMenuVerticalTile extends StatefulWidget {
  final String path;
  final IconData icon;
  final String? title;

  SiderMenuVerticalTile({required this.path, required this.icon, this.title});

  @override
  _SiderMenuVerticalTileState createState() => _SiderMenuVerticalTileState();
}

class _SiderMenuVerticalTileState extends State<SiderMenuVerticalTile>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late Animation<Color?> banimation;
  late AnimationController controller;
  late bool _isClicked;
  late bool _isHovered;
  late Color? color = Colors.white;
  Color? borderColor;
  @override
  void initState() {
    _isClicked = false;
    _isHovered = false;

    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    banimation = ColorTween(
      begin: Colors.teal,
      end: Colors.blueAccent,
    ).animate(controller);

    animation = ColorTween(
      begin: Colors.white,
      end: Colors.blueAccent,
    ).animate(controller);

    animation.addListener(() {
      setState(() {
        color = animation.value;
      });
    });
    banimation.addListener(() {
      setState(() {
        borderColor = banimation.value;
      });
    });
    super.initState();
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: borderColor ?? Colors.teal,
            width: 4,
            style: BorderStyle.solid,
          ),
          right: BorderSide(
            color: borderColor ?? Colors.teal,
            width: 4,
            style: BorderStyle.none,
          ),
        ),
      ),
      child: InkWell(
        hoverColor: Colors.transparent,
        enableFeedback: true,
        onHover: (value) {
          print(value);
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
            settings: RouteSettings(name: widget.path),
          );
        },
        child: Column(
          children: [
            Expanded(
              child: Icon(
                widget.icon,
                color: color,
              ),
            ),
            LegendText(
              text: widget.title ?? "",
              textStyle: LegendTextStyle.h5().copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
