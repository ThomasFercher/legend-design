import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/layout/fixed/appBar.dart/fixedMenu.dart';
import 'package:webstore/objects/menuOption.dart';
import 'package:webstore/router/routerProvider.dart';
import 'package:webstore/styles/legendTheme.dart';

class FixedBottomBar extends StatelessWidget {
  final bool? fit;

  const FixedBottomBar({
    Key? key,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    List<MenuOptionHeader> options = RouterProvider.of(context)
        .menuOptions
        .map(
          (option) => MenuOptionHeader(
            title: option.title,
            page: option.page,
            icon: option.icon,
            onSelected: (page) {},
          ),
        )
        .toList();

    return Container(
      color: theme.colors.scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: options,
          ),
        ),
      ),
      height: 64 + 16,
    );
  }
}
