import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webstore/styles/legendTheme.dart';
import '../customwidgets/legendBottomSheet.dart';
import '../customwidgets/legendButton/legendButton.dart';
import '../customwidgets/legendScaffold.dart';
import '../customwidgets/modal.dart';
import '../customwidgets/typography/legendText.dart';
import '../styles/layoutType.dart';
import '../styles/typography.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    LegendTheme theme = Provider.of<LegendTheme>(context);
    return LegendScaffold(
      contentBuilder: (context) {
        return Column(
          children: [
            Text("Home"),
            LegendButton(
              text: Text("Change Theme to Dark"),
              onPressed: () {
                Provider.of<LegendTheme>(context, listen: false)
                    .changeColorTheme(LegendColorThemeType.DARK);
              },
            ),
            LegendButton(
              text: Text("Change Theme to Light"),
              onPressed: () {
                Provider.of<LegendTheme>(context, listen: false)
                    .changeColorTheme(LegendColorThemeType.LIGHT);
              },
            ),
            LegendButton(
              text: Text("Show Modal Bottom"),
              onPressed: () => {
                Scaffold.of(context).showBottomSheet(
                  (context) {
                    return LegendBottomSheet(
                      title: "Cookies",
                      onCancel: () {},
                      onConfirm: () {},
                      content: LegendText(
                        text: "Bitte aktzeptieren Sie unsere Cookies! LIT",
                        textStyle: LegendTextStyle.h5(),
                      ),
                    );
                  },
                  backgroundColor: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                ),
              },
            )
          ],
        );
      },
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
      onActionButtonPressed: (context) {
        showModal(
          context: context,
          builder: (context) {
            return Modal(
              content: Text("test"),
              height: 600,
              width: 400,
              onCancle: () {},
              onConfirm: () {},
            );
          },
          configuration: FadeScaleTransitionConfiguration(
            transitionDuration: Duration(milliseconds: 250),
            barrierDismissible: true,
            reverseTransitionDuration: Duration(milliseconds: 250),
          ),
        );
      },
    );
  }
}
