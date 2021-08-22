import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedMenu.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import '../../../../objects/menuOption.dart';
import '../../../../router/routerProvider.dart';
import '../../../../styles/layoutType.dart';
import '../../../../styles/sizeProvider.dart';
import '../../../../styles/legendTheme.dart';

class FixedAppBar extends StatelessWidget {
  final bool? showMenu;
  final WidgetBuilder? builder;
  final Widget? leading;

  FixedAppBar({
    this.showMenu,
    this.builder,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);

    return SliverAppBar(
      backgroundColor: theme.colors.primaryColor,
      actions: [
        Builder(
          builder: builder ?? (c) => Container(),
        ),
      ],
      title: Hero(
        tag: ValueKey("appBarTitle"),
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              leading ??
                  LegendText(
                    text: "Legend Design",
                    textStyle: LegendTextStyle.h1(),
                  ),
              if (showMenu ?? true)
                Expanded(
                  child: FixedMenu(context: context),
                ),
            ],
          ),
        ),
      ),
      expandedHeight: theme.sizing.appbarHeight,
      collapsedHeight: theme.sizing.appbarHeight,
      toolbarHeight: theme.sizing.appbarHeight,
      pinned: true,
      automaticallyImplyLeading: false,
    );
  }
}
