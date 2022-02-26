import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/input/selectBar/legendSelectBar.dart';
import 'package:legend_design_widgets/input/selectBar/legendSelectOption.dart';
import 'package:legend_design_widgets/layout/grid/legendGrid.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';
import 'package:provider/src/provider.dart';

class SelectButtonBarPage extends StatelessWidget {
  const SelectButtonBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return LegendScaffold(
      pageName: 'SelectButtonBar',
      layoutType: LayoutType.FixedHeader,
      showSiderMenu: false,
      isUnderlyingRoute: true,
      contentBuilder: (context, s) {
        return Column(
          children: [
            LegendText(
              text:
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
              textStyle: theme.typography.h1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, left: 18, right: 18),
              child: LegendGrid(
                sizes: LegendGridSize(
                  small: LegendGridSizeInfo(1, 64),
                  large: LegendGridSizeInfo(2, 80),
                  layoutDirection: LegendGridSizeDirection.DOWN,
                ),
                crossAxisSpacing: 48,
                children: [
                  LegendSelectBar(
                    color: Colors.white,
                    isCard: true,
                    borderRadius: theme.sizing.borderRadius[0] * 4,
                    options: [
                      LegendSelectOption(
                        color: Colors.greenAccent,
                        icon: Icons.credit_card,
                        name: "1",
                      ),
                      LegendSelectOption(
                        color: Colors.greenAccent,
                        icon: Icons.wallet_giftcard,
                        name: "2",
                      ),
                      LegendSelectOption(
                        color: Colors.greenAccent,
                        icon: Icons.money,
                        name: "3",
                      ),
                    ],
                    aligment: MainAxisAlignment.spaceAround,
                    onSelected: (a) {},
                    iconSize: 32,
                  ),
                  LegendSelectBar(
                    color: theme.colors.primaryColor,
                    borderRadius: theme.sizing.borderRadius[0],
                    options: [
                      LegendSelectOption(
                        color: theme.colors.secondaryColor,
                        icon: Icons.credit_card,
                        name: "1",
                      ),
                      LegendSelectOption(
                        color: theme.colors.secondaryColor,
                        icon: Icons.wallet_giftcard,
                        name: "2",
                      ),
                      LegendSelectOption(
                        color: theme.colors.secondaryColor,
                        icon: Icons.money,
                        name: "3",
                      ),
                    ],
                    aligment: MainAxisAlignment.spaceAround,
                    onSelected: (a) {
                      print(a);
                    },
                    isCard: true,
                    iconSize: 32,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
