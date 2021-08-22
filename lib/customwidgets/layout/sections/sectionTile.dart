import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/layout/sectionNavigation/sectionNavigation.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';

class SectionTile extends StatelessWidget {
  final String name;

  const SectionTile({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      title: Container(
        alignment: Alignment.center,
        child: LegendText(
          text: name,
          textStyle: LegendTextStyle.siderMenuCollapsed().copyWith(
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
