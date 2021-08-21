import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import '../../../router/routerProvider.dart';
import '../../typography/legendText.dart';

class DrawerMenuTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final String path;
  final Color backgroundColor;
  final bool left;

  const DrawerMenuTile({
    required this.icon,
    required this.path,
    required this.title,
    required this.backgroundColor,
    required this.left,
  });

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
    color = Colors.black;
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    banimation = ColorTween(
      begin: widget.backgroundColor,
      end: Colors.blueAccent,
    ).animate(controller);

    animation = ColorTween(
      begin: Colors.black,
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
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: borderColor ?? Colors.teal,
            width: 4,
            style: widget.left ? BorderStyle.solid : BorderStyle.none,
          ),
          right: BorderSide(
            color: borderColor ?? Colors.teal,
            width: 4,
            style: widget.left ? BorderStyle.none : BorderStyle.solid,
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
        child: ListTile(
          leading: Icon(
            widget.icon,
            color: color,
          ),
          title: LegendText(
            text: widget.title,
            textStyle: LegendTextStyle.h5().copyWith(
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
