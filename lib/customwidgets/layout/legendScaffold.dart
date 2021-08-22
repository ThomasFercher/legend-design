import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/sectionNavigation/sectionNavigation.dart';
import 'package:webstore/customwidgets/layout/sections/section.dart';
import 'package:webstore/router/routes/sectionProvider.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/legendColorTheme.dart';
import 'package:webstore/styles/legendTheme.dart';
import 'drawers/drawerMenu.dart';
import 'fixed/appBar.dart/fixedAppBar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'fixed/fixedFooter.dart';
import 'fixed/fixedSider.dart';
import '../modals/legendBottomSheet.dart';
import '../modals/modal.dart';
import '../typography/legendText.dart';
import '../../objects/menuOption.dart';
import '../../router/routerProvider.dart';
import '../../styles/layoutType.dart';
import '../../styles/sizeProvider.dart';
import '../typography/typography.dart';

class LegendScaffold extends StatelessWidget {
  final LayoutType? layoutType;
  final String pageName;
  final Function(BuildContext context)? onActionButtonPressed;
  final WidgetBuilder? siderBuilder;
  final WidgetBuilder? appBarBuilder;
  final bool? showSiderMenu;
  final bool? showAppBarMenu;
  late final bool singlePage;
  late final List<Widget> children;
  late final WidgetBuilder contentBuilder;

  LegendScaffold({
    required this.pageName,
    this.layoutType,
    this.onActionButtonPressed,
    this.siderBuilder,
    this.showSiderMenu,
    this.showAppBarMenu,
    this.appBarBuilder,
    WidgetBuilder? contentBuilder,
    List<Widget>? children,
    bool? singlePage,
    Key? key,
  }) : super(key: key) {
    this.singlePage = singlePage ?? false;
    this.children = children ?? [];
    this.contentBuilder = contentBuilder ?? (f) => Container();
  }

  List<SectionRouteInfo>? sections;

  @override
  Widget build(BuildContext context) {
    sections = SectionProvider.of(context)?.sections;
    return SizeProvider(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SectionNavigation(
        sections: sections,
        onNavigate: (section) {
          // Jump to Section
          if (sections != null) {
            SectionRouteInfo s = sections!
                .singleWhere((element) => element.name == section.name);
            if (s.key != null && s.key?.currentContext != null) {
              Scrollable.ensureVisible(
                s.key!.currentContext!,
                curve: Curves.easeInOut,
                duration: Duration(
                  milliseconds: 400,
                ),
              );
            }
          }
        },
        child: Builder(
          builder: (context) {
            if (kIsWeb) {
              return materialLayout(context);
            } else if (Platform.isIOS || Platform.isMacOS) {
              return cupertinoLayout(context);
            } else {
              return materialLayout(context);
            }
          },
        ),
      ),
    );
  }

  Widget cupertinoLayout(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(),
    );
  }

  Widget getSider(ScreenSize screenSize) {
    if (layoutType == LayoutType.FixedSider) {
      return FixedSider(
        showMenu: true,
        builder: siderBuilder,
      );
    } else if (layoutType == LayoutType.FixedHeaderSider &&
        screenSize != ScreenSize.Small) {
      return FixedSider(
        builder: siderBuilder,
        showMenu: showSiderMenu,
        showSectionMenu: true,
      );
    } else {
      return Container();
    }
  }

  Widget getFooter() {
    return FixedFooter();
  }

  Widget getHeader() {
    switch (layoutType) {
      case LayoutType.FixedHeaderSider:
        return FixedAppBar(
          showMenu: showAppBarMenu,
          builder: appBarBuilder,
        );
      case LayoutType.FixedHeader:
        return FixedAppBar(
          builder: appBarBuilder,
        );
      default:
        return SliverToBoxAdapter(
          child: Container(),
        );
    }
  }

  Widget getActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onActionButtonPressed!(context);
      },
    );
  }

  Widget materialLayout(BuildContext context) {
    ScreenSize screenSize = SizeProvider.of(context).screenSize;
    EdgeInsets contentPadding = const EdgeInsets.all(16);

    if (screenSize == ScreenSize.Small) {
      contentPadding = const EdgeInsets.all(4);
    }

    //TODO: Make COntent height fit screen if not specified
    var fixedHeaderHeight = 10;
    var whitespace = 16 * 2 + 10;
    var footerHeight = 200;

    LegendColorTheme colors = Provider.of<LegendTheme>(context).colors;

    return Scaffold(
      endDrawer: DrawerMenu(),
      endDrawerEnableOpenDragGesture: false,
      floatingActionButton: onActionButtonPressed != null
          ? Builder(
              builder: (context) {
                return getActionButton(context);
              },
            )
          : null,
      body: Row(
        children: [
          getSider(screenSize),
          Expanded(
            child: CustomScrollView(
              slivers: [
                getHeader(),
                children.isEmpty
                    ? SliverToBoxAdapter(
                        child: LayoutBuilder(builder: (context, constraints) {
                          return Container(
                            constraints: BoxConstraints(
                              minHeight:
                                  MediaQuery.of(context).size.height - 80,
                            ),
                            color: colors.scaffoldBackgroundColor,
                            padding: contentPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: constraints.maxWidth -
                                      contentPadding.horizontal,
                                  padding: const EdgeInsets.all(8.0),
                                  child: Builder(builder: contentBuilder),
                                ),
                                getFooter(),
                              ],
                            ),
                          );
                        }),
                      )
                    : SliverToBoxAdapter(
                        child: SingleChildScrollView(
                          child: Column(
                            children: getChildren(),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Every Section Widget gets wrapped witch a Global Key for Section Navigation
  List<Widget> getChildren() {
    List<Widget> childs = [];

    this.children.forEach((element) {
      Widget w;
      if (element is Section) {
        Section s = element;
        GlobalKey key = new GlobalKey();
        if (sections != null) {
          try {
            SectionRouteInfo se =
                sections!.singleWhere((element) => element.name == s.name);
            int i = sections!.indexOf(se);
            sections![i] = SectionRouteInfo(name: se.name, key: key);
          } catch (e) {
            print("No Section found!");
          }
        }
        w = Container(
          key: key,
          child: s,
        );
      } else {
        w = element;
      }
      childs.add(w);
    });

    return childs;
  }
}
