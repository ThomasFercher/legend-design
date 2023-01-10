import 'package:flutter/material.dart';
import 'package:legend_design_core/interfaces/size_delegate.dart';
import 'package:legend_design_core/styles/sizing/core/override.dart';
import 'package:legend_design_core/styles/sizing/core/legend_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/appbar/appBar_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/legend_sub_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/micros/menu/menu_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/micros/sidemenu/sidemenu_sizing.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/micros/tabbar/tabbar_sizing.dart';
import 'package:legend_design_core/styles/typography/style/typography_sizing.dart';

class AppSizing extends SizingDelegate {
  @override
  LegendSizing get defaultSizing {
    return LegendSizing(
      custom: {
        'test': 20,
      },
      key: 720,
      elevation1: 0,
      elevation2: 1,
      elevation3: 2,
      elevation4: 4,
      iconSize1: 14,
      iconSize2: 20,
      iconSize3: 26,
      iconSize4: 32,
      radius1: 4,
      radius2: 8,
      radius3: 12,
      radius4: 16,
      spacing1: 64,
      spacing2: 16,
      spacing3: 24,
      spacing4: 64,
      subSizing: (sizing) {
        return LegendSubSizing(
          footerSizing: FooterSizing(
            height: 100,
            maxWidth: 1000,
            padding: EdgeInsets.all(24),
          ),
          siderSizing: SiderSizing(
            width: 200,
            iconSize: 24,
            spacing: 8,
            padding: EdgeInsets.all(4),
            buildComponents: (SiderSizingInfo sizing) {
              return SiderSizingComponents(
                sideMenuSizing: SideMenuSizing(
                  borderRadius: BorderRadius.circular(12),
                  iconSize: 24,
                  itemHeight: 48,
                  spacing: 8,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                ),
              );
            },
          ),
          typographySizing: TypographySizing(
            h0: 12,
            h1: 14,
            h2: 16,
            h3: 20,
            h4: 26,
            h5: 30,
          ),
          appBarSizing: AppBarSizing(
            appBarHeight: 80,
            contentPadding: EdgeInsets.only(
              right: 16,
              left: 16,
            ),
            iconSize: 22,
            spacing: 12,
            logoSize: 48,
            buildComponents: (sizing) {
              return AppBarSizingComponents(
                menuSizing: MenuSizing(
                  borderRadius: BorderRadius.circular(12),
                  iconSize: 24,
                  height: 48,
                  itemSpacing: 8,
                  spacing: 12,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                ),
                subMenuSizing: SideMenuSizing(
                  borderRadius: BorderRadius.circular(12),
                  iconSize: 24,
                  itemHeight: 48,
                  spacing: 4,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                ),
                tabbarSizing: TabbarSizing(
                  height: 48,
                  alignment: MainAxisAlignment.center,
                ),
              );
            },
          ),
          menuDrawerSizing: MenuDrawerSizing(
            width: 320,
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
            subMenuIconSize: 12,
            buildComponents: (sizing) {
              return MenuDrawerSizingComponents(
                sideMenuSizing: SideMenuSizing(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  iconSize: 24,
                  itemHeight: 48,
                  spacing: 12,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              );
            },
          ),
          bottomBarSizing: BottomBarSizing(
            iconSize: 24,
            height: 80,
            itemWidth: 72,
            margin: EdgeInsets.zero,
            itemPadding: EdgeInsets.all(0),
            padding: EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            alignment: MainAxisAlignment.spaceAround,
            showText: true,
            fillBottom: true,
            textAtBottom: true,
          ),
        );
      },
    );
  }

  @override
  List<LegendSizingOverride>? get overrides {
    return [
      LegendSizingOverride(
        key: 480,
        spacing1: 16,
        spacing2: 12,
        subSizing: (sizing) {
          return LegendSubSizingOverride(
            typographySizing: TypographySizingOverride(
              h0: 12,
              h5: 22,
            ),
            appBarSizing: AppBarSizingOverride(
              appBarHeight: 64,
              logoSize: 40,
            ),
          );
        },
      ),
      LegendSizingOverride(
        key: 720,
        spacing1: 12,
        spacing2: 24,
        subSizing: (sizing) {
          return LegendSubSizingOverride(
            typographySizing: TypographySizingOverride(
              h0: 16,
              h5: 26,
            ),
            appBarSizing: AppBarSizingOverride(
              appBarHeight: 72,
              logoSize: 48,
            ),
          );
        },
      ),
      LegendSizingOverride(
        key: 1080,
        spacing1: 24,
        spacing2: 32,
      ),
      LegendSizingOverride(
        key: 1600,
        spacing1: 32,
        spacing2: 42,
      ),
    ];
  }
}
