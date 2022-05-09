import 'package:flutter/material.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/menu_drawer_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/sider_sizing.dart';
import 'package:legend_design_core/styles/typography/typography.dart';

class SizingTheme {
  static BottomBarSizing bottomBarSizing = BottomBarSizing(
    iconSize: 28,
    height: 72,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6.0,
          spreadRadius: 2.0,
        ),
      ],
    ),
  );

  static LegendSizingTheme sizingTheme = LegendSizingTheme(
    sizings: {
      420: LegendSizing(
        menuDrawerSizing: MenuDrawerSizing(
          iconSize: 24,
          width: 300,
          itemHeight: 48,
          subMenuHeaderHeight: 64,
          spacing: 12,
          itemPadding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 6,
          ),
          subItemPadding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 6,
          ),
          subMenuIconSize: 18,
        ),
        elevations: [0, 1, 2, 4],
        typographySizing: TypographySizing(baseSize: 14, maxSize: 32),
        borderRadius: [
          BorderRadius.all(
            Radius.circular(12),
          ),
          BorderRadius.all(
            Radius.circular(6),
          ),
          BorderRadius.all(
            Radius.circular(3),
          ),
        ],
        borderInset: [
          12,
          6,
          3,
        ],
        padding: [
          16,
          16,
          18,
        ],
        showBottomBar: true,
        bottomBarSizing: bottomBarSizing,
        appBarSizing: AppBarSizing(
          appBarHeight: 72,
          contentPadding: EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          borderRadius: Radius.circular(20),
          iconSize: 28,
          spacing: 24,
          logoSize: 42,
        ),
        hideSider: true,
        iconSizes: [28, 24, 22, 18],
      ),
      720: LegendSizing(
        siderSizing: SiderSizing(
          width: 200,
          iconSize: 24,
          itemHeight: 48,
          spacing: 8,
          itemPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          subMenuHeaderHeight: 48,
          subItemPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
        ),
        elevations: [0, 1, 2, 4],
        typographySizing: TypographySizing(baseSize: 12, maxSize: 36),
        borderRadius: [
          BorderRadius.all(
            Radius.circular(16.0),
          ),
          BorderRadius.all(
            Radius.circular(12.0),
          ),
        ],
        borderInset: [
          16,
          12,
        ],
        padding: [
          12,
          16,
          24,
        ],
        appBarSizing: AppBarSizing(
          appBarHeight: 80,
          contentPadding: EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          iconSize: 22,
          spacing: 12,
          logoSize: 48,
        ),
        collapsedSider: true,
        iconSizes: [28, 24, 22, 18],
        menuDrawerSizing: MenuDrawerSizing(
          width: 200,
          iconSize: 24,
          itemHeight: 48,
          spacing: 8,
          itemPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          subMenuHeaderHeight: 48,
          subItemPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
        ),
      ),
      1080: LegendSizing(
        siderSizing: SiderSizing(
          width: 220,
          iconSize: 26,
          itemHeight: 56,
          spacing: 8,
          itemPadding: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          subMenuHeaderHeight: 64,
          subItemPadding: EdgeInsets.symmetric(
            horizontal: 12,
          ),
        ),
        menuDrawerSizing: MenuDrawerSizing(
          width: 360,
          iconSize: 24,
          itemHeight: 48,
          spacing: 8,
          itemPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          subMenuHeaderHeight: 48,
          subItemPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
        ),
        elevations: [0, 1, 2, 4],
        typographySizing: TypographySizing(baseSize: 14, maxSize: 38),
        borderRadius: [
          BorderRadius.all(
            Radius.circular(12),
          ),
          BorderRadius.all(
            Radius.circular(6),
          ),
          BorderRadius.all(
            Radius.circular(3),
          ),
        ],
        borderInset: [
          12,
          6,
          3,
        ],
        padding: [
          16,
          22,
          28,
        ],
        appBarSizing: AppBarSizing(
          appBarHeight: 80,
          contentPadding: EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          borderRadius: Radius.circular(20),
          iconSize: 24,
          spacing: 16,
          logoSize: 56,
        ),
        iconSizes: [28, 24, 22, 18],
      ),
      1920: LegendSizing(
        siderSizing: SiderSizing(
          width: 260,
          iconSize: 28,
          itemHeight: 64,
          spacing: 12,
          itemPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          subMenuHeaderHeight: 64,
          subItemPadding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
        ),
        elevations: [0, 1, 2, 4],
        typographySizing: TypographySizing(baseSize: 14, maxSize: 40),
        borderRadius: [
          BorderRadius.all(
            Radius.circular(12),
          ),
          BorderRadius.all(
            Radius.circular(6),
          ),
          BorderRadius.all(
            Radius.circular(3),
          ),
        ],
        borderInset: [
          12,
          6,
          3,
        ],
        padding: [
          18,
          24,
          32,
        ],
        appBarSizing: AppBarSizing(
          appBarHeight: 80,
          contentPadding: EdgeInsets.only(
            right: 18,
            left: 18,
          ),
          borderRadius: Radius.circular(20),
          iconSize: 28,
          spacing: 16,
          logoSize: 64,
        ),
        iconSizes: [28, 24, 22, 18],
      ),
    },
  );
}
