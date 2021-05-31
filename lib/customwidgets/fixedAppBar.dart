import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FixedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey("appbar"),
      child: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text("Flutter Web AppBar"),
      ),
    );
  }
}
