import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/drawerMenu.dart';
import 'package:webstore/customwidgets/fixedAppBar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:webstore/customwidgets/fixedFooter.dart';
import 'package:webstore/customwidgets/fixedSider.dart';
import 'package:webstore/customwidgets/legendBottomSheet.dart';
import 'package:webstore/customwidgets/modal.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/layoutType.dart';
import 'package:webstore/styles/sizeProvider.dart';

class LegendScaffold extends StatelessWidget {
  final LayoutType? layoutType;
  final String pageName;
  final Function(BuildContext context)? onActionButtonPressed;
  final WidgetBuilder contentBuilder;

  const LegendScaffold({
    Key? key,
    this.layoutType,
    required this.pageName,
    this.onActionButtonPressed,
    required this.contentBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeProvider(
      width: MediaQuery.of(context).size.width,
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
      );
    } else if (layoutType == LayoutType.FixedHeaderSider &&
        screenSize != ScreenSize.Small) {
      return FixedSider();
    } else {
      return Container();
    }
  }

  Widget getFooter() {
    return FixedFooter();
  }

  Widget getHeader() {
    if (layoutType == LayoutType.FixedHeaderSider) {
      return FixedAppBar();
    } else if (layoutType == LayoutType.FixedHeader) {
      return FixedAppBar();
    } else {
      return SliverToBoxAdapter(
        child: Container(),
      );
    }
  }

  Widget getDrawer(BuildContext context) {
    ScreenSize ss = SizeProvider.of(context).screenSize;
    return ss == ScreenSize.Small ? DrawerMenu() : Container();
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

    return Scaffold(
      endDrawer: getDrawer(context),
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
              /*/ headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  getHeader(),
                ];
              },*/
              slivers: [
                getHeader(),
                SliverToBoxAdapter(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      color: Colors.black12,
                      padding: contentPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(pageName),
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 16.0),
                          ),
                          Container(
                            color: Colors.white,
                            height: 1000,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
