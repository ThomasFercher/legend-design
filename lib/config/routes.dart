import 'package:flutter/material.dart';
import 'package:legend_design/config/dynamic_route.dart';
import 'package:legend_design/pages/about.dart';
import 'package:legend_design/pages/documentation/docs.dart';
import 'package:legend_design/pages/documentation/models/article.dart';
import 'package:legend_design/pages/drawerPages/settingsPage.dart';
import 'package:legend_design/pages/home.dart';
import 'package:legend_design/pages/services.dart';
import 'package:legend_design/pages/themeEditor/themeEditor.dart';
import 'package:legend_design/pages/widgetComponets.dart';
import 'package:legend_design/pages/widgets/buttons.dart';
import 'package:legend_design_core/interfaces/route_inferface.dart';
import 'package:legend_design_core/layout/appBar.dart/layout/appbar_layout.dart';
import 'package:legend_design_core/layout/config/appbar_layout.dart';
import 'package:legend_design_core/layout/config/layout_config.dart';
import 'package:legend_design_core/layout/drawers/menu_drawer.dart';
import 'package:legend_design_core/layout/footer/fixed_footer.dart';
import 'package:legend_design_core/layout/navigation/tabbar/legend_tabbar.dart';
import 'package:legend_design_core/layout/scaffold/config/scaffold_config.dart';
import 'package:legend_design_core/legend_design_core.dart';
import 'package:legend_design_core/router/scaffold_route_info.dart';
import 'package:legend_design_core/widgets/icons/legend_animated_icon.dart';
import 'package:legend_router/router/legend_router.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

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
            appBarLayout: AppBarLayout(
              AppBarLayoutConfig.fixedAbove,
              AppBarLayoutType.TiMeAc,
            ),
            bottomBarLayout: BottomBarLayout.Show,
            footerLayout: FooterLayout.None,
            siderLayout: SiderLayout.None,
          ),
          RouteLayout(
            appBarLayout: AppBarLayout(
              AppBarLayoutConfig.fixedAbove,
              AppBarLayoutType.TiMeAc,
            ),
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
            appBarLayout: AppBarLayout(
              AppBarLayoutConfig.fixedAbove,
              AppBarLayoutType.TiMeAc,
            ),
            bottomBarLayout: BottomBarLayout.Show,
            footerLayout: FooterLayout.None,
            siderLayout: SiderLayout.None,
          ),
          RouteLayout(
            appBarLayout: AppBarLayout(
              AppBarLayoutConfig.fixedAbove,
              AppBarLayoutType.TiMeAc,
            ),
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
            appBarLayout: AppBarLayout(
              AppBarLayoutConfig.body,
              AppBarLayoutType.TiMeAc,
            ),
            bottomBarLayout: BottomBarLayout.Show,
            footerLayout: FooterLayout.None,
            siderLayout: SiderLayout.None,
          ),
          RouteLayout(
            appBarLayout: AppBarLayout(
              AppBarLayoutConfig.body,
              AppBarLayoutType.TiMeAc,
            ),
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
    Map<PageLayout, DynamicRouteLayout> layouts,
    LegendTheme theme,
  ) {
    // TODO: We neeed to access Firebase here. Make this Function async
    /*  List<PageInfo> docs_gen_pages = DynamicRoute.generateDynamicRoutes<Article>(
      config: ScaffoldRouteConfig(
        pageName: "pageName",
        layout: layouts[PageLayout.Header]!,
      ),
      base: (config) => Text(config.toString()),
      models: [
        PageModel("/about/1", 1),
        PageModel("/about/2", 2),
        PageModel("/about/3", 3),
      ],
    );*/

    return [
      PageInfo(
        name: "/",
        title: "Home",
        icon: Icons.home,
        config: ScaffoldRouteConfig(
          pageName: "pageName",
          layout: layouts[PageLayout.Header]!,
        ),
        page: Home(),
      ),
      /* PageInfo(
        name: "/documentation",
        title: "Home",
        config: ScaffoldRouteConfig(
          pageName: "pageName",
          layout: layouts[PageLayout.Header]!,
        ),
        page: DocsPage(),
        // children: docs_gen_pages,
      ),*/
      PageInfo(
        name: "/about",
        title: "About",
        icon: Icons.info,
        config: ScaffoldRouteConfig(
          pageName: "pageName",
          layout: layouts[PageLayout.Header]!,
        ),
        page: About(),
      ),
      TabviewPageInfo(
        name: "/products",
        title: "Products",
        icon: Icons.shop,
        style: TabBarStyle(
          alignment: MainAxisAlignment.center,
          background: theme.colors.background1,
          height: 56,
        ),
        config: ScaffoldRouteConfig(
          layout: layouts[PageLayout.Header]!,
          whether: ScaffoldWhether(
            showSiderMenu: true,
          ),
          pageName: "pageName",
        ),
        page: ProductsPage(),
        children: [
          TabviewChildPageInfo(
            name: "/products/development",
            title: "Development",
            icon: Icons.developer_board_rounded,
            page: CarouselPage(),
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              whether: ScaffoldWhether(
                showSiderMenu: true,
              ),
              pageName: "pageName",
            ),
          ),
          TabviewChildPageInfo(
            name: "/products/templates",
            title: "Templates",
            icon: Icons.settings_input_component_rounded,
            page: About(),
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              whether: ScaffoldWhether(
                showSiderMenu: true,
              ),
              pageName: "pageName",
            ),
          ),
          TabviewChildPageInfo(
            name: "/products/counseling",
            title: "Counseling",
            icon: Icons.question_answer_outlined,
            page: About(),
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              whether: ScaffoldWhether(
                showSiderMenu: true,
              ),
              pageName: "pageName",
            ),
          ),
        ],
      ),
      PageInfo(
        name: "/theme",
        title: "Theme",
        icon: Icons.color_lens,
        config: ScaffoldRouteConfig(
          layout: layouts[PageLayout.Header]!,
          pageName: "pageName",
        ),
        page: ThemeEditor(),
      ),
      ModalRouteInfo(
        name: "/settings",
        title: "Home",
        page: SettingsPage(),
        width: 360,
      ),
      ModalRouteInfo(
        name: "/menudrawer",
        title: "Home",
        page: MenuDrawer(),
        width: theme.menuDrawerSizing.width,
      ),
      PageInfo(
        name: "/widgets",
        title: "Widgets",
        icon: Icons.wallet,
        config: ScaffoldRouteConfig(
          layout: layouts[PageLayout.HeaderSider]!,
          pageName: "pageName",
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
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: ButtonsPage(),
          ),
          PageInfo(
            title: "Icons",
            icon: Icons.text_fields_sharp,
            name: "/widgets/icons",
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: IconsPage(),
          ),
          PageInfo(
            title: "Modals",
            icon: Icons.card_membership_rounded,
            name: "/widgets/modals",
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: ModalsPage(),
          ),
          PageInfo(
            title: "Selection",
            name: "/widgets/selectbar",
            icon: Icons.select_all,
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: SelectButtonBarPage(),
          ),
          PageInfo(
            title: "Carousel",
            icon: Icons.book,
            name: "/widgets/carousel",
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: CarouselPage(),
          ),
          PageInfo(
            title: "Textfield",
            icon: Icons.input,
            name: "/widgets/textfield",
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: TextfieldPage(),
          ),
          PageInfo(
            title: "Form",
            icon: Icons.document_scanner_outlined,
            name: "/widgets/form",
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: FormPage(),
          ),
          PageInfo(
            title: "Table",
            icon: Icons.table_bar_rounded,
            name: "/widgets/table",
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: TablePage(),
          ),
          PageInfo(
            title: "Tags",
            icon: Icons.tag,
            name: "/widgets/tags",
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: TagsPage(),
          ),
          PageInfo(
            title: "Rating",
            icon: Icons.star,
            name: "/widgets/rating",
            config: ScaffoldRouteConfig(
              layout: layouts[PageLayout.Header]!,
              pageName: "pageName",
            ),
            page: RatingPage(),
          ),
        ],
      ),
    ];
  }

  @override
  ScaffoldConfig buildConfig() {
    return ScaffoldConfig(
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
              print("object");
              ModalRouter.of(c).push(
                settings: RouteSettings(name: "/settings"),
                useKey: true,
              );
            },
          );
        },
        customFooter: FixedFooter(
          builder: ((context, sizing, colors) => const GlobalFooter()),
        ),
      ),
    );
  }
}
