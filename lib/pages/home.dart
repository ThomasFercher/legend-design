import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/input/selectBar/legendSelectBar.dart';
import 'package:webstore/customwidgets/input/selectBar/legendSelectOption.dart';
import 'package:webstore/customwidgets/legendButton/legendButtonStyle.dart';
import 'package:webstore/customwidgets/modals/legendAlert.dart';
import 'package:webstore/customwidgets/modals/legendPopups.dart';
import 'package:webstore/styles/theming/legendTheme.dart';
import '../customwidgets/modals/legendBottomSheet.dart';
import '../customwidgets/legendButton/legendButton.dart';
import '../customwidgets/layout/legendScaffold.dart';
import '../customwidgets/modals/modal.dart';
import '../customwidgets/typography/legendText.dart';
import '../styles/layouts/layoutType.dart';
import '../customwidgets/typography/typography.dart';

class Home extends StatelessWidget {
  const Home();

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
              text: Text("Show Success Alert"),
              onPressed: () {
                LegendPopups.showAlert(
                  context: context,
                  alert: LegendAlert.success(
                    message: "Ja geschafft du verdammta Trottlwichsa!",
                  ),
                );
              },
              style: LegendButtonStyle.confirm(),
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
              style: LegendButtonStyle.confirm(height: 100),
            ),
          ],
        );
      },
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
      onActionButtonPressed: (context) {
        LegendPopups.showLegendModal(
          context: context,
          modal: Modal(
            content: Text("test"),
            onConfirm: () => {},
            onCancle: () => {},
            height: 400,
            width: 400,
          ),
        );
      },
    );
  }
}
