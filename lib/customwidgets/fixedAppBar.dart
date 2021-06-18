import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../objects/menuOption.dart';
import '../router/routerProvider.dart';
import '../styles/layoutType.dart';
import '../styles/sizeProvider.dart';
import '../styles/themeProvider.dart';

class FixedAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = ThemeProvider.of(context);

    return SliverAppBar(
      backgroundColor: theme.primaryColor,
      leading: Hero(
        tag: ValueKey("appBarLeading"),
        child: Container(
          width: 80,
          height: 80,
          child: Placeholder(),
        ),
      ),
      actions: [Container()],
      title: Hero(
        tag: ValueKey("appBarTitle"),
        child: Material(color: Colors.transparent, child: menu(context)),
      ),
      expandedHeight: theme.appbarHeight,
      collapsedHeight: theme.appbarHeight,
      toolbarHeight: theme.appbarHeight,
      pinned: true,
      automaticallyImplyLeading: false,
    );
  }

  Widget menu(BuildContext context) {
    List<MenuOptionHeader> options = RouterProvider.of(context).menuOptions;
    ScreenSize screenSize = SizeProvider.of(context).screenSize;
    ThemeProvider theme = ThemeProvider.of(context);

    if (screenSize != ScreenSize.Small) {
      return Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: options,
        ),
      );
    } else {
      return Container(
        alignment: Alignment.centerRight,
        child: IconButton(
          iconSize: 36,
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
