import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../customwidgets/layout/fixed/fixedAppBar.dart';
import '../../customwidgets/layout/legendScaffold.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      contentBuilder: (context) => Text("error"),
      pageName: "error",
    );
  }
}
