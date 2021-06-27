import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/objects/assetInfo.dart';

class LegendAlert extends StatelessWidget {
  String? message;
  Widget? icon;
  IconData? iconData;

  LegendAlert({
    this.message,
    this.icon,
    this.iconData,
  });

  LegendAlert.success({this.message}) {
    icon = flareIcon(AssetInfo.successAlert);
  }

  LegendAlert.info({this.message}) {
    icon = flareIcon(AssetInfo.successAlert);
  }

  LegendAlert.danger({this.message}) {
    icon = flareIcon(AssetInfo.successAlert);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 400,
      child: icon == null ? Icon(iconData) : icon,
    );
  }

  Widget flareIcon(String flarePath) {
    return RiveAnimation.asset(
      flarePath,
      fit: BoxFit.scaleDown,
    );
  }

  Widget normalIcon() {
    return Container(
      child: Column(
        children: [
          Icon(
            this.iconData,
          ),
          LegendText(text: message ?? "No message provided!")
        ],
      ),
    );
  }
}
