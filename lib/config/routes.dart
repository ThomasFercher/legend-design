import 'package:flutter/material.dart';
import 'package:legend_design/pages/about.dart';
import 'package:legend_design/pages/drawerPages/settingsPage.dart';
import 'package:legend_design/pages/home.dart';
import 'package:legend_design/pages/services.dart';
import 'package:legend_design/pages/themeEditor/themeEditor.dart';
import 'package:legend_design/pages/widgetComponets.dart';
import 'package:legend_design/pages/widgets/buttons.dart';
import 'package:legend_design_core/interfaces/route_inferface.dart';
import 'package:legend_design_core/layout/appBar.dart/appbar_layout.dart';
import 'package:legend_design_core/layout/bottomBar.dart/bottom_bar_layout.dart';
import 'package:legend_design_core/layout/config/dynamic_route_layout.dart';
import 'package:legend_design_core/layout/config/route_layout.dart';
import 'package:legend_design_core/layout/footer/fixed_footer.dart';
import 'package:legend_design_core/layout/footer/footer_layout.dart';
import 'package:legend_design_core/layout/menu_drawer/menu_drawer.dart';
import 'package:legend_design_core/layout/menu_drawer/menu_drawer_layout.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/layout/sider/sider_layout.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/router/scaffold_route_info.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';

import '../pages/widgets/carousel.dart';
import '../pages/widgets/form.dart';
import '../pages/widgets/icons.dart';
import '../pages/widgets/modals.dart';
import '../pages/widgets/rating.dart';
import '../pages/widgets/selectButtonBar.dart';
import '../pages/widgets/table.dart';
import '../pages/widgets/tags.dart';
import '../pages/widgets/textfield.dart';
import 'widgets/footer.dart';
import 'package:legend_utils/extensions/maps.dart';

const header = "header";
const header2 = "header2";
const header_tabbar = "header_tabbar";
const sider = "sider";
const headerSider = "header_sider";

class RoutesTheme extends RouteInterface<String> {
  const RoutesTheme() : super();

