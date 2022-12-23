import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:legend_design/widgets/package_card.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_config.dart';
import 'package:legend_design_core/layout/appBar.dart/legend_sliverbar.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/libraries/scaffold.dart';
import 'package:legend_design_core/state/legend_state.dart';
import 'package:legend_design_core/styles/typography/rich/legend_rich_text.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/list/list_item.dart';
import 'package:legend_design_widgets/input/text/paragraph/legendParagraph.dart';
import 'package:legend_design_widgets/legend_design_widgets.dart';

const verticalSpacing = 24.0;

class GettingStartedPage extends LegendWidget {
  const GettingStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LegendTheme theme) {
    final info = ScaffoldInfo.of(context);

    // Create 4 Different Paragraph Types for Article and 1 highlighted Base Text

    return LegendRouteBody(
      sliverAppBar: LegendSliverBar(
        config: LegendAppBarConfig(
          appBarHeight: 80,
          elevation: 1,
          floating: true,
        ),
        actions: info?.scaffold.builders.appBarActions,
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendParagraph(
              values: {
                ParagraphType(theme.typography.h5): "Tesat",
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: verticalSpacing / 1.5),
              child: Row(
                children: [
                  Icon(
                    Icons.stacked_line_chart_sharp,
                    size: 32,
                    color: theme.colors.secondary,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  LegendText(
                    "Features",
                    style: theme.typography.h5,
                  ),
                ],
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.settings_input_component,
                color: Colors.cyan,
                size: 22,
              ),
              text: LegendText(
                "UI Components designed for cross platform Applications.",
                style: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.person,
                color: Colors.greenAccent,
                size: 22,
              ),
              text: LegendText(
                "Devoloper friendly",
                style: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.developer_board,
                color: Colors.purpleAccent,
                size: 22,
              ),
              text: LegendText(
                "Devloped completely standalone, without any third party dependencies.",
                style: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.color_lens_sharp,
                color: Colors.blueGrey,
                size: 22,
              ),
              text: LegendText(
                "Powerful Sizing and Theming for every Platform",
                style: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.nat_outlined,
                color: Colors.teal,
                size: 22,
              ),
              text: LegendText(
                "Native Functionalites in Kotlyn, Swift, C++ and Javascript.",
                style: theme.typography.h1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: verticalSpacing / 1.5),
              child: LegendText(
                "Packages",
                style: theme.typography.h5,
              ),
            ),
            LegendWidgetLayout.dyn(
              children: [
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend Core",
                  version: "0.1.0",
                  url: "https://github.com/ThomasFercher/legend-core",
                ),
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend Widgets",
                  version: "0.1.0",
                  url: "https://github.com/ThomasFercher/legend-widgets",
                ),
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend Platform",
                  version: "0.0.1",
                  url: "https://github.com/ThomasFercher/legend-cross",
                ),
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend Template",
                  version: "1.0.0",
                  url: "https://github.com/ThomasFercher/legend-template",
                ),
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend Router",
                  version: "0.1.0",
                  url: "https://github.com/ThomasFercher/legend_router",
                ),
                PackageCard(
                  icon: AntIcons.githubFilled,
                  name: "Legend Utils",
                  version: "0.1.0",
                  url: "https://github.com/ThomasFercher/legend_utils",
                ),
              ],
              layouts: {
                720: LegendCustomColumn(
                  spacing: 12,
                  children: [
                    LegendCustomWidget(0),
                    LegendCustomWidget(1),
                    LegendCustomWidget(2),
                    LegendCustomWidget(3),
                    LegendCustomWidget(4),
                    LegendCustomWidget(5),
                  ],
                ),
                1560: LegendCustomColumn(
                  spacing: 12,
                  children: [
                    LegendCustomRow(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(0, flex: 1),
                        LegendCustomWidget(1, flex: 1),
                      ],
                    ),
                    LegendCustomRow(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(2, flex: 1),
                        LegendCustomWidget(3, flex: 1),
                      ],
                    ),
                    LegendCustomRow(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(4, flex: 1),
                        LegendCustomWidget(5, flex: 1),
                      ],
                    ),
                  ],
                ),
                1920: LegendCustomColumn(
                  spacing: 12,
                  children: [
                    LegendCustomRow(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(0, flex: 1),
                        LegendCustomWidget(1, flex: 1),
                        LegendCustomWidget(2, flex: 1),
                      ],
                    ),
                    LegendCustomRow(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(3, flex: 1),
                        LegendCustomWidget(4, flex: 1),
                        LegendCustomWidget(5, flex: 1),
                      ],
                    ),
                  ],
                ),
              },
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        LegendText(
          "Installation",
          style: theme.typography.h5,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
          ),
        ),
        LegendText(
          "With Command",
          style: theme.typography.h1,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
          ),
        ),
        Container(
          height: 48,
          //width: s.width,
          decoration: BoxDecoration(
            color: theme.colors.background3,
            borderRadius: theme.sizing.radius2.asRadius(),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: theme.sizing.radius2,
          ),
          child: LegendRichText(
            text: [
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "flutter",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "pub add \$packageName",
              ),
            ],
          ),
        ),
        LegendText(
          "Or you can manually add these to your pubspec.yaml.",
          style: theme.typography.h1,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
            top: verticalSpacing / 1.5,
          ),
        ),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: theme.colors.background3,
            borderRadius: theme.sizing.radius2.asRadius(),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            horizontal: theme.sizing.radius2,
          ),
          child: LegendRichText(
            text: [
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "dependencies:\n",
              ),
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "   legend_design_core:",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "^0.1.0\n",
              ),
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "   legend_design_widgets:",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "^0.1.0\n",
              ),
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "   legend_design_platform:",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "^0.0.1\n",
              ),
              RichTextItem(
                style:
                    theme.typography.h1.copyWith(color: theme.colors.secondary),
                text: "   legend_design_template:",
              ),
              RichTextItem(
                style: theme.typography.h1,
                text: "^1.0.0",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendText(
              "Usage",
              style: theme.typography.h5,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
              ),
            ),
            LegendText(
              "In your Flutter project you can use the following imports.",
              style: theme.typography.h1,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
              ),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: theme.colors.background3,
                borderRadius: theme.sizing.radius2.asRadius(),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: theme.sizing.radius2,
              ),
              child: LegendRichText(
                text: [
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "import",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text:
                        "\'package:legend_design_core/legend_design_core.dart\';\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "import",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text:
                        "\'package:legend_design_core/legend_design_widgets.dart\';\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "import",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text:
                        "\'package:legend_design_core/legend_design_platform.dart\';\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "import",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text:
                        "\'package:legend_design_core/legend_design_template.dart\';",
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: verticalSpacing,
        ),
        LegendText(
          "Get Started",
          style: theme.typography.h5,
          padding: const EdgeInsets.only(
            bottom: verticalSpacing / 1.5,
          ),
        ),
        LegendRichText(
          text: [
            RichTextItem(
              style: theme.typography.h1,
              text: "Please head over to our",
            ),
            RichTextItem(
              style: theme.typography.h1.copyWith(
                color: theme.colors.secondary,
              ),
              hoverColor: theme.colors.selection,
              text: "Documentation",
              onTap: () {
                LegendRouter.of(context).pushPage(
                  "/widgets",
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: verticalSpacing * 2,
        ),
      ],
    );
  }
}
