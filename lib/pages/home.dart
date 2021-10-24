import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/legendScaffold.dart';
import 'package:legend_design_core/layout/sections/section.dart';
import 'package:legend_design_core/styles/layouts/layoutType.dart';
import 'package:legend_design_core/styles/theming/legendTheme.dart';
import 'package:legend_design_core/styles/theming/themeProvider.dart';
import 'package:legend_design_core/typography/legendText.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_widgets/modals/legendPopups.dart';
import 'package:legend_design_widgets/modals/modal.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return LegendScaffold(
      contentBuilder: (context) {
        return Column(
          children: [
            Section(
              verticalSpacing: 12,
              header: "What is Legend Design?",
              children: [
                LegendText(
                  text: "Legend Design aims to provide all basic needs for developing  Cross-Plattform Applications. These include Routing, Colors, Layouts, Sizing and many other little things. " +
                      "Using the Legend Design package enables developers to write clean code without much boilerplate which is suited for every platform. " +
                      "On top of this Legend Design Custom Widgets on most of the functionality can be used on its own, so you dont get forced to use everything provided. ",
                  textStyle: LegendTextStyle.p(),
                ),
              ],
            ),
          ],
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
