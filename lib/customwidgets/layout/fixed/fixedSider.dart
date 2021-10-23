import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/sections/sectionTile.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/router/routes/sectionProvider.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/theming/colors/legendColorTheme.dart';
import '../drawers/siderMenuVerticalTile.dart';
import '../../../objects/menuOption.dart';
import '../../../router/routerProvider.dart';
import '../../../styles/layouts/layoutType.dart';
import '../../../styles/theming/sizing/sizeProvider.dart';
import '../../../styles/theming/legendTheme.dart';

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
    List<MenuOption> options = RouterProvider.of(context).menuOptions;
    List<SiderMenuVerticalTile> tiles = List.of(
      options.map(
        (option) => SiderMenuVerticalTile(
          icon: option.icon,
          path: option.page,
          collapsed: true,
          activeColor: Colors.tealAccent,
          backgroundColor: theme.colors.primaryColor,
          color: theme.colors.textColorLight,
        ),
      ),
    );

    List<SectionRouteInfo> sections =
        SectionProvider.of(context)?.sections ?? [];
    List<SiderMenuVerticalTile> sectionTiles = List.of(
      sections.map(
        (option) => SiderMenuVerticalTile(
          title: option.name.replaceAll("/", "").capitalize(),
          path: option.name,
          isSection: true,
          collapsed: true,
          activeColor: Colors.tealAccent,
          backgroundColor: theme.colors.primaryColor,
          color: theme.colors.textColorLight,
        ),
      ),
    );

    return Container(
      width: 80,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(
          top: theme.appBarStyle.appBarHeight +
              theme.appBarStyle.contentPadding.vertical),
      color: theme.colors.primaryColor,
      child: Column(
        children: [
          Divider(
            color: theme.colors.secondaryColor.withOpacity(0.2),
            height: 1.0,
            thickness: 1.0,
          ),
          if (showMenu)
            Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: ListView(
                shrinkWrap: true,
                children: tiles,
                padding: EdgeInsets.only(
                  top: 32,
                ),
              ),
            ),
          if (showSectionMenu)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView(
                children: sectionTiles,
                shrinkWrap: true,
              ),
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

    List<MenuOption> options = RouterProvider.of(context).menuOptions;
    List<DrawerMenuTile> tiles = List.of(
      options.map(
        (option) => DrawerMenuTile(
          icon: option.icon,
          title: option.title,
          path: option.page,
          backgroundColor: theme.colors.primaryColor,
          left: false,
          activeColor: theme.colors.selectionColor,
          color: theme.colors.secondaryColor,
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
          collapsed: false,
          activeColor: Colors.tealAccent,
          backgroundColor: theme.colors.primaryColor,
          color: theme.colors.textColorLight,
        ),
      ),
    );

    List<Widget> children = [
      Divider(
        color: theme.colors.secondaryColor.withOpacity(0.2),
        height: 1.0,
        thickness: 1.0,
      ),
      if (showMenu ?? false)
        ListView(
          shrinkWrap: true,
          children: tiles,
          padding: EdgeInsets.only(
            top: 32,
          ),
        ),
      if (showSectionMenu ?? false)
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LegendText(
                padding: EdgeInsets.only(left: 32.0),
                text: "Widgets",
                textStyle: LegendTextStyle.h4().copyWith(
                  color: LegendColorTheme.darken(
                    theme.colors.secondaryColor,
                    0.12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                child: Divider(
                  color: theme.colors.secondaryColor.withOpacity(0.6),
                  height: 1.5,
                  thickness: 1.5,
                ),
              ),
              ListView(
                shrinkWrap: true,
                children: sectionTiles,
              ),
            ],
          ),
        ),
      if (builder != null)
        Builder(
          builder: (context) => builder!(context),
        )
    ];

    for (var i = 1; i < children.length; i += 2) {
      children.insert(i, Padding(padding: EdgeInsets.only(top: 16)));
    }

    ScrollController controller = new ScrollController();

    return Container(
      width: 180,
      height: MediaQuery.of(context).size.height,
      color: theme.colors.primaryColor,
      padding: EdgeInsets.only(
          top: theme.appBarStyle.appBarHeight +
              theme.appBarStyle.contentPadding.vertical),
      child: Scrollbar(
        controller: controller,
        child: ListView(
          controller: controller,
          children: children,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
