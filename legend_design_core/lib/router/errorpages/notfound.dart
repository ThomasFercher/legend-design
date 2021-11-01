import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      contentBuilder: (context) => Text('error'),
      pageName: 'error',
    );
  }
}
