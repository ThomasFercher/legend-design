import 'package:flutter/material.dart';
import 'package:legend_design/config/layout.dart';
import 'package:legend_design/pages/about.dart';
import 'package:legend_design/pages/getting_started/getting_started.dart';
import 'package:legend_design/pages/services/counseling/counseling.dart';
import 'package:legend_design/pages/services/development/development.dart';
import 'package:legend_design/pages/services/templates/templates.dart';
import 'package:legend_design/pages/settings/settingsPage.dart';
import 'package:legend_design/pages/home/home.dart';
import 'package:legend_design/pages/services/services.dart';
import 'package:legend_design/pages/widgetComponets.dart';
import 'package:legend_design/pages/widgets/buttons.dart';
import 'package:legend_design_core/interfaces/route_delegate.dart';
import 'package:legend_design_core/layout/config/dynamic_route_layout.dart';
import 'package:legend_design_core/layout/menu_drawer/menu_drawer.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/router/scaffold_route_info.dart';

import '../pages/widgets/carousel.dart';
import '../pages/widgets/form.dart';
import '../pages/widgets/icons.dart';
import '../pages/widgets/modals.dart';
import '../pages/widgets/rating.dart';
import '../pages/widgets/selectButtonBar.dart';
import '../pages/widgets/table.dart';
import '../pages/widgets/tags.dart';
import '../pages/widgets/textfield.dart';
import 'package:legend_utils/extensions/maps.dart';

class AppRoutes extends RoutesDelegate {
  @override
  List<RouteInfo> buildRoutes(
    Map<Enum, DynamicRouteLayout> layouts,
  ) {
    final headerSiderChildren = ScaffoldRouteConfig(
      layout: layouts.get(PageLayout.headerSider),
      whether: ScaffoldWhetherOverride(
        showAppBarMenu: false,
        showSiderMenu: true,
        showSiderSubMenu: true,
      ),
    );

    return [
      PageInfo(
        name: "/",
        title: "Home",
        icon: Icons.home,
        config: ScaffoldRouteConfig(
          layout: layouts.get(PageLayout.header),
          whether: ScaffoldWhetherOverride(
            showAppBarMenu: true,
          ),
        ),
        page: Home(),
      ),
      PageInfo(
        name: "/getting-started",
        title: "Getting Started",
        icon: Icons.start,
        config: ScaffoldRouteConfig(
          layout: layouts.get(PageLayout.header),
          whether: ScaffoldWhetherOverride(
            showAppBarMenu: true,
          ),
        ),
        page: GettingStartedPage(),
      ),

      PageInfo(
        name: "/products",
        title: "Products",
        icon: Icons.shop,
        config: ScaffoldRouteConfig(
          layout: layouts.get(PageLayout.header_tabbar),
          whether: ScaffoldWhetherOverride(
            showSiderMenu: true,
          ),
        ),
        page: ProductsPage(),
        children: [
          PageInfo(
            name: "/products/development",
            title: "Development",
            icon: Icons.developer_board_rounded,
            page: DevelopmentPage(),
            config: ScaffoldRouteConfig(
              layout: layouts.get(PageLayout.header_tabbar),
              whether: ScaffoldWhetherOverride(
                showSiderMenu: true,
              ),
            ),
          ),
          PageInfo(
            name: "/products/templates",
            title: "Templates",
            icon: Icons.settings_input_component_rounded,
            page: TemplatesPage(),
            config: ScaffoldRouteConfig(
              layout: layouts.get(PageLayout.header_tabbar),
              whether: ScaffoldWhetherOverride(
                showSiderMenu: true,
              ),
            ),
          ),
          PageInfo(
            name: "/products/counseling",
            title: "Counseling",
            icon: Icons.question_answer_outlined,
            page: CounsellingPage(),
            config: ScaffoldRouteConfig(
              layout: layouts.get(PageLayout.header_tabbar),
              whether: ScaffoldWhetherOverride(
                showSiderMenu: true,
              ),
            ),
          ),
        ],
      ),
      // PageInfo(
      //   name: "/theme",
      //   title: "Theme",
      //   icon: Icons.color_lens,
      //   config: ScaffoldRouteConfig(
      //     layout: layouts.get(headerSider),
      //   ),
      //   page: ThemeEditor(),
      // ),
      // PageInfo(
      //   name: "/widgets",
      //   title: "Widgets",
      //   icon: Icons.wallet,
      //   config: ScaffoldRouteConfig(
      //     layout: layouts.get(PageLayout.headerSider),
      //     whether: ScaffoldWhetherOverride(
      //       showSiderSubMenu: true,
      //       showAppBarMenu: false,
      //       showSiderMenu: true,
      //     ),
      //   ),
      //   page: WidgetComponents(),
      //   children: [
      //     PageInfo(
      //       title: "Buttons",
      //       icon: Icons.smart_button_rounded,
      //       name: "/widgets/buttons",
      //       config: headerSiderChildren,
      //       page: ButtonsPage(),
      //     ),
      //     PageInfo(
      //       title: "Icons",
      //       icon: Icons.text_fields_sharp,
      //       name: "/widgets/icons",
      //       config: headerSiderChildren,
      //       page: IconsPage(),
      //     ),
      //     PageInfo(
      //       title: "Modals",
      //       icon: Icons.card_membership_rounded,
      //       name: "/widgets/modals",
      //       config: headerSiderChildren,
      //       page: ModalsPage(),
      //     ),
      //     PageInfo(
      //       title: "Selection",
      //       name: "/widgets/selectbar",
      //       icon: Icons.select_all,
      //       config: headerSiderChildren,
      //       page: SelectButtonBarPage(),
      //     ),
      //     PageInfo(
      //       title: "Carousel",
      //       icon: Icons.book,
      //       name: "/widgets/carousel",
      //       config: headerSiderChildren,
      //       page: CarouselPage(),
      //     ),
      //     PageInfo(
      //       title: "Textfield",
      //       icon: Icons.input,
      //       name: "/widgets/textfield",
      //       config: headerSiderChildren,
      //       page: TextfieldPage(),
      //     ),
      //     PageInfo(
      //       title: "Form",
      //       icon: Icons.document_scanner_outlined,
      //       name: "/widgets/form",
      //       config: headerSiderChildren,
      //       page: FormPage(),
      //     ),
      //     PageInfo(
      //       title: "Table",
      //       icon: Icons.table_bar_rounded,
      //       name: "/widgets/table",
      //       config: headerSiderChildren,
      //       page: TablePage(),
      //     ),
      //     PageInfo(
      //       title: "Tags",
      //       icon: Icons.tag,
      //       name: "/widgets/tags",
      //       config: headerSiderChildren,
      //       page: TagsPage(),
      //     ),
      //     PageInfo(
      //       title: "Rating",
      //       icon: Icons.star,
      //       name: "/widgets/rating",
      //       config: headerSiderChildren,
      //       page: RatingPage(),
      //     ),
      //   ],
      // ),
      PageInfo(
        name: "/about",
        title: "About",
        icon: Icons.info,
        config: ScaffoldRouteConfig(
          layout: layouts.get(PageLayout.header),
        ),
        page: About(),
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
}
