import 'dart:math';

import 'package:flutter/widgets.dart';

class ModalSheet extends StatelessWidget {
  final Alignment? alignment;
  final Point? position;
  final Widget child;

  const ModalSheet({
    Key? key,
    this.alignment,
    this.position,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (alignment != null)
          Align(
            alignment: alignment!,
            child: child,
          ),
        if (position != null && alignment == null)
          Positioned(
            top: position!.y as double,
            left: position!.x as double,
            child: child,
          ),
      ],
    );
  }
}
