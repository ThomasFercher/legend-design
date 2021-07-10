import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/legendButton/legendButtonStyle.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import '../customwidgets/layout/fixed/fixedAppBar.dart';
import '../customwidgets/layout/legendScaffold.dart';
import '../styles/layoutType.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      contentBuilder: (context) {
        return Column(
          children: [
            LegendButton(
              text: LegendText(text: "test"),
              onPressed: () => {},
              style: LegendButtonStyle.confirm(),
            )
          ],
        );
      },
      pageName: "Products",
      layoutType: LayoutType.FixedHeader,
    );
  }
}
