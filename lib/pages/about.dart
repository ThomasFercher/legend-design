import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legendScaffold.dart';
import 'package:legend_design_core/styles/layouts/layoutType.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:legend_design_widgets/modals/legendPopups.dart';
import 'package:legend_design_widgets/modals/modal.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return LegendScaffold(
      contentBuilder: (context) {
        return Column(
          children: [],
        );
      },
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
      onActionButtonPressed: (context) {
        LegendPopups.showLegendModal(
          context: context,
          modal: Modal(
            content: Text("test"),
            onConfirm: () => {},
            onCancle: () => {},
            height: 400,
            width: 400,
          ),
        );
      },
    );
  }
}
