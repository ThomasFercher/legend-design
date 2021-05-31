import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/fixedAppBar.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: FixedAppBar(),
      body: Center(
        child: Text("Page not found 404!"),
      ),
    );
  }
}
