import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../customwidgets/legendScaffold.dart';
import '../styles/layoutType.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      contentBuilder: (context) {
        return Text("Products");
      },
      pageName: "About",
      layoutType: LayoutType.FixedSider,
    );
  }
}
