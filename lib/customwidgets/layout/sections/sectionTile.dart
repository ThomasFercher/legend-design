import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/layout/sectionNavigation/sectionNavigation.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class SectionTile extends StatelessWidget {
  late final String name;
  late final String displayName;

  SectionTile({
    Key? key,
    required String name,
  }) : super(key: key) {
    this.name = name;
    this.displayName = name.replaceAll("/", "").capitalize();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      title: Container(
        alignment: Alignment.center,
        child: LegendText(
          selectable: false,
          text: displayName,
          textStyle: LegendTextStyle.sectionLink().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onTap: () {
        SectionNavigation.of(context)
            ?.navigateToSection(SectionRouteInfo(name: name));
      },
    );
  }
}
