import 'package:flutter/material.dart';
import 'package:legend_design/pages/widgetComponets.dart';
import 'package:legend_design/pages/widgets/buttons.dart';
import 'package:legend_design/pages/widgets/carousel.dart';
import 'package:legend_design/pages/widgets/form.dart';
import 'package:legend_design/pages/widgets/icons.dart';
import 'package:legend_design/pages/widgets/modals.dart';
import 'package:legend_design/pages/widgets/rating.dart';
import 'package:legend_design/pages/widgets/selectButtonBar.dart';
import 'package:legend_design/pages/widgets/table.dart';
import 'package:legend_design/pages/widgets/tags.dart';
import 'package:legend_design_core/layout/drawers/menu_drawer.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/router/legend_router.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

import '../pages/about.dart';
import '../pages/drawerPages/settingsPage.dart';
import '../pages/home.dart';
import '../pages/services.dart';
import '../pages/themeEditor/themeEditor.dart';
import '../pages/widgets/textfield.dart';

class RoutesTheme {
  static List<MenuOption> menuOptions = [
    MenuOption(
      title: "Home",
      page: "/",
      icon: Icons.home,
    ),
    MenuOption(
      title: "Products",
      page: "/products",
      icon: Icons.accessibility,
    ),
    MenuOption(
      title: "Theming",
      page: "/theme",
      icon: Icons.color_lens,
    ),
    MenuOption(
      title: "Widgets",
      page: "/widgets",
      icon: Icons.widgets,
      showSubMenu: true,
      children: [
        MenuOption(
          title: "Buttons",
          page: "/widgets/buttons",
          icon: Icons.radio_button_off,
          isUnderlying: true,
        ),
        MenuOption(
          title: "Icons",
          page: "/widgets/icons",
          icon: Icons.collections,
          isUnderlying: true,
        ),
        MenuOption(
          title: "Modals",
          page: "/widgets/modals",
          icon: Icons.sensor_window,
          isUnderlying: true,
        ),
        MenuOption(
          title: "Layout",
          page: "/widgets/buttons",
          icon: Icons.grid_4x4_outlined,
          isUnderlying: true,
        ),
        MenuOption(
          title: "Typography",
          page: "/widgets/buttons",
          icon: Icons.text_format,
          isUnderlying: true,
        ),
        MenuOption(
          page: "/widgets/selectbar",
          title: "SelectBar",
          isUnderlying: true,
          icon: Icons.select_all,
        ),
        MenuOption(
          page: "/widgets/carousel",
          title: "Carousel",
          isUnderlying: true,
          icon: Icons.view_carousel,
        ),
        MenuOption(
          page: "/widgets/textfield",
          title: "Textfield",
          isUnderlying: true,
          icon: Icons.text_fields,
        ),
        MenuOption(
          page: "/widgets/form",
          title: "Form",
          isUnderlying: true,
          icon: Icons.input,
        ),
        MenuOption(
          page: "/widgets/table",
          title: "Table",
          isUnderlying: true,
          icon: Icons.table_chart,
        ),
        MenuOption(
          page: "/widgets/tags",
          title: "Tags",
          isUnderlying: true,
          icon: Icons.tag,
        ),
        MenuOption(
          page: "/widgets/rating",
          isUnderlying: true,
          title: "Rating",
          icon: Icons.star,
        ),
      ],
    ),
    MenuOption(
      title: "About",
      page: "/about",
      icon: Icons.info_outline_rounded,
    ),
  ];

  static List<RouteInfo> buildRoutes(LegendTheme theme) {
    return [
      PageRouteInfo(
        name: "/",
        info: ScaffoldRouteInfo(
          layoutType: LayoutType.FixedHeader,
          pageName: "pageName",
        ),
        child: Home(),
      ),
      PageRouteInfo(
        name: "/about",
        info: ScaffoldRouteInfo(
          layoutType: LayoutType.FixedHeader,
          pageName: "pageName",
        ),
        child: About(),
      ),
      PageRouteInfo(
        name: "/products",
        info: ScaffoldRouteInfo(
          layoutType: LayoutType.FixedSider,
          whether: ScaffoldWhether(
            showSiderMenu: true,
          ),
          pageName: "pageName",
        ),
        child: ProductsPage(),
      ),
      PageRouteInfo(
        name: "/theme",
        info: ScaffoldRouteInfo(
          layoutType: LayoutType.FixedHeader,
          pageName: "pageName",
        ),
        child: ThemeEditor(),
      ),
      ModalRouteInfo(
        name: "/settings",
        child: SettingsPage(),
        width: 300,
      ),
      ModalRouteInfo(
        name: "/menudrawer",
        child: MenuDrawer(),
        width: theme.menuDrawerSizing.width,
      ),
      PageRouteInfo(
        name: "/widgets",
        info: ScaffoldRouteInfo(
          layoutType: LayoutType.FixedHeaderSider,
          pageName: "pageName",
          whether: ScaffoldWhether(
            showSiderMenu: true,
            showSiderSubMenu: true,
          ),
        ),
        child: WidgetComponents(),
        children: List.of(
          [
            PageRouteInfo(
              name: "/widgets/buttons",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              isUnderlying: true,
              child: ButtonsPage(),
            ),
            PageRouteInfo(
              name: "/widgets/icons",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              isUnderlying: true,
              child: IconsPage(),
            ),
            PageRouteInfo(
              name: "/widgets/modals",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              isUnderlying: true,
              child: ModalsPage(),
            ),
            PageRouteInfo(
              name: "/widgets/selectbar",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              child: SelectButtonBarPage(),
              isUnderlying: true,
            ),
            PageRouteInfo(
              name: "/widgets/carousel",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              child: CarouselPage(),
              isUnderlying: true,
            ),
            PageRouteInfo(
              name: "/widgets/textfield",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              child: TextfieldPage(),
              isUnderlying: true,
            ),
            PageRouteInfo(
              name: "/widgets/form",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              child: FormPage(),
              isUnderlying: true,
            ),
            PageRouteInfo(
              name: "/widgets/table",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              child: TablePage(),
              isUnderlying: true,
            ),
            PageRouteInfo(
              name: "/widgets/tags",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              child: TagsPage(),
              isUnderlying: true,
            ),
            PageRouteInfo(
              name: "/widgets/rating",
              info: ScaffoldRouteInfo(
                layoutType: LayoutType.FixedHeader,
                pageName: "pageName",
              ),
              child: RatingPage(),
              isUnderlying: true,
            ),
          ],
          growable: true,
        ),
      ),
    ];
  }
}
