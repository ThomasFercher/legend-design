import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/drawers/menu_drawer.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/routes/route_info.dart';
import 'package:legend_design_core/styles/colors/legend_colors.dart';
import 'package:legend_design_core/styles/legend_theme.dart';

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
    iconSize: 30,
    height: 72,
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
    splits: [
      420,
      720,
      1080,
      1920,
    ],
    sizings: [
      LegendSizing(
        elevations: [0, 1, 2, 4],
        typographySizing: LegendTypographySizing(baseSize: 14, maxSize: 22),
        borderRadius: [
          BorderRadius.all(
            Radius.circular(12),
          ),
          BorderRadius.all(
            Radius.circular(6),
          ),
        ],
        borderInset: [
          12,
          6,
        ],
        padding: [
          8,
          18,
          24,
        ],
        bottomBarSizing: bottomBarSizing,
        appBarSizing: FixedAppBarSizing(
          appBarHeight: 72,
          contentPadding: EdgeInsets.only(
            right: 8,
            left: 8,
          ),
          borderRadius: Radius.circular(20),
          iconSize: 28,
          spacing: 8,
          titleSize: 42,
        ),
        hideSider: true,
      ),
      LegendSizing(
        elevations: [0, 1, 2, 4],
        typographySizing: LegendTypographySizing(baseSize: 12, maxSize: 30),
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
          titleSize: 48,
        ),
        collapsedSider: true,
      ),
      LegendSizing(
        elevations: [0, 1, 2, 4],
        typographySizing: LegendTypographySizing(baseSize: 12, maxSize: 32),
        borderRadius: [
          BorderRadius.all(
            Radius.circular(12),
          ),
          BorderRadius.all(
            Radius.circular(6),
          ),
        ],
        borderInset: [
          12,
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
          borderRadius: Radius.circular(20),
          iconSize: 24,
          spacing: 16,
          titleSize: 56,
        ),
      ),
      LegendSizing(
        elevations: [0, 1, 2, 4],
        typographySizing: LegendTypographySizing(baseSize: 14, maxSize: 36),
        borderRadius: [
          BorderRadius.all(
            Radius.circular(12),
          ),
          BorderRadius.all(
            Radius.circular(6),
          ),
        ],
        borderInset: [
          12,
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
          borderRadius: Radius.circular(20),
          iconSize: 28,
          spacing: 16,
          titleSize: 64,
        ),
      ),
    ],
  );

  static LegendPalette lightColorTheme = LegendPalette(
    primary: Colors.indigo,
    secondary: Colors.teal,
    tertiary: Colors.teal,
    foreground: [
      LegendColors.gray10,
      LegendColors.gray8,
      LegendColors.gray6,
      LegendColors.gray4,
    ],
    background: [
      LegendColors.gray10,
      LegendColors.gray9,
      LegendColors.gray8,
      LegendColors.gray7,
      LegendColors.gray6,
      LegendColors.gray5,
    ],
    error: Colors.red,
    disabled: LegendColors.gray7,
    shadow: Colors.black.withOpacity(0.5),
    selection: Colors.tealAccent[400]!,
    textOnDark: LegendColors.gray6,
    textOnLight: LegendColors.gray4,
    onPrimary: Colors.indigo[200]!,
    onSecondary: Colors.teal[200]!,
    onTertiary: Colors.teal[200]!,
  );
  static LegendPalette darkColorTheme = LegendPalette(
    primary: Colors.indigo,
    secondary: Colors.teal,
    tertiary: Colors.teal,
    foreground: [
      LegendColors.gray10,
      LegendColors.gray8,
      LegendColors.gray6,
      LegendColors.gray4,
    ],
    background: [
      LegendColors.gray10,
      LegendColors.gray9,
      LegendColors.gray8,
      LegendColors.gray7,
      LegendColors.gray6,
      LegendColors.gray5,
    ],
    error: Colors.red,
    disabled: LegendColors.gray7,
    shadow: Colors.black.withOpacity(0.5),
    selection: Colors.tealAccent[400]!,
    textOnDark: LegendColors.gray6,
    textOnLight: LegendColors.gray4,
    onPrimary: Colors.indigo[200]!,
    onSecondary: Colors.teal[200]!,
    onTertiary: Colors.teal[200]!,
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
