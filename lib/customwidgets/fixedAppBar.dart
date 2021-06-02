import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/layoutType.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/styles/themeProvider.dart';

class FixedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = ThemeProvider.of(context);

    return SliverAppBar(
      backgroundColor: theme.primaryColor,
      leading: Container(
        width: 80,
        height: 80,
        child: Placeholder(),
      ),
      title: menu(context),
      expandedHeight: 80,
      collapsedHeight: 80,
      toolbarHeight: 80,
      pinned: true,
      automaticallyImplyLeading: false,
    );
  }

  Widget menu(BuildContext context) {
    List<MenuOptionHeader> options = RouterProvider.of(context).menuOptions;
    ScreenSize screenSize = SizeProvider.of(context).screenSize;

    if (screenSize != ScreenSize.Small) {
      return Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: options,
        ),
      );
    } else{
      return Container(
        child: Text("Collapsed Menu"),
      );
    }
  }
}