  @override
  Map<String, DynamicRouteLayout> buildLayouts(splits) {
    final header2_default = RouteLayout(
      appBarLayout: AppBarLayout(
        layout: AppBarLayoutConfig.fixedAbove,
        aligment: AppBarLayoutType.TiMeAc,
        showTabbar: false,
      ),
    );

    return {
      header: DynamicRouteLayout.override(
        splits,
        defaultLayout: RouteLayout(
          appBarLayout: AppBarLayout(
            layout: AppBarLayoutConfig.fixedAbove,
            aligment: AppBarLayoutType.TiMeAc,
            showTabbar: false,
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
      header2: DynamicRouteLayout.override(
        splits,
        defaultLayout: header2_default,
        overrides: {
          splits.first: RouteLayoutOverride(
            appBarLayout: AppBarLayoutOverride(
              aligment: AppBarLayoutType.MeTiAc,
            ),
          ),
          splits[1]: RouteLayoutOverride(
            appBarLayout: AppBarLayoutOverride(
              aligment: AppBarLayoutType.MeTiAc,
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
            showTabbar: true,
          ),
          footerLayout: FooterLayout(),
          siderLayout: SiderLayout(left: false),
        ),
        overrides: {
          splits.first: RouteLayoutOverride(
            bottomBarLayout: BottomBarLayoutOverride(
              selectionType: BottomBarSelectionType.icon,
            ),
          ),
        },
      ),
      sider: DynamicRouteLayout.override(
        splits,
        defaultLayout: RouteLayout(
          appBarLayout: AppBarLayout(
            layout: AppBarLayoutConfig.body,
            aligment: AppBarLayoutType.TiMeAc,
            showTabbar: true,
          ),
          footerLayout: FooterLayout(),
          siderLayout: SiderLayout(
            left: true,
          ),
        ),
        overrides: {
          splits.first: RouteLayoutOverride(
            appBarLayout: AppBarLayoutOverride(
              layout: AppBarLayoutConfig.body,
              aligment: AppBarLayoutType.TiMeAc,
            ),
            bottomBarLayout: BottomBarLayoutOverride(
              selectionType: BottomBarSelectionType.icon,
            ),
          ),
        },
      ),
    };
  }

  @override
  List<RouteInfo> buildRoutes(
    Map<String, DynamicRouteLayout> layouts,
  ) {
    final headerSiderChildren =
        ScaffoldRouteConfig(layout: layouts.get(header));

    return [
      PageInfo(
        name: "/",
        title: "Home",
        icon: Icons.home,
        config: ScaffoldRouteConfig(
          layout: layouts.get(header),
        ),
        page: Home(),
      ),
      PageInfo(
        name: "/about",
        title: "About",
        icon: Icons.info,
        config: ScaffoldRouteConfig(
          layout: layouts.get(header2),
        ),
        page: About(),
      ),
      PageInfo(
        name: "/products",
        title: "Products",
        icon: Icons.shop,
        config: ScaffoldRouteConfig(
          layout: layouts.get(header_tabbar),
          whether: ScaffoldWhether(
            showSiderMenu: true,
          ),
        ),
        page: ProductsPage(),
        children: [
          PageInfo(
            name: "/products/development",
            title: "Development",
            icon: Icons.developer_board_rounded,
            page: About(),
            config: ScaffoldRouteConfig(
              layout: layouts.get(header_tabbar),
              whether: ScaffoldWhether(
                showSiderMenu: true,
              ),
            ),
          ),
          PageInfo(
            name: "/products/templates",
            title: "Templates",
            icon: Icons.settings_input_component_rounded,
            page: About(),
            config: ScaffoldRouteConfig(
              layout: layouts.get(header_tabbar),
              whether: ScaffoldWhether(
                showSiderMenu: true,
              ),
            ),
          ),
          PageInfo(
            name: "/products/counseling",
            title: "Counseling",
            icon: Icons.question_answer_outlined,
            page: About(),
            config: ScaffoldRouteConfig(
              layout: layouts.get(header_tabbar),
              whether: ScaffoldWhether(
                showSiderMenu: true,
              ),
            ),
          ),
        ],
      ),
      PageInfo(
        name: "/theme",
        title: "Theme",
        icon: Icons.color_lens,
        config: ScaffoldRouteConfig(
          layout: layouts.get(header),
        ),
        page: ThemeEditor(),
      ),
      PageInfo(
        name: "/widgets",
        title: "Widgets",
        icon: Icons.wallet,
        config: ScaffoldRouteConfig(
          layout: layouts.get(headerSider),
          whether: ScaffoldWhether(
            showSiderMenu: true,
            showSiderSubMenu: true,
          ),
        ),
        page: WidgetComponents(),
        children: [
          PageInfo(
            title: "Buttons",
            icon: Icons.smart_button_rounded,
            name: "/widgets/buttons",
            config: headerSiderChildren,
            page: ButtonsPage(),
          ),
          PageInfo(
            title: "Icons",
            icon: Icons.text_fields_sharp,
            name: "/widgets/icons",
            config: headerSiderChildren,
            page: IconsPage(),
          ),
          PageInfo(
            title: "Modals",
            icon: Icons.card_membership_rounded,
            name: "/widgets/modals",
            config: headerSiderChildren,
            page: ModalsPage(),
          ),
          PageInfo(
            title: "Selection",
            name: "/widgets/selectbar",
            icon: Icons.select_all,
            config: headerSiderChildren,
            page: SelectButtonBarPage(),
          ),
          PageInfo(
            title: "Carousel",
            icon: Icons.book,
            name: "/widgets/carousel",
            config: headerSiderChildren,
            page: CarouselPage(),
          ),
          PageInfo(
            title: "Textfield",
            icon: Icons.input,
            name: "/widgets/textfield",
            config: headerSiderChildren,
            page: TextfieldPage(),
          ),
          PageInfo(
            title: "Form",
            icon: Icons.document_scanner_outlined,
            name: "/widgets/form",
            config: headerSiderChildren,
            page: FormPage(),
          ),
          PageInfo(
            title: "Table",
            icon: Icons.table_bar_rounded,
            name: "/widgets/table",
            config: headerSiderChildren,
            page: TablePage(),
          ),
          PageInfo(
            title: "Tags",
            icon: Icons.tag,
            name: "/widgets/tags",
            config: headerSiderChildren,
            page: TagsPage(),
          ),
          PageInfo(
            title: "Rating",
            icon: Icons.star,
            name: "/widgets/rating",
            config: headerSiderChildren,
            page: RatingPage(),
          ),
        ],
      ),
      ModalRouteInfo(
        name: "/settings",
        title: "Home",
        page: SettingsPage(),
        // width: 360,
      ),
      ModalRouteInfo(
        name: "/menudrawer",
        title: "Home",
        page: MenuDrawer(),
        //  width: theme.menuDrawerSizing.width,
      ),
    ];
  }

  @override
  ScaffoldConfig buildConfig() {
    return ScaffoldConfig(
      whether: ScaffoldWhether(
        showBackButton: false,
      ),
      builders: ScaffoldBuilders(
        appBarActions: (c, theme) {
          return LegendAnimatedIcon(
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
          );
        },
        customFooter: FixedFooter(
          builder: (context, sizing, colors) => const GlobalFooter(),
        ),
      ),
    );
  }
}
