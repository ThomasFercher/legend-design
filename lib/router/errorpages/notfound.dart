import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/fixedAppBar.dart';
import 'package:webstore/customwidgets/legendScaffold.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LegendScaffold(content: Text("error"), pageName: "error");
  }
}
