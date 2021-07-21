import 'package:flutter/material.dart';

class LegendSelectOption {
  final IconData? icon;
  final Color? color;
  final Gradient? gradient;
  final String name;

  LegendSelectOption({
    this.icon,
    required this.name,
    this.color,
    this.gradient,
  });
}
