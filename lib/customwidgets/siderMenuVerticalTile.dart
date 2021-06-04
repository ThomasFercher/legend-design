import 'package:flutter/material.dart';
import 'package:webstore/router/routerProvider.dart';

class SiderMenuVerticalTile extends StatelessWidget {
  final String path;
  final IconData icon;
  final String? title;

  SiderMenuVerticalTile({required this.path, required this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 64,
      child: InkWell(
        onTap: () => {
          RouterProvider.of(context).pushPage(
            settings: RouteSettings(name: path),
          )
        },
        child: Column(
          children: [
            Expanded(
              child: Icon(icon),
            ),
            title != null ? Text(title ?? "") : Container()
          ],
        ),
      ),
    );
  }
}
