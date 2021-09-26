import 'package:webstore/styles/layouts/layoutType.dart';
import 'package:webstore/styles/theming/legendTheme.dart';

enum LegendGridSizeDirection {
  UP,
  DOWN,
}

class LegendGridSize {
  late LegendGridSizeInfo? small;
  late LegendGridSizeInfo? medium;
  late LegendGridSizeInfo? large;
  late LegendGridSizeInfo? xxl;
  late LegendGridSizeDirection? layoutDirection;

  final LegendGridSizeInfo def = LegendGridSizeInfo(1, 64);

  LegendGridSize({
    LegendGridSizeInfo? small,
    LegendGridSizeInfo? medium,
    LegendGridSizeInfo? large,
    LegendGridSizeInfo? xxl,
    this.layoutDirection,
  }) {
    this.layoutDirection = this.layoutDirection ?? LegendGridSizeDirection.DOWN;

    List<LegendGridSizeInfo?> infos = [
      small,
      medium,
      large,
      xxl,
    ];

    for (var i = 0; i < infos.length; i++) {
      LegendGridSizeInfo? inf = infos[i];

      if (inf == null) {
        if (layoutDirection == LegendGridSizeDirection.DOWN) {
          for (var j = i - 1; j >= 0; j--) {
            infos[i] = infos[j];
            if (infos[j] != null) {
              break;
            }
          }

          if (infos[i] == null) {
            for (var k = i + 1; k <= infos.length; k++) {
              infos[i] = infos[k];
              if (infos[k] != null) {
                break;
              }
            }
          }
        } else {
          for (var k = i + 1; k < infos.length; k++) {
            infos[i] = infos[k];
            if (infos[k] != null) {
              break;
            }
          }

          if (infos[i] == null) {
            for (var j = i - 1; j >= 0; j--) {
              infos[i] = infos[j];
              if (infos[j] != null) {
                break;
              }
            }
          }
        }
      }
    }

    this.small = infos[0] ?? def;
    this.medium = infos[1] ?? def;
    this.large = infos[2] ?? def;
    this.xxl = infos[3] ?? def;
  }

  bool checkIfNoSizing(List<LegendGridSizeInfo?> sizes) {
    if (sizes.any((element) => element != null)) {
      return false;
    }
    return true;
  }

  LegendGridSizeInfo getSizeForSize(ScreenSize size) {
    switch (size) {
      case ScreenSize.Small:
        return small!;

      case ScreenSize.Medium:
        return medium!;
      case ScreenSize.Large:
        return large!;
      case ScreenSize.XXL:
        return xxl!;
      default:
        return def;
    }
  }
}

class LegendGridSizeInfo {
  final int count;
  final double height;

  LegendGridSizeInfo(this.count, this.height);
}
