import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import '../../../router/routerProvider.dart';
import '../../typography/legendText.dart';

class DrawerMenuTile extends StatefulWidget {
  final IconData icon;
  final String? title;
  final String path;
  final Color backgroundColor;
  final bool left;
  final Color color;
  final Color activeColor;
  late final bool collapsed;

  DrawerMenuTile({
    required this.icon,
    required this.path,
    required this.title,
    required this.backgroundColor,
    required this.left,
    required this.color,
    required this.activeColor,
    bool collapsed = false,
  }) {
    this.collapsed = collapsed;
  }

  @override
  _DrawerMenuTileState createState() => _DrawerMenuTileState();
}

class _DrawerMenuTileState extends State<DrawerMenuTile>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late Animation<Color?> banimation;
  late AnimationController controller;
  late bool _isClicked;
  late bool _isHovered;
  late Color? color;
  Color? borderColor;
  @override
  void initState() {
    _isClicked = false;
    _isHovered = false;
    color = widget.color;
    borderColor = widget.backgroundColor;
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    banimation = ColorTween(
      begin: borderColor,
      end: widget.activeColor,
    ).animate(controller);

    animation = ColorTween(
      begin: widget.color,
      end: widget.activeColor,
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
      margin: EdgeInsets.only(
        bottom: 24.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: borderColor ?? Colors.red,
            width: 4,
            style: widget.left ? BorderStyle.solid : BorderStyle.none,
          ),
          right: BorderSide(
            color: borderColor ?? Colors.red,
            width: 4,
            style: widget.left ? BorderStyle.none : BorderStyle.solid,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        left: widget.collapsed ? 0 : 26.0,
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
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: color,
              size: 28.0,
            ),
            if (widget.title != null)
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.0),
                  child: LegendText(
                    text: widget.title!,
                    textStyle: LegendTextStyle.h5().copyWith(
                      color: color,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
