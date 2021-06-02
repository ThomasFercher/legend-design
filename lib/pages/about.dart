import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/legendScaffold.dart';
import 'package:webstore/styles/layoutType.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      content: Text("Products"),
      pageName: "About",
      layoutType: LayoutType.FixedSider,
    );
  }
}