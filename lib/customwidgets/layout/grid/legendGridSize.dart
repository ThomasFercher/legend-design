class LegendGridSize {
  final LegendGridSizeInfo small;
  final LegendGridSizeInfo medium;
  final LegendGridSizeInfo large;
  final LegendGridSizeInfo xxl;

  LegendGridSize({
    required this.small,
    required this.medium,
    required this.large,
    required this.xxl,
  });
}

class LegendGridSizeInfo {
  final int count;
  final double height;

  LegendGridSizeInfo(this.count, this.height);
}
