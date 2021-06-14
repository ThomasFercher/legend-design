import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../customwidgets/fixedAppBar.dart';
import '../../customwidgets/legendScaffold.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      contentBuilder: (context) => Text("error"),
      pageName: "error",
    );
  }
}
