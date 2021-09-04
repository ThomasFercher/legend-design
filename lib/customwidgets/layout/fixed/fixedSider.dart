import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/sections/sectionTile.dart';
import 'package:webstore/router/routes/sectionProvider.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import '../drawers/siderMenuVerticalTile.dart';
import '../../../objects/menuOption.dart';
import '../../../router/routerProvider.dart';
import '../../../styles/layoutType.dart';
import '../../../styles/sizeProvider.dart';
import '../../../styles/legendTheme.dart';

import '../drawers/drawerMenuTile.dart';

class FixedSider extends StatelessWidget {
  late final bool showMenu;
  late final bool showSectionMenu;
  WidgetBuilder? builder;

  FixedSider({
    bool? showMenu,
    bool? showSectionMenu,
    this.builder,
  }) {
    this.showMenu = showMenu ?? true;
    this.showSectionMenu = showSectionMenu ?? false;
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = SizeProvider.of(context).screenSize;
    bool showSider =
        screenSize == ScreenSize.Large || screenSize == ScreenSize.XXL;

    return Hero(
      tag: ValueKey("sider"),
      child: Material(
        elevation: 20,
        child: showSider
            ? Sider(
                showMenu: showMenu,
                builder: builder,
                context: context,
                showSectionMenu: showSectionMenu,
              )
            : CollapsedSider(
                context: context,
                showMenu: showMenu,
                showSectionMenu: showSectionMenu,
              ),
      ),
    );
  }
}

class CollapsedSider extends StatelessWidget {
  final bool showMenu;
  final bool showSectionMenu;

  const CollapsedSider({
    Key? key,
    required this.context,
    required this.showMenu,
    required this.showSectionMenu,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    List<MenuOptionHeader> options = RouterProvider.of(context).menuOptions;
    List<SiderMenuVerticalTile> tiles = List.of(
      options.map(
        (option) => SiderMenuVerticalTile(
          icon: option.icon,
          title: option.title,
          path: option.page,
        ),
      ),
    );

    List<SectionRouteInfo> sections =
        SectionProvider.of(context)?.sections ?? [];
    List<SectionTile> sectionTiles = List.of(
      sections.map(
        (option) => SectionTile(
          name: option.name,
        ),
      ),
    );
    return Container(
      width: 80,
      height: MediaQuery.of(context).size.height,
      color: theme.colors.primaryColor,
      child: Column(
        children: [
          Container(
            child: Placeholder(),
            height: 80,
          ),
          if (showMenu)
            ListView(
              shrinkWrap: true,
              children: tiles,
            ),
          if (showSectionMenu)
            ListView(
              children: sectionTiles,
              shrinkWrap: true,
            )
        ],
      ),
    );
  }
}

class Sider extends StatelessWidget {
  const Sider({
    Key? key,
    required this.showMenu,
    required this.builder,
    required this.context,
    required this.showSectionMenu,
  }) : super(key: key);

  final bool? showMenu;
  final bool? showSectionMenu;
  final WidgetBuilder? builder;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);

    List<MenuOptionHeader> options = RouterProvider.of(context).menuOptions;
    List<DrawerMenuTile> tiles = List.of(
      options.map(
        (option) => DrawerMenuTile(
          icon: option.icon,
          title: option.title,
          path: option.page,
          backgroundColor: Colors.teal,
          left: true,
        ),
      ),
    );

    List<SectionRouteInfo> sections =
        SectionProvider.of(context)?.sections ?? [];

    print(sections);
    List<SiderMenuVerticalTile> sectionTiles = List.of(
      sections.map(
        (option) => SiderMenuVerticalTile(
          title: option.name.replaceAll("/", "").capitalize(),
          path: option.name,
          isSection: true,
        ),
      ),
    );

    List<Widget> children = [];

    if (showMenu ?? false) {
      children.add(Container(
        height: 400,
        child: ListView(
          shrinkWrap: true,
          itemExtent: 40,
          children: tiles,
        ),
      ));
    }

    if (showSectionMenu ?? false) {
      children.add(ListView(
        shrinkWrap: true,
        children: sectionTiles,
      ));
    }

    if (builder != null)
      children.add(Builder(
        builder: (context) => builder!(context),
      ));

    for (var i = 1; i < children.length; i += 2) {
      children.insert(i, Padding(padding: EdgeInsets.only(top: 16)));
    }

    return Container(
      width: 200,
      height: MediaQuery.of(context).size.height,
      color: theme.colors.primaryColor,
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            title: Container(),
            backgroundColor: theme.colors.primaryColor,
            actions: [Container()],
            expandedHeight: theme.appBarStyle.appBarHeight,
            collapsedHeight: theme.appBarStyle.appBarHeight,
            toolbarHeight: theme.appBarStyle.appBarHeight,
            pinned: true,
            automaticallyImplyLeading: false,
          ),
          SliverList(delegate: SliverChildListDelegate(children))
        ],
      ),
    );
  }
}
