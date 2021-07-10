import 'package:flutter/material.dart';

class GridChild extends StatelessWidget {
  final Widget child;
  const GridChild({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        print(c);
        return Container(
          height: c.maxHeight,
          width: c.maxWidth,
          constraints: BoxConstraints(
            minHeight: 0.0,
            minWidth: 0.0,
            maxHeight: 10,
            maxWidth: 10,
          ),
          child: Container(
            height: 40,
            color: Colors.red,
            child: child,
          ),
        );
      },
    );
  }
}
