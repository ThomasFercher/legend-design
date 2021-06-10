import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/legendButton/buttonStyle.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/styles/themeProvider.dart';

class Modal extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget content;
  final Function onConfirm;
  final Function onCancle;

  const Modal({
    Key? key,
    this.height,
    this.width,
    required this.content,
    required this.onConfirm,
    required this.onCancle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = ThemeProvider.of(context);

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Material(
            borderRadius: theme.borderRadius,
            color: Colors.white,
            child: Container(
              height: height,
              width: width,
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
                        Text("Title"),
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
                  Divider(
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: content,
                  ),
                  Divider(
                    color: Colors.grey[300],
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
                            onCancle();
                            Navigator.pop(context);
                          },
                          text: Text("Cancel"),
                          style: LegendButtonStyle.danger().style,
                        ),
                        LegendButton(
                          onPressed: () {
                            onConfirm();
                          },
                          text: Text("Confirm"),
                          style: LegendButtonStyle.normal().style,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
