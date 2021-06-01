import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/styles/themeProvider.dart';

class FixedSider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = ThemeProvider.of(context);

    return Hero(
      tag: ValueKey("sider"),
      child: Material(
        elevation: 20,
        child: Container(
          width: 200,
          height: MediaQuery.of(context).size.height,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
