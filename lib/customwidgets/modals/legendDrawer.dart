import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/grid/legendGrid.dart';
import 'package:webstore/customwidgets/layout/grid/legendGridSize.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import 'package:webstore/styles/theming/legendTheme.dart';
import 'package:webstore/styles/theming/sizing/sizeProvider.dart';

class LegendDrawer extends StatefulWidget {
  final double width;
  final void Function()? onClosed;

  LegendDrawer({
    Key? key,
    required this.width,
    this.onClosed,
  }) : super(key: key);

  @override
  _LegendDrawerState createState() => _LegendDrawerState();
}

class _LegendDrawerState extends State<LegendDrawer>
    with SingleTickerProviderStateMixin {
  late double width;
  late double maxWidth;

  late AnimationController controller;
  late Animation<double> animation;
  late Animation<Color?> background;

  late Color backgroundColor;

  @override
  void initState() {
    width = 0;
    backgroundColor = Colors.black87;
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
    );
    background = ColorTween(
      begin: Colors.transparent,
      end: backgroundColor,
    ).animate(controller)
      ..addListener(() {
        setState(() {
          backgroundColor = background.value ?? backgroundColor;
        });
      });
    animation = Tween<double>(
      begin: width,
      end: widget.width,
    ).animate(controller)
      ..addListener(() {
        setState(() {
          width = animation.value;
        });
      });

    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    return Material(
      color: Colors.transparent,
      child: Container(
        width: SizeProvider.of(context).width,
        height: SizeProvider.of(context).height,
        color: backgroundColor,
        child: Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              width: width,
              height: SizeProvider.of(context).height,
              color: theme.colors.foreground[0],
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LegendText(
                        text: "Settings",
                        textStyle: LegendTextStyle.h2().copyWith(
                          color: theme.colors.textColorDark,
                        ),
                      ),
                      LegendButton(
                        text: Text("close"),
                        onPressed: () {
                          if (widget.onClosed != null) widget.onClosed!();
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Divider(
                      color: theme.colors.foreground[1],
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        LegendGrid(
                          width: width > 32 ? width - 31 : 1,
                          children: [
                            Container(
                              color: Colors.red,
                            ),
                            Container(
                              color: Colors.green,
                            ),
                          ],
                          sizes: new LegendGridSize(
                            xxl: LegendGridSizeInfo(2, 200),
                            layoutDirection: LegendGridSizeDirection.DOWN,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Divider(
                      color: theme.colors.foreground[1],
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                      ),
                      Icon(
                        Icons.settings_applications,
                        color: theme.colors.textColorLight,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32),
                      ),
                      Icon(
                        Icons.info_outlined,
                        color: theme.colors.textColorLight,
                        size: 30,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
