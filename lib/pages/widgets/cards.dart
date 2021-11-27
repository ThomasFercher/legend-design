import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/router/routes/route_info.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/card/legendCard.dart';
import 'package:legend_design_widgets/layout/grid/legendGrid.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/src/provider.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return LegendScaffold(
      pageName: 'Cards',
      layoutType: LayoutType.FixedHeader,
      showSiderMenu: false,
      isUnderlyingRoute: true,
      contentBuilder: (context) {
        return Column(
          children: [
            LegendText(
              text:
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
              textStyle: theme.typography.h1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: LegendGrid(
                children: [
                  LegendCard(
                    title: "Polkadot",
                    subtitle: "+6.44% ",
                    icon: Icons.money,
                    iconColor: Colors.redAccent,
                    value: "30.94\$",
                  ),
                  LegendCard(
                    title: "Kadena",
                    subtitle: "+86.44% ",
                    icon: Icons.keyboard_arrow_right_sharp,
                    iconColor: Colors.purpleAccent,
                    value: "14.94\$",
                  ),
                  LegendCard(
                    title: "Tezos",
                    subtitle: "+8.44% ",
                    icon: Icons.drag_indicator_rounded,
                    iconColor: Colors.blueAccent,
                    value: " 5.36\$",
                  ),
                  LegendCard(
                    title: "Bitcoin",
                    subtitle: "+3.24% ",
                    icon: Icons.code_off,
                    iconColor: Colors.orangeAccent,
                    value: "56506.21\$",
                  ),
                ],
                sizes: LegendGridSize(
                  medium: LegendGridSizeInfo(4, 164),
                  layoutDirection: LegendGridSizeDirection.DOWN,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
