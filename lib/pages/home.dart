import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/legendBottomSheet.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/legendScaffold.dart';
import 'package:webstore/customwidgets/modal.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/layoutType.dart';
import 'package:webstore/styles/typography.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return LegendScaffold(
      contentBuilder: (context) {
        return Column(
          children: [
            Text("Home"),
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
      layoutType: LayoutType.FixedHeaderSider,
      pageName: "Home",
      onActionButtonPressed: (context) {
        showModal(
          context: context,
          builder: (context) {
            return Modal(
              content: Text("test"),
              height: 600,
              width: 600,
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
