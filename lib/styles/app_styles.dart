import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/drawers/menu_drawer.dart';
import 'package:legend_design_core/layout/fixed/menu/tiles/menu_option.dart';
import 'package:legend_design_core/router/routes/route_info.dart';
import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/styles/sizing/sub_sizing/sider_sizing.dart';

import '../pages/about.dart';
import '../pages/drawerPages/settingsPage.dart';
import '../pages/home.dart';
import '../pages/services.dart';
import '../pages/themeEditor/themeEditor.dart';
import '../pages/widgetComponets.dart';
import '../pages/widgets/buttons.dart';
import '../pages/widgets/carousel.dart';
import '../pages/widgets/form.dart';
import '../pages/widgets/icons.dart';
import '../pages/widgets/modals.dart';
import '../pages/widgets/rating.dart';
import '../pages/widgets/selectButtonBar.dart';
import '../pages/widgets/table.dart';
import '../pages/widgets/tags.dart';
import '../pages/widgets/textfield.dart';

class AppConfig {
  static BottomBarSizing bottomBarSizing = BottomBarSizing(
    showText: true,
    textAtBottom: true,
    iconSize: 28,
    height: 80,
    margin: EdgeInsets.all(0),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 9.0,
          spreadRadius: 3.0,
        ),
      ],
    ),
  );

  static LegendSizingTheme sizingTheme = LegendSizingTheme(
    sizings: {
      420: LegendSizing(
        elevations: [0, 1, 2, 4],
        typographySizing: LegendTypographySizing(baseSize: 14, maxSize: 32),
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
          8,
          12,
          18,
        ],
        siderSizing: SiderSizing(width: 120),
        //   bottomBarSizing: bottomBarSizing,
        appBarSizing: FixedAppBarSizing(
          appBarHeight: 72,
          contentPadding: EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          borderRadius: Radius.circular(20),
          iconSize: 28,
          spacing: 12,
          logoSize: 42,
        ),
        hideSider: true,
      ),
      720: LegendSizing(
        siderSizing: SiderSizing(width: 120),
        elevations: [0, 1, 2, 4],
        typographySizing: LegendTypographySizing(baseSize: 12, maxSize: 36),
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
        appBarSizing: FixedAppBarSizing(
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
      ),
      1080: LegendSizing(
        siderSizing: SiderSizing(width: 200),
        elevations: [0, 1, 2, 4],
        typographySizing: LegendTypographySizing(baseSize: 14, maxSize: 38),
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
        appBarSizing: FixedAppBarSizing(
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
      ),
      1920: LegendSizing(
        siderSizing: SiderSizing(width: 260),
        elevations: [0, 1, 2, 4],
        typographySizing: LegendTypographySizing(baseSize: 14, maxSize: 40),
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
        appBarSizing: FixedAppBarSizing(
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
      ),
    },
  );

  static LegendPalette lightColorTheme = LegendPalette(
    primary: Colors.indigo,
    secondary: Colors.teal,
    tertiary: Colors.teal,
    foreground: [
      LegendColors.gray8,
      LegendColors.gray9,
      LegendColors.gray10,
      LegendColors.gray11,
      LegendColors.gray12,
      LegendColors.gray13,
    ],
    siderPalette: SiderPalette(
      foreground: Colors.indigo[50],
    ),
    appBarPalette: AppBarPalette(
      foreground: Colors.indigo[50],
    ),
    background: [
      LegendColors.gray2,
      LegendColors.gray4,
      LegendColors.gray5,
      LegendColors.gray8,
      LegendColors.gray9,
      LegendColors.gray10,
    ],
    error: Colors.red,
    disabled: LegendColors.gray7,
    shadow: Colors.black.withOpacity(0.5),
    selection: Colors.tealAccent[400]!,
    textOnDark: LegendColors.gray9,
    textOnLight: LegendColors.gray4,
    onPrimary: Colors.indigo[200]!,
    onSecondary: Colors.teal[200]!,
    onTertiary: Colors.teal[200]!,
    footerPalette: FooterPalette(
      background: LegendColors.gray9,
      foreground: LegendColors.gray2,
    ),
    bottomBarPalette: BottomBarPalette(
      backgroundColor: LegendColors.gray2,
      disabledColor: LegendColors.gray6,
      activeColor: Colors.indigoAccent,
    ),
  );
  static LegendPalette darkColorTheme = LegendPalette(
    primary: Colors.indigo,
    secondary: Colors.teal,
    tertiary: Colors.teal,
    foreground: [
      LegendColors.gray3,
      LegendColors.gray4,
      LegendColors.gray5,
      LegendColors.gray8,
      LegendColors.gray9,
      LegendColors.gray10,
    ],
    background: [
      LegendColors.gray9,
      LegendColors.gray8,
      LegendColors.gray7,
      LegendColors.gray6,
      LegendColors.gray5,
      LegendColors.gray4,
    ],
    siderPalette: SiderPalette(
      foreground: Colors.indigo[50],
    ),
    appBarPalette: AppBarPalette(
      foreground: Colors.indigo[50],
    ),
    error: Colors.red,
    disabled: LegendColors.gray7,
    shadow: Colors.black.withOpacity(0.5),
    selection: Colors.tealAccent[400]!,
    textOnDark: LegendColors.gray3,
    textOnLight: LegendColors.gray4,
    onPrimary: Colors.indigo[200]!,
    onSecondary: Colors.teal[200]!,
    onTertiary: Colors.teal[200]!,
    footerPalette: FooterPalette(
      background: LegendColors.gray8,
      foreground: LegendColors.gray2,
    ),
  );

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

  static List<RouteInfo> routes = [
    PageRouteInfo(
      name: "/",
      page: Home(),
    ),
    PageRouteInfo(
      name: "/about",
      page: About(),
    ),
    PageRouteInfo(
      name: "/products",
      page: ProductsPage(),
    ),
    PageRouteInfo(
      name: "/theme",
      page: ThemeEditor(),
    ),
    ModalRouteInfo(
      name: "/siderMenu",
      body: MenuDrawer(),
    ),
    ModalRouteInfo(
      name: "/settings",
      body: SettingsPage(),
    ),
    PageRouteInfo(
      name: "/widgets",
      page: WidgetComponents(),
      children: List.of(
        [
          PageRouteInfo(
            name: "/widgets/buttons",
            page: ButtonsPage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/icons",
            page: IconsPage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/modals",
            page: ModalsPage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/selectbar",
            page: SelectButtonBarPage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/carousel",
            page: CarouselPage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/textfield",
            page: TextfieldPage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/form",
            page: FormPage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/table",
            page: TablePage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/tags",
            page: TagsPage(),
            isUnderlying: true,
          ),
          PageRouteInfo(
            name: "/widgets/rating",
            page: RatingPage(),
            isUnderlying: true,
          ),
        ],
        growable: true,
      ),
    ),
  ];
}
