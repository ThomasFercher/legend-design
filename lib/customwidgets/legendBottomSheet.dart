import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/legendButton/buttonStyle.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/styles/layoutType.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/styles/themeProvider.dart';

class LegendBottomSheet extends StatelessWidget {
  final String title;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Widget content;

  LegendBottomSheet({
    Key? key,
    required this.title,
    required this.onConfirm,
    required this.onCancel,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = ThemeProvider.of(context);
    SizeProvider ss = SizeProvider.of(context);

    double width;

    if (ss.screenSize == ScreenSize.Medium ||
        ss.screenSize == ScreenSize.Small) {
      width = ss.width;
    } else {
      width = ss.width / 3;
    }

    return Container(
      alignment: Alignment.bottomCenter,
      height: 160,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          maxHeight: 160,
          minWidth: width,
          minHeight: 160,
        ),
        child: Card(
          color: Colors.white,
          elevation: 10.0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: theme.borderRadius.copyWith(
              bottomLeft: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: theme.borderRadius.topLeft.x / 2,
                    bottom: theme.borderRadius.topLeft.x / 2,
                    right: theme.borderRadius.topLeft.x / 2,
                    left: theme.borderRadius.topLeft.x,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                      ),
                      IconButton(
                        splashRadius: 20.0,
                        onPressed: () => {
                          // Maybe Implement with RouterProvider
                          Navigator.pop(context),
                        },
                        icon: Icon(Icons.close),
                        padding: EdgeInsets.all(0),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: theme.borderRadius.topLeft.x,
                    ),
                    child: content,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: theme.borderRadius.topLeft.x / 2,
                    bottom: theme.borderRadius.topLeft.x / 2,
                    right: theme.borderRadius.topLeft.x / 2,
                    left: theme.borderRadius.topLeft.x,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LegendButton(
                        onPressed: () {
                          Navigator.pop(context);
                          onCancel();
                        },
                        text: Text("Cancel"),
                        style: LegendButtonStyle.danger().style,
                      ),
                      LegendButton(
                        onPressed: () {
                          onConfirm();
                        },
                        text: Text("Confirm"),
                        style: LegendButtonStyle.confirm().style,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
