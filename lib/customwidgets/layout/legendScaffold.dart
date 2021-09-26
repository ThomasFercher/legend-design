import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/bottomBar.dart/fixedBottomBar.dart';
import 'package:webstore/customwidgets/layout/sectionNavigation/sectionNavigation.dart';
import 'package:webstore/customwidgets/layout/sections/section.dart';
import 'package:webstore/router/routes/sectionProvider.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/legendColorTheme.dart';
import 'package:webstore/styles/theming/legendTheme.dart';
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

class LegendScaffold extends StatefulWidget {
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

  @override
  _LegendScaffoldState createState() => _LegendScaffoldState();
}

class _LegendScaffoldState extends State<LegendScaffold> {
  List<SectionRouteInfo>? sections;

  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = new ScrollController(
      initialScrollOffset: 0,
    );
  }

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
            SectionRouteInfo s = sections!.singleWhere(
              (element) => element.name == section.name,
              orElse: () {
                return sections!.first;
              },
            );
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
    if (widget.layoutType == LayoutType.FixedSider) {
      return FixedSider(
        showMenu: true,
        builder: widget.siderBuilder,
      );
    } else if (widget.layoutType == LayoutType.FixedHeaderSider &&
        screenSize != ScreenSize.Small) {
      return FixedSider(
        builder: widget.siderBuilder,
        showMenu: widget.showSiderMenu,
        showSectionMenu: true,
      );
    } else {
      return Container();
    }
  }

  Widget getFooter(double height) {
    return FixedFooter(
      height: height,
    );
  }

  Widget getHeader(context) {
    switch (widget.layoutType) {
      case LayoutType.FixedHeaderSider:
        return FixedAppBar(
          showMenu: SizeProvider.of(context).isMobile == false
              ? widget.showAppBarMenu
              : false,
          builder: widget.appBarBuilder,
          pcontext: context,
          layoutType: widget.layoutType,
        );
      case LayoutType.FixedHeader:
        return FixedAppBar(
          builder: widget.appBarBuilder,
          showMenu: SizeProvider.of(context).isMobile == false
              ? widget.showAppBarMenu
              : false,
          pcontext: context,
          layoutType: widget.layoutType,
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
        widget.onActionButtonPressed!(context);
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

    LegendTheme theme = Provider.of<LegendTheme>(context);
    SizeProvider.of(context).titleWidth = SizeProvider.calcTextSize(
          "Legend Design",
          LegendTextStyle.h1().copyWith(
            color: theme.colors.secondaryColor,
            letterSpacing: 0.1,
          ),
        ).width +
        26.0 +
        48.0;

    double maxHeight = SizeProvider.of(context).height;

    List<Widget> children = getChildren(context);
    if (children.isNotEmpty) children.add(getFooter(120));
    return Scaffold(
      endDrawer: DrawerMenu(),
      bottomNavigationBar:
          SizeProvider.of(context).isMobile ? FixedBottomBar() : null,
      endDrawerEnableOpenDragGesture: false,
      floatingActionButton: widget.onActionButtonPressed != null
          ? Builder(
              builder: (context) {
                return getActionButton(context);
              },
            )
          : null,
      body: Stack(
        children: [
          Row(
            children: [
              getSider(screenSize),
              Expanded(
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    getHeader(context),
                    widget.children.isEmpty
                        ? SliverToBoxAdapter(
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              double footerheight = 120;
                              double space = maxHeight -
                                  footerheight -
                                  contentPadding.vertical -
                                  100;

                              return Container(
                                color: theme.colors.scaffoldBackgroundColor,
                                padding: contentPadding,
                                child: Column(
                                  children: [
                                    Container(
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minHeight: space,
                                          ),
                                          child: Builder(
                                            builder: widget.contentBuilder,
                                          ),
                                        ),
                                      ),
                                    ),
                                    getFooter(footerheight),
                                  ],
                                ),
                              );
                            }),
                          )
                        : SliverToBoxAdapter(
                            child: Container(
                              color: theme.colors.scaffoldBackgroundColor,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: children,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          if ((widget.layoutType == LayoutType.FixedSider ||
                  widget.layoutType == LayoutType.FixedHeaderSider) &&
              !theme.isMobile)
            Positioned(
              left: theme.appBarStyle.contentPadding.left,
              top: theme.appBarStyle.contentPadding.top,
              child: Material(
                color: Colors.transparent,
                child: Hero(
                  tag: ValueKey("title"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: theme.appBarStyle.appBarHeight,
                        width: theme.appBarStyle.appBarHeight - 12,
                        margin: EdgeInsets.only(right: 16.0),
                        child: SvgPicture.asset(
                          "assets/photos/larrylegend.svg",
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Container(
                        height: theme.appBarStyle.appBarHeight,
                        alignment: Alignment.center,
                        child: LegendText(
                          text: "Legend Design",
                          textStyle: LegendTextStyle.h1().copyWith(
                            color: theme.colors.secondaryColor,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> getChildren(BuildContext context) {
    List<Widget> childs = [];

    this.widget.children.forEach((element) {
      Widget w;
      if (element is Section) {
        Section s = element;
        GlobalKey key = new GlobalKey();
        if (sections != null) {
          SectionRouteInfo se = sections!.singleWhere(
            (element) => element.name == s.name,
            orElse: () {
              print("");
              return sections!.last;
            },
          );
          int i = sections!.indexOf(se);
          sections![i] = SectionRouteInfo(name: se.name, key: key);
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
