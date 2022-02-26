import 'package:flutter/material.dart';
import 'package:legend_design_core/layout/drawers/menu_drawer.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixed_appbar_colors.dart';
import 'package:legend_design_core/layout/fixed/appBar.dart/fixed_appbar_sizing.dart';
import 'package:legend_design_core/layout/fixed/bottomBar.dart/fixed_bottom_bar.dart';
import 'package:legend_design_core/layout/fixed/fixed_footer.dart';
import 'package:legend_design_core/layout/fixed/sider/siderTheme.dart';
import 'package:legend_design_core/objects/menu_option.dart';
import 'package:legend_design_core/router/routes/route_info.dart';
import 'package:legend_design_core/styles/theming/colors/legend_color_palette.dart';
import 'package:legend_design_core/styles/theming/colors/legend_colors.dart';
import 'package:legend_design_core/styles/theming/sizing/legend_sizing.dart';
import 'package:legend_design_core/styles/theming/sizing/legend_sizing_theme.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:webstore/pages/about.dart';
import 'package:webstore/pages/drawerPages/settingsPage.dart';
import 'package:webstore/pages/home.dart';
import 'package:webstore/pages/services.dart';
import 'package:webstore/pages/themeEditor/themeEditor.dart';
import 'package:webstore/pages/widgetComponets.dart';
import 'package:webstore/pages/widgets/buttons.dart';
import 'package:webstore/pages/widgets/carousel.dart';
import 'package:webstore/pages/widgets/form.dart';
import 'package:webstore/pages/widgets/modals.dart';
import 'package:webstore/pages/widgets/rating.dart';
import 'package:webstore/pages/widgets/selectButtonBar.dart';
import 'package:webstore/pages/widgets/table.dart';
import 'package:webstore/pages/widgets/tags.dart';
import 'package:webstore/pages/widgets/textfield.dart';

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
      ),
      LegendSizing(
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
      ),
      LegendSizing(
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

  static LegendColorPalette lightColorTheme = LegendColorPalette(
    textContrast: Colors.cyan,
    typographyColors: LegendTypographyColors(
      baseColor: Colors.black,
    ),
    bottomBarColors: BottomBarColors(
      activeColor: Colors.cyanAccent,
      disabledColor: LegendColors.gray4,
      backgroundColor: LegendColors.white100,
    ),
    fixedFooterColors: FixedFooterColors(
      backgroundColor: LegendColors.gray10,
      foreground: LegendColors.gray4,
    ),
    cardBackgroundColor: Colors.white,
    primaryColor: Colors.cyan,
    secondaryColor: Colors.tealAccent[100]!,
    scaffoldBackgroundColor: LegendColors.gray2,
    foreground: [
      LegendColors.black12,
      LegendColors.black20,
      LegendColors.black40,
      LegendColors.gray8,
      LegendColors.gray10,
    ],
    background: [
      LegendColors.black04,
      LegendColors.black12,
      LegendColors.black20,
      LegendColors.gray6,
      LegendColors.gray8,
      LegendColors.gray10,
    ],
    elevations: [
      0,
      0.5,
      1,
      2,
      4,
      8,
    ],
    selectionColor: Colors.cyanAccent,
    textColorDark: Colors.cyan[900]!,
    textColorLight: Colors.tealAccent[100]!,
    appBarColors: FixedAppBarColors(
      backgroundColor: Colors.cyan,
      iconColor: Colors.tealAccent[100]!,
      selectedColor: Colors.cyanAccent,
      foreground: Colors.teal[50]!,
    ),
    siderColorTheme: SiderColorTheme(
      background: Colors.cyan,
      backgroundMenu: Colors.cyan[400]!,
      foreground: Colors.teal[50]!,
    ),
    disabledColor: Colors.black12,
  );
  static LegendColorPalette darkColorTheme = LegendColorPalette(
    textContrast: Color(0xFFb3dedb),
    siderColorTheme: SiderColorTheme(
      background: Colors.teal,
      backgroundMenu: Colors.teal[600]!,
      foreground: Colors.teal[50]!,
    ),
    typographyColors: LegendTypographyColors(
      baseColor: Colors.white,
    ),
    bottomBarColors: BottomBarColors(
      activeColor: Colors.teal,
      disabledColor: Colors.black26,
      backgroundColor: LegendColors.gray10,
    ),
    fixedFooterColors: FixedFooterColors(
      backgroundColor: LegendColors.gray8,
      foreground: LegendColors.gray4,
    ),
    cardBackgroundColor: LegendColors.gray9,
    primaryColor: Colors.teal,
    secondaryColor: Color(0xFFb3dedb),
    scaffoldBackgroundColor: LegendColors.gray11,
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
    selectionColor: Colors.tealAccent,
    textColorDark: LegendColors.gray6,
    textColorLight: LegendColors.gray4,
    appBarColors: FixedAppBarColors(
      backgroundColor: Colors.teal,
      iconColor: Colors.tealAccent,
      selectedColor: Colors.tealAccent,
      foreground: Colors.teal[50]!,
    ),
    disabledColor: Colors.black12,
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
