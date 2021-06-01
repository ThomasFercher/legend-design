import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/fixedAppBar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:webstore/customwidgets/fixedFooter.dart';
import 'package:webstore/customwidgets/fixedSider.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/styles/layoutType.dart';

class LegendScaffold extends StatelessWidget {
  final Widget content;
  final LayoutType? layoutType;
  final String pageName;

  const LegendScaffold({
    Key? key,
    required this.content,
    this.layoutType,
    required this.pageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return materialLayout();
    } else if (Platform.isIOS || Platform.isMacOS) {
      return cupertinoLayout();
    } else {
      return materialLayout();
    }
  }

  Widget cupertinoLayout() {
    return CupertinoPageScaffold(
      child: content,
    );
  }

  Widget getSider() {
    switch (layoutType) {
      case LayoutType.FixedSider:
        return FixedSider();
      case LayoutType.FixedHeaderSider:
        return FixedSider();
      default:
        return Container();
    }
  }

  Widget getFooter() {
    return FixedFooter();
  }

  Widget getHeader() {
    switch (layoutType) {
      case LayoutType.FixedHeader:
        return FixedAppBar();
      case LayoutType.FixedHeaderSider:
        return FixedAppBar();
      default:
        return SliverToBoxAdapter(
          child: Container(),
        );
    }
  }

  Widget materialLayout() {
    return Scaffold(
      body: Row(
        children: [
          getSider(),
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
                      padding: const EdgeInsets.all(16.0),
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
                            width: constraints.maxWidth - 32.0,
                            padding: const EdgeInsets.all(8.0),
                            child: content,
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
