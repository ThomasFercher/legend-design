import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_config.dart';
import 'package:legend_design_core/layout/appBar.dart/legend_sliverbar.dart';
import 'package:legend_design_core/layout/scaffold/routebody/legend_route_body.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_widgets/datadisplay/header/legend_header.dart';
import 'package:legend_design_widgets/datadisplay/list/list_item.dart';
import 'package:legend_design_widgets/input/text/legendInputDecoration.dart';
import 'package:legend_design_widgets/input/text/legendTextField.dart';

class WidgetComponents extends StatelessWidget {
  const WidgetComponents();

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = LegendTheme.of(context);
    return LegendRouteBody(
      sliverAppBar: LegendSliverBar(
        config: LegendAppBarConfig(
          appBarHeight: 80,
          elevation: 4,
          pinned: true,
          forceElevate: true,
        ),
      ),
      children: [
        const SizedBox(
          height: 12,
        ),
        LegendText("Components", style: theme.typography.h5),
        const SizedBox(
          height: 12,
        ),
        LegendText(
          "Legend Design provides Components/Widgets for every occasion. ",
          style: theme.typography.h1,
        ),
        const SizedBox(
          height: 12,
        ),
        LegendHeader(
          header: Text(
            "Search Widgets",
            style: theme.typography.h2.copyWith(
              color: theme.colors.foreground1.withOpacity(0.7),
            ),
          ),
          spacing: 8,
          child: LegendTextField(
            decoration: LegendInputDecoration(
              cursorColor: theme.colors.selection,
              focusColor: theme.colors.selection,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colors.selection,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: theme.colors.disabled,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendText(
              "Principles",
              style: theme.typography.h4,
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
                "Reusability",
                style: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                AntIcons.fontSizeOutlined,
                color: Colors.pink,
                size: 24,
              ),
              text: LegendText(
                "Dynamic Sizing",
                style: theme.typography.h1,
              ),
            ),
            LegendListItem(
              icon: Icon(
                Icons.developer_board,
                color: Colors.deepPurple,
                size: 24,
              ),
              text: LegendText(
                "Customization",
                style: theme.typography.h1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        LegendText(
          "Data Display",
          style: theme.typography.h4,
        ),
        const SizedBox(
          height: 24,
        ),
        LegendText(
          "Data Input",
          style: theme.typography.h4,
        ),
        const SizedBox(
          height: 24,
        ),
        LegendText(
          "Modals",
          style: theme.typography.h4,
        ),
        const SizedBox(
          height: 24,
        ),
        LegendText(
          "Layout",
          style: theme.typography.h4,
        ),
      ],
    );
  }
}
