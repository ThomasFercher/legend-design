import 'package:flutter/material.dart';
import 'package:legend_design/pages/about.dart';
import 'package:legend_design/pages/drawerPages/settingsPage.dart';
import 'package:legend_design/pages/home.dart';
import 'package:legend_design/pages/services.dart';
import 'package:legend_design/pages/themeEditor/themeEditor.dart';
import 'package:legend_design/pages/widgetComponets.dart';
import 'package:legend_design/pages/widgets/buttons.dart';
import 'package:legend_design_core/interfaces/route_inferface.dart';
import 'package:legend_design_core/layout/config/layout_config.dart';
import 'package:legend_design_core/layout/drawers/menu_drawer.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/router/scaffold_route_info.dart';
import 'package:legend_router/router/legend_router.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_router/router/routes/route_display.dart';

import '../pages/widgets/carousel.dart';
import '../pages/widgets/form.dart';
import '../pages/widgets/icons.dart';
import '../pages/widgets/modals.dart';
import '../pages/widgets/rating.dart';
import '../pages/widgets/selectButtonBar.dart';
import '../pages/widgets/table.dart';
import '../pages/widgets/tags.dart';
import '../pages/widgets/textfield.dart';

enum PageLayout {
  Header,
  HeaderSider,
  Sider,
}

class RoutesTheme extends RouteInterface<PageLayout> {
  const RoutesTheme() : super();

  @override
  Map<PageLayout, DynamicRouteLayout> buildLayouts(LegendTheme theme) {
    List<double> splits = theme.splits;
    return {
      PageLayout.Header: DynamicRouteLayout.firstExpand(
        splits,
        [
          RouteLayout(
            appBarLayout: AppbarLayout.FixedAbove,
            bottomBarLayout: BottomBarLayout.Show,
            footerLayout: FooterLayout.None,
            siderLayout: SiderLayout.None,
          ),
          RouteLayout(
            appBarLayout: AppbarLayout.FixedAbove,
            bottomBarLayout: BottomBarLayout.None,
            footerLayout: FooterLayout.Show,
            siderLayout: SiderLayout.None,
          ),
        ],
      ),
      PageLayout.HeaderSider: DynamicRouteLayout.firstExpand(
        splits,
        [
          RouteLayout(
            appBarLayout: AppbarLayout.FixedAbove,
            bottomBarLayout: BottomBarLayout.Show,
            footerLayout: FooterLayout.None,
            siderLayout: SiderLayout.None,
          ),
          RouteLayout(
            appBarLayout: AppbarLayout.FixedAbove,
            bottomBarLayout: BottomBarLayout.None,
            footerLayout: FooterLayout.Show,
            siderLayout: SiderLayout.Left,
          ),
        ],
      ),
      PageLayout.Sider: DynamicRouteLayout.firstExpand(
        splits,
        [
          RouteLayout(
            appBarLayout: AppbarLayout.FixedAbove,
            bottomBarLayout: BottomBarLayout.Show,
            footerLayout: FooterLayout.None,
            siderLayout: SiderLayout.None,
          ),
          RouteLayout(
            appBarLayout: AppbarLayout.None,
            bottomBarLayout: BottomBarLayout.None,
            footerLayout: FooterLayout.Show,
            siderLayout: SiderLayout.Left,
          ),
        ],
      ),
    };
  }

