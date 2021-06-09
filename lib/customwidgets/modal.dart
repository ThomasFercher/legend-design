import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/styles/sizeProvider.dart';
import 'package:webstore/styles/themeProvider.dart';

class Modal extends StatelessWidget {
  final double? width;
  final double? height;

  const Modal({
    Key? key,
    this.height,
    this.width,
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
                    height: 40,
                    padding: EdgeInsets.symmetric(
                      horizontal: theme.borderRadius.topLeft.x,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Title"),
                        IconButton(
                          onPressed: () => {
                            // Maybe Implement with RouterProvider
                            Navigator.pop(context),
                          },
                          icon: Icon(Icons.close),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey[300],
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
