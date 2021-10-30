import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:legend_design_core/typography/legendText.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:provider/provider.dart';

import '../router/routerProvider.dart';

class MenuOption {
  final String? title;
  final String page;
  final IconData icon;
  final void Function(String page)? onSelected;

  const MenuOption({
    this.title,
    required this.page,
    required this.icon,
    this.onSelected,
  });
}

class MenuOptionHeader extends StatefulWidget {
  final MenuOption option;
  final Color? color;
  final Color? activeColor;
  final Color? backgroundColor;

  MenuOptionHeader({
    required this.option,
    this.color,
    this.activeColor,
    this.backgroundColor,
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
  late Color color = widget.color ?? Colors.black87;
  late Color borderColor;
  late Color activeColor;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isHovered = false;
    _isClicked = false;
    borderColor = widget.backgroundColor ?? Colors.red;
    activeColor = widget.activeColor ?? Colors.blueAccent;
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 260,
      ),
    );
    animation = ColorTween(
      begin: color,
      end: activeColor,
    ).animate(controller);

    animation2 = ColorTween(
      begin: borderColor,
      end: activeColor,
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
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Container(
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
      height: theme.appBarSizing.appBarHeight,
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
          if (widget.option.onSelected != null)
            widget.option.onSelected!(widget.option.page);
          RouterProvider.of(context).pushPage(
            settings: RouteSettings(name: widget.option.page),
          );
        },
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: theme.appBarSizing.spacing ?? 12.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.option.icon,
                color: color,
                size: theme.appBarSizing.iconSize,
              ),
              if (widget.option.title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 8.0),
                  child: LegendText(
                    text: widget.option.title!,
                    selectable: false,
                    textStyle: LegendTextStyle.appBarMenuHeader().copyWith(
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
