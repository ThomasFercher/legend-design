import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/router/legend_router.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    LegendTheme theme = context.watch<LegendTheme>();

    return LegendScaffold(
      showAppBarMenu: true,
      contentBuilder: (context, s) {
        return Column(
          children: [
            LegendText(
              text: "Legend Design aims to provide all basic needs for developing  Cross-Plattform Applications. These include Routing, Colors, Layouts, Sizing and many other little things. " +
                  "Using the Legend Design package enables developers to write clean code without much boilerplate which is suited for every platform. " +
                  "On top of this Legend Design Custom Widgets on most of the functionality can be used on its own, so you dont get forced to use everything provided. ",
              textStyle: theme.typography.h0,
            ),
            Container(
              height: 40,
              width: 592,
              color: Colors.red,
            )
          ],
        );
      },
      appBarBuilder: (context) {
        return LegendAnimatedIcon(
          icon: Icons.color_lens,
          theme: LegendAnimtedIconTheme(
            enabled: theme.colors.selection,
            disabled: theme.colors.appBarPalette.foreground,
          ),
          iconSize: theme.appBarSizing.iconSize ?? 32,
          disableShadow: true,
          onPressed: () {
            LegendRouter.of(context)
                .pushPage(settings: RouteSettings(name: "/settings"));
          },
        );
      },
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
      enableDefaultSettings: true,
    );
  }
}
