import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/fixedAppBar.dart';
import 'package:webstore/customwidgets/legendScaffold.dart';
import 'package:webstore/styles/layoutType.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      contentBuilder: (context) => Text("Products"),
      pageName: "Products",
      layoutType: LayoutType.FixedHeader,
    );
  }
}
