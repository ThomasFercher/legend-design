import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final paint = Paint()..color = Colors.tealAccent[100]!;

    double csize = 200;
    double ssize = height < width ? height : width;
    double radius = (ssize < csize ? ssize * 0.5 : csize) / 2;

    canvas.drawCircle(
      Offset((0.25 * csize) - csize / 2, radius + 100),
      radius,
      paint,
    );

    csize = 300;
    radius = (ssize < csize ? ssize * 0.5 : csize) / 2;
    canvas.drawCircle(
      Offset(width - ((0.75 * csize) - csize / 2), radius + 500),
      radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

abstract class PaintHelper {}

class BezierPainter {
  late Path _path;

  List<Point<double>> points = [];

  double _px = 0;
  double _py = 0;

  BezierPainter() : _path = Path()..moveTo(0.0, 0.0);

  void addPoint(
    double x,
    double y,
    double cx1,
    double cy1,
    double cx2,
    double cy2,
  ) {
    final p0 =
        points.length < 2 ? Point<double>(0, 0) : points[points.length - 2];
    final p1 = points.length < 2 ? Point<double>(0, 0) : points.last;

    _path.cubicTo(cx1, cy1, cx2, cy2, x, y);
    _px = cx1;
    _py = cy1;

    points.add(Point(cx1, cy1));
    points.add(Point(cx2, cy2));
  }

  Path get path {
    _path.close();
    return _path;
  }

  polyform(
    double p0,
    double p1,
    double p2,
    double p3,
    int t,
  ) {
    return (-p0 + 3 * p1 - 3 * p2 + p3) * t * t * t +
        3 * (p0 - 2 * p1 + p2) * t * t -
        3 * (p0 - p1) * t +
        p0;
  }

  derive(
    double p0,
    double p1,
    double p2,
    double p3,
    int t,
  ) {
    return 3 * (-p0 + 3 * p1 - 3 * p2 + p3) * t * t + 6 * (p0 - 2 * p1 + p2);
  }

  derive2(
    double p0,
    double p1,
    double p2,
    double p3,
    int t,
  ) {
    return 6 * (-p0 + 3 * p1 - 3 * p2 + p3) * t + 6 * (p0 - 2 * p1 + p2);
  }
}
