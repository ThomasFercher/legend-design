import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawers/drawerMenu.dart';
import 'fixed/fixedAppBar.dart';
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
import '../../styles/typography.dart';

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
      height: MediaQuery.of(context).size.height,
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

    //TODO: Make COntent height fit screen if not specified
    var fixedHeaderHeight = 10;
    var whitespace = 16 * 2 + 10;
    var footerHeight = 200;

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
                            child: LegendText(
                              text: pageName,
                              textStyle: LegendTextStyle.h1(),
                            ),
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 16.0),
                          ),
                          Container(
                            color: Colors.white,
                            //    height: 1000,
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
