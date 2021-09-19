import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/layout/sectionNavigation/sectionNavigation.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/legendTheme.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import '../../../router/routerProvider.dart';

class SiderMenuVerticalTile extends StatefulWidget {
  final String path;
  final IconData? icon;
  final String? title;
  late final bool isSection;
  final Color? backgroundColor;
  final Color? activeColor;

  SiderMenuVerticalTile({
    required this.path,
    this.backgroundColor,
    this.activeColor,
    this.icon,
    this.title,
    bool? isSection,
  }) {
    this.isSection = isSection ?? false;
  }

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
  late Color? color;

  Color? borderColor;
  @override
  void initState() {
    _isClicked = false;
    _isHovered = false;
    color = LegendTextStyle.sectionLink().color;

    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 360),
    );
    banimation = ColorTween(
      begin: widget.backgroundColor ?? Colors.transparent,
      end: widget.activeColor ?? LegendTextStyle.sectionLink().color,
    ).animate(controller);

    animation = ColorTween(
      begin: color,
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
      height: 48,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(left: 32.0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: borderColor ?? Colors.teal,
            width: 4,
            style: BorderStyle.none,
          ),
          right: BorderSide(
            color: borderColor ?? Colors.teal,
            width: 4,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: InkWell(
        hoverColor: Colors.transparent,
        enableFeedback: true,
        onHover: (value) {
          print(value);
          if (value) {
            if (!controller.isAnimating || !_isHovered) {
              controller.forward();
              _isHovered = true;
            }
          } else {
            if (!controller.isAnimating || _isHovered) {
              controller.reverse();
              _isHovered = false;
            }
          }
        },
        onTap: () {
          if (widget.isSection)
            SectionNavigation.of(context)
                ?.navigateToSection(SectionRouteInfo(name: widget.path));
          else
            RouterProvider.of(context).pushPage(
              settings: RouteSettings(name: widget.path),
            );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              Expanded(
                child: Icon(
                  widget.icon,
                  color: color,
                ),
              ),
            LegendText(
              textAlign: TextAlign.center,
              text: widget.title ?? "",
              textStyle: LegendTextStyle.sectionLink().copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
