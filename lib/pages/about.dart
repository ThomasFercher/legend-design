import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/layout/sections/section.dart';
import 'package:legend_design_core/modals/legendPopups.dart';

import 'package:legend_design_core/styles/layouts/layout_type.dart';

import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';

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
          children: [
            Section(
              header: "What is Legend Design?",
              children: [
                LegendText(
                  text: "Legend Design aims to provide all basic needs for developing  Cross-Plattform Applications. These include Routing, Colors, Layouts, Sizing and many other little things. " +
                      "Using the Legend Design package enables developers to write clean code without much boilerplate which is suited for every platform. " +
                      "On top of this Legend Design Custom Widgets on most of the functionality can be used on its own, so you dont get forced to use everything provided. ",
                  textStyle: theme.typography.h0,
                ),
              ],
            ),
          ],
        );
      },
      layoutType: LayoutType.FixedSider,
      pageName: "Home",
    );
  }
}
