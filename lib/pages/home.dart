import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/fixedAppBar.dart';
import 'package:webstore/router/routerProvider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppBar(),
      body: Container(
        child: TextButton(
          onPressed: () => {
            RouterProvider.of(context).pushPage(
              settings: RouteSettings(name: "/test"),
            )
          },
          child: Text("yeee"),
        ),
      ),
    );
  }
}
