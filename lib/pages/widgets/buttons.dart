import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:legend_design_core/layout/legend_scaffold.dart';
import 'package:legend_design_core/router/routes/route_info.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/theming/theme_provider.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_widgets/layout/grid/legendGrid.dart';
import 'package:legend_design_widgets/layout/grid/legendGridSize.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';
import 'package:legend_design_widgets/legendButton/legendButtonStyle.dart';
import 'package:provider/src/provider.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = context.watch<ThemeProvider>();
    return LegendScaffold(
      pageName: 'Buttons',
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
            LegendGrid(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              sizes: LegendGridSize(
                small: LegendGridSizeInfo(1, 36),
                medium: LegendGridSizeInfo(2, 36),
                large: LegendGridSizeInfo(4, 36),
                xxl: LegendGridSizeInfo(4, 36),
              ),
              children: [
                LegendButton(
                  margin: EdgeInsets.all(4),
                  text: LegendText(
                    text: "Alert",
                  ),
                  onPressed: () => {},
                  style: LegendButtonStyle.danger(),
                ),
                LegendButton(
                  margin: EdgeInsets.all(4),
                  text: LegendText(
                    text: "Sucess",
                  ),
                  onPressed: () => {},
                  style: LegendButtonStyle.confirm(),
                ),
                LegendButton(
                  margin: EdgeInsets.all(4),
                  text: LegendText(
                    text: "Info",
                  ),
                  onPressed: () => {},
                  style: LegendButtonStyle.normal(
                      // height: 48,

                      ),
                ),
                LegendButton(
                  margin: EdgeInsets.all(4),
                  text: LegendText(text: "Gradient"),
                  onPressed: () => {},
                  style: LegendButtonStyle.gradient(
                    [
                      Colors.red[200]!,
                      Colors.redAccent,
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.colors.background[1],
                borderRadius: theme.sizing.borderRadius[1],
              ),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(
                theme.sizing.borderInset[1],
              ),
              child: Container(
                height: 180,
                child: SyntaxView(
                  code:
                      "LegendButton(\n margin: EdgeInsets.all(16),\n text: LegendText(text: \"Gradient\"),\n onPressed: () => {},\n style: LegendButtonStyle.gradient(\n  [\n   Colors.red[200]!,\n   Colors.redAccent \n  ] \n);  ",
                  syntax: Syntax.DART,
                  syntaxTheme: SyntaxTheme(
                    backgroundColor: Colors.transparent,
                    baseStyle: theme.typography.h0.copyWith(
                      color: theme.colors.foreground[3],
                    ),
                  ),
                  fontSize: theme.typography.h0.fontSize!,
                  withZoom: false,
                  withLinesCount: false,
                  expanded: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