  @override
  List<RouteInfo> buildRoutes(
      Map<PageLayout, DynamicRouteLayout> layouts, LegendTheme theme) {
    return [
      ScaffoldRouteInfo(
        name: "/",
        config: ScaffoldRouteConfig(
          pageName: "pageName",
          layout: layouts[PageLayout.Header]!,
        ),
        page: Home(),
      ),
      ScaffoldRouteInfo(
        name: "/about",
        config: ScaffoldRouteConfig(
          pageName: "pageName",
          layout: layouts[PageLayout.Header]!,
        ),
        page: About(),
      ),
      ScaffoldRouteInfo(
        name: "/products",
        config: ScaffoldRouteConfig(
          layout: layouts[PageLayout.Sider]!,
          whether: ScaffoldWhether(
            showSiderMenu: true,
          ),
          pageName: "pageName",
        ),
        page: ProductsPage(),
      ),
      ScaffoldRouteInfo(
        name: "/theme",
        config: ScaffoldRouteConfig(
          layout: layouts[PageLayout.Header]!,
          pageName: "pageName",
        ),
        page: ThemeEditor(),
      ),
      ModalRouteInfo(
        name: "/settings",
        page: SettingsPage(),
        width: 300,
      ),
      ModalRouteInfo(
        name: "/menudrawer",
        page: MenuDrawer(),
        width: theme.menuDrawerSizing.width,
      ),
      ScaffoldRouteInfo(
        name: "/widgets",
        config: ScaffoldRouteConfig(
          layout: layouts[PageLayout.HeaderSider]!,
          pageName: "pageName",
          whether: ScaffoldWhether(
            showSiderMenu: true,
            showSiderSubMenu: true,
          ),
        ),
        page: WidgetComponents(),
        children: List.of(
          [
            ScaffoldRouteInfo(
              name: "/widgets/buttons",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: ButtonsPage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/icons",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: IconsPage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/modals",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: ModalsPage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/selectbar",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: SelectButtonBarPage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/carousel",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: CarouselPage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/textfield",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: TextfieldPage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/form",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: FormPage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/table",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: TablePage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/tags",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: TagsPage(),
            ),
            ScaffoldRouteInfo(
              name: "/widgets/rating",
              config: ScaffoldRouteConfig(
                layout: layouts[PageLayout.Header]!,
                pageName: "pageName",
              ),
              page: RatingPage(),
            ),
          ],
          growable: true,
        ),
      ),
    ];
  }

  @override
  List<SimpleRouteDisplay> buildDisplays() {
    return [
      SimpleRouteDisplay(
        title: "Home",
        route: "/",
        icon: Icons.home,
      ),
      SimpleRouteDisplay(
        title: "Products",
        route: "/products",
        icon: Icons.accessibility,
      ),
      SimpleRouteDisplay(
        title: "Theming",
        route: "/theme",
        icon: Icons.color_lens,
      ),
      SimpleRouteDisplay(
        title: "Widgets",
        route: "/widgets",
        icon: Icons.widgets,
        children: [
          SimpleRouteDisplay(
            title: "Buttons",
            route: "/widgets/buttons",
            icon: Icons.radio_button_off,
          ),
          SimpleRouteDisplay(
            title: "Icons",
            route: "/widgets/icons",
            icon: Icons.collections,
          ),
          SimpleRouteDisplay(
            title: "Modals",
            route: "/widgets/modals",
            icon: Icons.sensor_window,
          ),
          SimpleRouteDisplay(
            title: "Layout",
            route: "/widgets/buttons",
            icon: Icons.grid_4x4_outlined,
          ),
          SimpleRouteDisplay(
            title: "Typography",
            route: "/widgets/buttons",
            icon: Icons.text_format,
          ),
          SimpleRouteDisplay(
            route: "/widgets/selectbar",
            title: "SelectBar",
            icon: Icons.select_all,
          ),
          SimpleRouteDisplay(
            route: "/widgets/carousel",
            title: "Carousel",
            icon: Icons.view_carousel,
          ),
          SimpleRouteDisplay(
            route: "/widgets/textfield",
            title: "Textfield",
            icon: Icons.text_fields,
          ),
          SimpleRouteDisplay(
            route: "/widgets/form",
            title: "Form",
            icon: Icons.input,
          ),
          SimpleRouteDisplay(
            route: "/widgets/table",
            title: "Table",
            icon: Icons.table_chart,
          ),
          SimpleRouteDisplay(
            route: "/widgets/tags",
            title: "Tags",
            icon: Icons.tag,
          ),
          SimpleRouteDisplay(
            route: "/widgets/rating",
            title: "Rating",
            icon: Icons.star,
          ),
        ],
      ),
      SimpleRouteDisplay(
        title: "About",
        route: "/about",
        icon: Icons.confirmation_num,
      ),
    ];
  }
}
