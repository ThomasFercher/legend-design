import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/router/routerProvider.dart';

class MenuOptionHeader extends StatelessWidget {
  final String title;
  final String page;
  final IconData icon;

  MenuOptionHeader({
    required this.title,
    required this.page,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: TextButton.icon(
        onPressed: () {
          RouterProvider.of(context)
              .pushPage(settings: RouteSettings(name: page));
        },
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
