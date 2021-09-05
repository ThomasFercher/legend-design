import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/bottomBarProvider.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/fixedBottomBar.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';

class BottomBarItem extends StatefulWidget {
  final MenuOption option;
  final BottomBarStyle? style;
  final void Function(MenuOption option) onSelected;

  const BottomBarItem({
    required this.option,
    required this.style,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  _BottomBarItemState createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem>
    with SingleTickerProviderStateMixin {
  late Color _activeColor;
  late Color _disabledColor;
  late bool _isSelected;

  late Animation _foregroundAnimation;
  late Animation _backgroundAnimation;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _disabledColor = widget.style?.disabledColor ?? Colors.black38;
    _activeColor = _disabledColor;
    _isSelected = false;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
    );
    _foregroundAnimation = ColorTween(
      begin: _disabledColor,
      end: widget.style?.activeColor,
    ).animate(_controller);

    _backgroundAnimation = ColorTween(
      begin: Colors.teal,
      end: Colors.blueAccent,
    ).animate(_controller);

    _backgroundAnimation.addListener(() {
      setState(() {
        _disabledColor = _backgroundAnimation.value;
      });
    });

    _foregroundAnimation.addListener(() {
      setState(() {
        _activeColor = _foregroundAnimation.value;
      });
    });
  }

  Widget getText() {
    return LegendText(
      text: widget.option.title,
      textStyle: LegendTextStyle.bottomBar().copyWith(
        color: _activeColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomBarProvider>(
      builder: (context, sel, c) {
        bool isSelected = sel.selected.page == widget.option.page;
        print(isSelected);
        if (isSelected && !_isSelected) {
          _controller.forward();
          _isSelected = true;
        } else if (!isSelected && _isSelected) {
          _controller.reverse();
          _isSelected = false;
        }

        return Material(
          color: Colors.transparent,
          child: Container(
            child: InkWell(
              onTap: () {
                widget.onSelected(widget.option);

                RouterProvider.of(context).pushPage(
                  settings: RouteSettings(name: widget.option.page),
                );
              },
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Icon(
                          widget.option.icon,
                          size: widget.style?.iconSize ?? 28,
                          color: _activeColor,
                        ),
                      ),
                      if ((widget.style?.textAtBottom ?? false) &&
                          (widget.style?.showText ?? true))
                        Container(
                          padding: EdgeInsets.only(top: 2.0),
                          child: getText(),
                        ),
                    ],
                  ),
                  if ((widget.style?.showText ?? true) &&
                      (!(widget.style?.textAtBottom ?? false)))
                    Container(
                      padding: EdgeInsets.only(left: 4.0),
                      child: getText(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
