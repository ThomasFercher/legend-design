import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:legend_design/pages/home.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:provider/provider.dart';

class WidgetComponents extends StatelessWidget {
  const WidgetComponents();

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();
    return LegendScaffold(
      showAppBarMenu: true,
      showTopSubMenu: false,
      showSiderChildMenu: true,
      contentBuilder: (context, size) {
        return Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LegendText(text: "Components", textStyle: theme.typography.h5),
              const SizedBox(
                height: 12,
              ),
              LegendText(
                text:
                    "Legend Design provides Components/Widgets for every occasion. ",
                textStyle: theme.typography.h1,
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LegendText(
                    text: "Principles",
                    textStyle: theme.typography.h4,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  LegendListItem(
                    icon: Icon(
                      Icons.recycling_outlined,
                      color: Colors.greenAccent,
                      size: 24,
                    ),
                    text: LegendText(
                      text: "Reusability",
                      textStyle: theme.typography.h1,
                    ),
                  ),
                  LegendListItem(
                    icon: Icon(
                      AntIcons.fontSizeOutlined,
                      color: Colors.pink,
                      size: 24,
                    ),
                    text: LegendText(
                      text: "Dynamic Sizing",
                      textStyle: theme.typography.h1,
                    ),
                  ),
                  LegendListItem(
                    icon: Icon(
                      Icons.developer_board,
                      color: Colors.deepPurple,
                      size: 24,
                    ),
                    text: LegendText(
                      text: "Customization",
                      textStyle: theme.typography.h1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              LegendText(
                text: "Data Display",
                textStyle: theme.typography.h4,
              ),
              const SizedBox(
                height: 24,
              ),
              LegendText(
                text: "Data Input",
                textStyle: theme.typography.h4,
              ),
              const SizedBox(
                height: 24,
              ),
              LegendText(
                text: "Modals",
                textStyle: theme.typography.h4,
              ),
              const SizedBox(
                height: 24,
              ),
              LegendText(
                text: "Layout",
                textStyle: theme.typography.h4,
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        );
      },
      pageName: "Widget Components",
      layoutType: LayoutType.FixedHeaderSider,
    );
  }
}
