import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../customwidgets/layout/fixed/fixedAppBar.dart';
import '../customwidgets/layout/legendScaffold.dart';
import '../styles/layoutType.dart';

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
