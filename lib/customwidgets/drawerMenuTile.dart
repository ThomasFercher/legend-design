import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../router/routerProvider.dart';

class DrawerMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String path;

  const DrawerMenuTile(
      {required this.icon, required this.path, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        RouterProvider.of(context)
            .pushPage(settings: RouteSettings(name: path));
      },
    );
  }
}
