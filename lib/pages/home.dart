import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/fixedAppBar.dart';
import 'package:webstore/customwidgets/fixedSider.dart';
import 'package:webstore/customwidgets/legendScaffold.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/layoutType.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return LegendScaffold(
      content: Text("Home"),
      layoutType: LayoutType.FixedHeaderSider,
      pageName: "Home",
    );
  }
}
