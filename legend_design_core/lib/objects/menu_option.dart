import 'dart:math';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/modals/legendPopups.dart';
import 'package:legend_design_core/modals/modalSheet.dart';
import 'package:legend_design_core/objects/drawer_menu_tile.dart';
import 'package:legend_design_core/styles/theming/sizing/size_provider.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:provider/provider.dart';
import '../router/router_provider.dart';

class MenuOption {
  final String? title;
  final String page;
  final IconData? icon;
  final void Function(String page)? onSelected;
  late final bool isUnderlying;
  final List<MenuOption>? children;

  final bool showSubMenu;

  MenuOption({
    this.title,
    required this.page,
    this.icon,
    this.onSelected,
    bool? isUnderlying,
    this.children,
    this.showSubMenu = false,
  }) {
    this.isUnderlying = isUnderlying ?? false;
  }
}

class MenuOptionHeader extends StatefulWidget {
  final MenuOption option;
  Color? color;
  final Color? activeColor;
  final Color? backgroundColor;
  final bool forceColor;
  late final bool showSubMenu;
  final double maxHeight = 360;

  MenuOptionHeader({
    required this.option,
    this.color,
    this.activeColor,
    this.backgroundColor,
    bool? showSubMenu,
    this.forceColor = false,
  }) {
    if (option.children != null) {
      this.showSubMenu = showSubMenu ?? false;
    } else {
      this.showSubMenu = false;
    }

    if (forceColor) {
      color = activeColor;
    }
  }

  @override
  _MenuOptionHeaderState createState() => _MenuOptionHeaderState();
}

class _MenuOptionHeaderState extends State<MenuOptionHeader>
    with SingleTickerProviderStateMixin {
  late bool _isHovered;
  late bool _isClicked;
  late AnimationController controller;
  late Animation<Color?> animation;
  late Animation<Color?> animation2;
  late Color color = widget.color ?? Colors.black87;
  late Color borderColor;
  late Color activeColor;
  final GlobalKey key = GlobalKey();
  double width = 80;
  bool subMenuShown = false;
  bool poppedFromtTop = false;

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
        borderColor = animation2.value ?? Colors.transparent;
      });
    });

    animation.addListener(() {
      setState(() {
        color = animation.value ?? Colors.transparent;
      });
    });
  }

  void showSubMenu(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    LegendPopups.showLegendModal(
      context: context,
      config: FadeScaleTransitionConfiguration(
        barrierColor: Colors.transparent,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 40),
        barrierLabel: "",
        reverseTransitionDuration: Duration(milliseconds: 40),
      ),
      modal: ModalSheet(
        child: Container(
          margin: EdgeInsets.only(
            top: theme.appBarSizing.appBarHeight,
          ),
          height: 200,
          width: 200,
          color: Colors.red,
        ),
        position: Point(
          LegendUtils.getVerticalCenter(context, key, 200) ?? 0,
          LegendUtils.getWidgetOffset(context, key)?.dy ?? 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    width =
        LegendUtils.calcTextSize(widget.option.title ?? '', theme.typography.h2)
                .width +
            theme.appBarSizing.contentPadding.horizontal +
            (theme.appBarSizing.iconSize ?? 24) * 2.22 +
            8 +
            12 * 2;
    double subMenuWidth = 200;

    theme.setMenuOptionWidth(width, widget.option);

    double left_q = (subMenuWidth - width) / 2;

    MenuOption? sel = RouterProvider.of(context).current;

    List<Widget>? tiles;
    if (widget.showSubMenu) {
      tiles = widget.option.children!
          .map(
            (option) => DrawerMenuTile(
              icon: option.icon,
              title: option.title,
              path: option.page,
              left: false,
              backgroundColor: theme.colors.cardBackgroundColor,
              activeColor: theme.colors.selectionColor,
              color: theme.colors.textContrast,
              collapsed: false,
              onClicked: () {
                poppedFromtTop = true;
              },
              forceColor: option == sel,
              bottomSpacing: 16,
            ),
          )
          .toList();
    }
    return Container(
      key: key,
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
      width: width,
      child: MouseRegion(
        onEnter: (value) {
          controller.forward();
          if (widget.showSubMenu) {
            subMenuShown = true;

            //Better
            LegendPopups.showLegendModal(
              context: context,
              config: FadeScaleTransitionConfiguration(
                barrierColor: Colors.transparent,
                barrierDismissible: true,
                transitionDuration: Duration(milliseconds: 200),
                barrierLabel: "",
                reverseTransitionDuration: Duration(milliseconds: 100),
              ),
              modal: ModalSheet(
                child: Material(
                  color: Colors.transparent,
                  child: MouseRegion(
                    onHover: (event) {
                      Offset p = event.localPosition;

                      if (p.dy <= theme.appBarSizing.appBarHeight) {
                        if (p.dx <= left_q || p.dx >= subMenuWidth - left_q) {
                          poppedFromtTop = true;
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    onExit: (event) {
                      if (poppedFromtTop == false) {
                        Navigator.pop(context);
                      } else {
                        poppedFromtTop = false;
                      }
                      controller.reverse();
                      subMenuShown = false;
                    },
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            poppedFromtTop = true;
                            RouterProvider.of(context).pushPage(
                              settings: RouteSettings(name: widget.option.page),
                            );
                          },
                          child: Container(
                            height: theme.appBarSizing.appBarHeight,
                            width: width,
                            color: Colors.transparent,
                          ),
                        ),
                        Container(
                          width: subMenuWidth,
                          constraints: BoxConstraints(
                            maxHeight: widget.maxHeight,
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(
                                  theme.sizing.borderInset[0],
                                ),
                              ),
                            ),
                            color: theme.colors.cardBackgroundColor,
                            margin: const EdgeInsets.all(0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: theme.sizing.borderInset[0],
                                bottom: theme.sizing.borderInset[0],
                              ),
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: tiles ?? [],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                position: Point(
                  LegendUtils.getVerticalCenter(context, key, subMenuWidth) ??
                      0,
                  0.0,
                ),
              ),
            );
          }
        },
        onExit: (event) {
          if (!subMenuShown) controller.reverse();
        },
        child: GestureDetector(
          onTap: () {
            _isClicked = !_isClicked;
            if (widget.option.onSelected != null) {
              widget.option.onSelected!(widget.option.page);
            }
            RouterProvider.of(context).pushPage(
              settings: RouteSettings(name: widget.option.page),
            );
          },
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
                      textStyle: theme.typography.h2.copyWith(
                        color: color,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
