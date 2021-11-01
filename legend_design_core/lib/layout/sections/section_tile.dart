import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/sectionNavigation/section_navigation.dart';
import 'package:legend_design_core/router/routes/section_route_info.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

class SectionTile extends StatelessWidget {
  late final String name;
  late final String displayName;

  SectionTile({
    Key? key,
    required String name,
  }) : super(key: key) {
    displayName = name.replaceAll('/', '').capitalize();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      enabled: true,
      enableFeedback: true,
      title: Container(
        alignment: Alignment.center,
        child: LegendText(
          selectable: false,
          text: displayName,
          textStyle: LegendTextStyle.sectionLink().copyWith(),
        ),
      ),
      onTap: () {
        SectionNavigation.of(context)
            ?.navigateToSection(SectionRouteInfo(name: name));
      },
    );
  }
}
