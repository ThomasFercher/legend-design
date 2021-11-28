import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/sectionNavigation/section_navigation.dart';
import 'package:legend_design_core/router/router_provider.dart';
import 'package:legend_design_core/router/routes/section_route_info.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:provider/src/provider.dart';

class SiderMenuVerticalTile extends StatefulWidget {
  final String path;
  final IconData? icon;
  final String? title;
  late final bool isSection;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? color;
  final bool collapsed;
  final double? fontSize;
  final double? iconSize;
  final double? bottomMargin;

  SiderMenuVerticalTile({
    required this.path,
    required this.collapsed,
    this.fontSize,
    this.iconSize,
    this.backgroundColor,
    this.activeColor,
    this.color,
    this.icon,
    this.bottomMargin,
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
    color = widget.color;
    borderColor = widget.backgroundColor;

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 360),
    );
    banimation = ColorTween(
      begin: borderColor ?? Colors.transparent,
      end: widget.activeColor ?? Colors.transparent, // TODO: Fix
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
  void dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();

    return Container(
      height: 48,
      margin: EdgeInsets.only(bottom: widget.bottomMargin ?? 24),
      padding: EdgeInsets.only(left: widget.collapsed ? 0 : 32.0),
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
          if (widget.isSection) {
            SectionNavigation.of(context)
                ?.navigateToSection(SectionRouteInfo(name: widget.path));
          } else {
            RouterProvider.of(context).pushPage(
              settings: RouteSettings(name: widget.path),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    widget.icon,
                    color: color,
                    size: widget.iconSize ?? 28,
                  ),
                ),
              ),
            if (widget.title != null)
              Container(
                padding: const EdgeInsets.only(
                  top: 4,
                ),
                child: LegendText(
                  textAlign: TextAlign.center,
                  text: widget.title ?? '',
                  textStyle: theme.typography.h1.copyWith(
                    color: color,
                    fontSize: widget.fontSize,
                    fontWeight:
                        widget.collapsed ? FontWeight.w400 : FontWeight.normal,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
