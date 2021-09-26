import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/input/dropdown.dart/legendDropdownOption.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';
import 'package:webstore/styles/theming/sizing/legendSizing.dart';
import 'package:webstore/styles/theming/sizing/legendSizingTheme.dart';
import 'package:webstore/styles/theming/legendTheme.dart';

class LegendDropdown extends StatefulWidget {
  final List<PopupMenuOption> options;
  final Function(PopupMenuOption selected) onSelected;
  final Color? color;
  final double? itemHeight;
  final AnimatedIconData? buttonIcon;

  LegendDropdown({
    required this.options,
    required this.onSelected,
    this.color,
    this.itemHeight,
    this.buttonIcon,
  });

  @override
  _LegendDropdownState createState() => _LegendDropdownState();
}

class _LegendDropdownState extends State<LegendDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  initState() {
    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
      reverseDuration: Duration(milliseconds: 250),
      lowerBound: 0.0,
      upperBound: 1.0,
      animationBehavior: AnimationBehavior.preserve,
    );

    super.initState();
  }

  PopupMenuItem<String> getDropDownMenuItem(
      String option, IconData? icon, context, LegendColorTheme colors) {
    return PopupMenuItem<String>(
      height: widget.itemHeight ?? 36,
      value: option,
      child: Row(
        children: [
          Container(
            child: icon != null
                ? Padding(
                    child: Icon(
                      icon,
                      color: colors.primaryColor,
                      size: 24,
                    ),
                    padding: EdgeInsets.only(right: 16),
                  )
                : null,
          ),
          /*  Expanded(
            child: Text(
              option,
              style: GoogleFonts.nunito(color: widget.theme.textColor),
            ),
          ),*/
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    LegendColorTheme colors = Provider.of<LegendTheme>(context).colors;
    LegendSizing sizes = Provider.of<LegendTheme>(context).sizing;

    return Container(
      height: 40,
      child: PopupMenuButton(
        icon: GestureDetector(
          child: AnimatedIcon(
            icon: widget.buttonIcon ?? AnimatedIcons.menu_close,
            color: widget.color,
            progress: _animationController,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        onSelected: (value) {
          _animationController.reverse();
          widget
              .onSelected(widget.options.singleWhere((e) => e.value == value));
        },
        //     color: colors.backgroundColor,
        //   elevation: colors.elevation,
        onCanceled: () {
          _animationController.reverse();
        },
        enableFeedback: true,
        iconSize: 12,
        offset: Offset(0, (12 ?? 0) + 8.0),
        itemBuilder: (BuildContext context) {
          _animationController.forward();
          return widget.options
              .map(
                (opt) =>
                    getDropDownMenuItem(opt.value, opt.icon, context, colors),
              )
              .toList();
        },
      ),
    );
  }
}
