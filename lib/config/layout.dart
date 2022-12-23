import 'package:flutter/material.dart';
import 'package:legend_design_core/interfaces/layout_delegate.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_layout.dart';
import 'package:legend_design_core/layout/bottomBar.dart/bottom_bar_layout.dart';
import 'package:legend_design_core/layout/config/route_layout.dart';
import 'package:legend_design_core/layout/footer/fixed_footer.dart';
import 'package:legend_design_core/layout/footer/footer_layout.dart';
import 'package:legend_design_core/layout/menu_drawer/menu_drawer_layout.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/layout/config/dynamic_route_layout.dart';
import 'package:legend_design_core/layout/sider/sider_layout.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/styles/typography/widgets/legend_text.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_design_widgets/input/button/legendButton/legend_button.dart';

import 'widgets/footer.dart';

const header = "header";

const header2 = "header2";
const header_tabbar = "header_tabbar";
const headerSider = "header_sider";

class AppLayout extends LayoutDelegate {
  @override
  Map<String, DynamicRouteLayout> buildLayouts(splits) {
    return {
      header: DynamicRouteLayout.override(
        splits,
        defaultLayout: RouteLayout(
          appBarLayout: AppBarLayout(
            layout: AppBarLayoutConfig.body,
            aligment: AppBarLayoutType.TiMeAc,
            showTabbar: false,
          ),
          //  footerLayout: FooterLayout(),
          menuDrawerLayout: MenuDrawerLayout(
            type: MenuDrawerLayoutType.drawerRight,
          ),
        ),
        overrides: {
          splits.first: RouteLayoutOverride(
            bottomBarLayout: BottomBarLayoutOverride(
              selectionType: BottomBarSelectionType.whole,
            ),
          ),
        },
      ),
      header_tabbar: DynamicRouteLayout.override(
        splits,
        defaultLayout: RouteLayout(
          appBarLayout: AppBarLayout(
            layout: AppBarLayoutConfig.fixedAbove,
            aligment: AppBarLayoutType.TiMeAc,
            showTabbar: true,
          ),
          footerLayout: FooterLayout(),
        ),
        overrides: {
          splits.first: RouteLayoutOverride(
            bottomBarLayout: BottomBarLayoutOverride(
              selectionType: BottomBarSelectionType.icon,
            ),
            menuDrawerLayout: MenuDrawerLayoutOverride(
              type: MenuDrawerLayoutType.beneathAppBar,
            ),
          ),
        },
      ),
      headerSider: DynamicRouteLayout.override(
        splits,
        defaultLayout: RouteLayout(
          appBarLayout: AppBarLayout(
            layout: AppBarLayoutConfig.fixedAbove,
            aligment: AppBarLayoutType.TiMeAc,
            showTabbar: false,
          ),
          footerLayout: FooterLayout(),
          siderLayout: SiderLayout(
            left: true,
          ),
        ),
        overrides: {
          splits.first: RouteLayoutOverride(
            bottomBarLayout: BottomBarLayoutOverride(
              selectionType: BottomBarSelectionType.icon,
            ),
          ),
        },
      ),
    };
  }

  @override
  ScaffoldConfig get defaultConfig {
    return ScaffoldConfig(
      whether: ScaffoldWhether(
        showBackButton: false,
        showAppBarMenu: true,
        shareParentSiderMenu: false,
        showSiderChildMenu: false,
        showSiderMenu: false,
        showSiderSubMenu: false,
        showTopSubMenu: false,
        singlePage: false,
      ),
      builders: ScaffoldBuilders(
        appBarActions: (c, theme) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LegendButton.text(
                style: theme.typography.h1.copyWith(color: Colors.white),
                text: "Buy now",
                onTap: () {},
                background: Colors.pink,
                selBackground: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(16),
                margin: EdgeInsets.symmetric(
                  vertical: 12,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              LegendAnimatedIcon(
                icon: Icons.color_lens,
                theme: LegendAnimtedIconTheme(
                  enabled: theme.colors.selection,
                  disabled: theme.colors.appBar.foreground,
                ),
                padding: EdgeInsets.all(4),
                iconSize: theme.appBarSizing.iconSize,
                disableShadow: true,
                onPressed: () {
                  ModalRouter.of(c).push(
                    "/settings",
                  );
                },
              ),
            ],
          );
        },
        customFooter: FixedFooter(
          builder: (context, sizing, colors) => const GlobalFooter(),
        ),
      ),
    );
  }
}
