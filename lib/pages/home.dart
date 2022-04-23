import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_core/icons/legend_animated_icon.dart';
import 'package:legend_design_core/layout/scaffold/legend_scaffold.dart';
import 'package:legend_design_core/router/legend_router.dart';
import 'package:legend_design_core/styles/layouts/layout_type.dart';
import 'package:legend_design_core/styles/legend_theme.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/rich/legend_rich_text.dart';
import 'package:legend_design_core/utils/legend_utils.dart';
import 'package:legend_design_widgets/legend_design_widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    const double verticalSpacing = 24;
    var width = MediaQuery.of(context).size.width;
    LegendTheme theme = context.watch<LegendTheme>();

    return LegendScaffold(
      showAppBarMenu: true,
      appBarForceElevate: true,
      showTopSubMenu: true,
      contentBuilder: (context, size) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendText(
              text: "Legend Design",
              textStyle: theme.typography.h6,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
              ),
            ),
            LegendText(
              text:
                  "Legend Design is developed to be a all around Library for Flutter, which provides UI Components, Layouts, Routing, Dynamic Sizing and Theming for Cross Platform Applications.",
              textStyle: theme.typography.h1,
            ),
            const SizedBox(
              height: verticalSpacing,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: verticalSpacing / 1.5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.stacked_line_chart_sharp,
                        size: 32,
                        color: theme.colors.secondary,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      LegendText(
                        text: "Features",
                        textStyle: theme.typography.h5,
                      ),
                    ],
                  ),
                ),
                LegendListItem(
                  icon: Icon(
                    Icons.settings_input_component,
                    color: Colors.cyan,
                    size: 22,
                  ),
                  text: LegendText(
                    text:
                        "UI Components designed for cross platform Applications.",
                    textStyle: theme.typography.h1,
                  ),
                ),
                LegendListItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.greenAccent,
                    size: 22,
                  ),
                  text: LegendText(
                    text: "Devoloper friendly",
                    textStyle: theme.typography.h1,
                  ),
                ),
                LegendListItem(
                  icon: Icon(
                    Icons.developer_board,
                    color: Colors.purpleAccent,
                    size: 22,
                  ),
                  text: LegendText(
                    text:
                        "Devloped completely standalone, without any third party dependencies.",
                    textStyle: theme.typography.h1,
                  ),
                ),
                LegendListItem(
                  icon: Icon(
                    Icons.color_lens_sharp,
                    color: Colors.blueGrey,
                    size: 22,
                  ),
                  text: LegendText(
                    text: "Powerful Sizing and Theming for every Platform",
                    textStyle: theme.typography.h1,
                  ),
                ),
                LegendListItem(
                  icon: Icon(
                    Icons.nat_outlined,
                    color: Colors.teal,
                    size: 22,
                  ),
                  text: LegendText(
                    text:
                        "Native Functionalites in Kotlyn, Swift, C++ and Javascript.",
                    textStyle: theme.typography.h1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: verticalSpacing,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: verticalSpacing / 1.5),
                  child: LegendText(
                    text: "Packages",
                    textStyle: theme.typography.h5,
                  ),
                ),
                /*   DynamicRow(
                  spacing: 12,
                  verticalSpacing: 12,
                  children: [
                    PackageCard(
                      icon: AntIcons.githubFilled,
                      name: "Legend_Design_Core",
                      version: "0.1.0",
                      width: 380,
                    ),
                    PackageCard(
                      icon: AntIcons.githubFilled,
                      name: "Legend_Design_Widgets",
                      version: "0.1.0",
                      width: 380,
                    ),
                    PackageCard(
                      icon: AntIcons.githubFilled,
                      name: "Legend_Design_Platform",
                      version: "0.0.1",
                      width: 380,
                    ),
                    PackageCard(
                      icon: AntIcons.githubFilled,
                      name: "Legend_Design_Template",
                      version: "1.0.0",
                      width: 380,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                )*/
                LegendWidgetLayout.dyn(
                  children: [
                    PackageCard(
                      icon: AntIcons.githubFilled,
                      name: "Legend_Design_Core",
                      version: "0.1.0",
                      url:
                          "https://github.com/ThomasFercher/Legend-Design-Core",
                    ),
                    PackageCard(
                      icon: AntIcons.githubFilled,
                      name: "Legend_Design_Widgets",
                      version: "0.1.0",
                      url:
                          "https://github.com/ThomasFercher/Legend-Design-Widgets",
                    ),
                    PackageCard(
                      icon: AntIcons.githubFilled,
                      name: "Legend_Design_Platform",
                      version: "0.0.1",
                      url:
                          "https://github.com/ThomasFercher/Legend-Design-Cross",
                    ),
                    PackageCard(
                      icon: AntIcons.githubFilled,
                      name: "Legend_Design_Template",
                      version: "1.0.0",
                      url:
                          "https://github.com/ThomasFercher/Legend-Design-Templae",
                    ),
                  ],
                  layouts: {
                    720: LegendCustomColumn(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(0),
                        LegendCustomWidget(1),
                        LegendCustomWidget(2),
                        LegendCustomWidget(3),
                      ],
                    ),
                    1560: LegendCustomColumn(
                      spacing: 12,
                      children: [
                        LegendCustomRow(
                          spacing: 12,
                          children: [
                            LegendCustomWidget(0, flex: 1),
                            LegendCustomWidget(1, flex: 1),
                          ],
                        ),
                        LegendCustomRow(
                          spacing: 12,
                          children: [
                            LegendCustomWidget(2, flex: 1),
                            LegendCustomWidget(3, flex: 1),
                          ],
                        ),
                      ],
                    ),
                    1920: LegendCustomRow(
                      spacing: 12,
                      children: [
                        LegendCustomWidget(0, flex: 1),
                        LegendCustomWidget(1, flex: 1),
                        LegendCustomWidget(2, flex: 1),
                        LegendCustomWidget(3, flex: 1),
                      ],
                    ),
                  },
                  width: MediaQuery.of(context).size.width,
                )
              ],
            ),
            const SizedBox(
              height: verticalSpacing,
            ),
            LegendText(
              text: "Installation",
              textStyle: theme.typography.h5,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
              ),
            ),
            LegendText(
              text: "With Command",
              textStyle: theme.typography.h1,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
              ),
            ),
            Container(
              height: 48,
              //width: s.width,
              decoration: BoxDecoration(
                color: theme.colors.background[2],
                borderRadius: theme.sizing.borderRadius[1],
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: theme.sizing.borderInset[1],
              ),
              child: LegendRichText(
                text: [
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "flutter",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text: "pub add \$packageName",
                  ),
                ],
              ),
            ),
            LegendText(
              text: "Or you can manually add these to your pubspec.yaml.",
              textStyle: theme.typography.h1,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
                top: verticalSpacing / 1.5,
              ),
            ),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: theme.colors.background[2],
                borderRadius: theme.sizing.borderRadius[1],
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: theme.sizing.borderInset[1],
              ),
              child: LegendRichText(
                text: [
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "dependencies:\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "   legend_design_core:",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text: "^0.1.0\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "   legend_design_widgets:",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text: "^0.1.0\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "   legend_design_platform:",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text: "^0.0.1\n",
                  ),
                  RichTextItem(
                    style: theme.typography.h1
                        .copyWith(color: theme.colors.secondary),
                    text: "   legend_design_template:",
                  ),
                  RichTextItem(
                    style: theme.typography.h1,
                    text: "^1.0.0",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: verticalSpacing,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LegendText(
                  text: "Usage",
                  textStyle: theme.typography.h5,
                  padding: const EdgeInsets.only(
                    bottom: verticalSpacing / 1.5,
                  ),
                ),
                LegendText(
                  text:
                      "In your Flutter project you can use the following imports.",
                  textStyle: theme.typography.h1,
                  padding: const EdgeInsets.only(
                    bottom: verticalSpacing / 1.5,
                  ),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: theme.colors.background[2],
                    borderRadius: theme.sizing.borderRadius[1],
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.sizing.borderInset[1],
                  ),
                  child: LegendRichText(
                    text: [
                      RichTextItem(
                        style: theme.typography.h1
                            .copyWith(color: theme.colors.secondary),
                        text: "import",
                      ),
                      RichTextItem(
                        style: theme.typography.h1,
                        text:
                            "\'package:legend_design_core/legend_design_core.dart\';\n",
                      ),
                      RichTextItem(
                        style: theme.typography.h1
                            .copyWith(color: theme.colors.secondary),
                        text: "import",
                      ),
                      RichTextItem(
                        style: theme.typography.h1,
                        text:
                            "\'package:legend_design_core/legend_design_widgets.dart\';\n",
                      ),
                      RichTextItem(
                        style: theme.typography.h1
                            .copyWith(color: theme.colors.secondary),
                        text: "import",
                      ),
                      RichTextItem(
                        style: theme.typography.h1,
                        text:
                            "\'package:legend_design_core/legend_design_platform.dart\';\n",
                      ),
                      RichTextItem(
                        style: theme.typography.h1
                            .copyWith(color: theme.colors.secondary),
                        text: "import",
                      ),
                      RichTextItem(
                        style: theme.typography.h1,
                        text:
                            "\'package:legend_design_core/legend_design_template.dart\';",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: verticalSpacing,
            ),
            LegendText(
              text: "Get Started",
              textStyle: theme.typography.h5,
              padding: const EdgeInsets.only(
                bottom: verticalSpacing / 1.5,
              ),
            ),
            LegendRichText(
              text: [
                RichTextItem(
                  style: theme.typography.h1,
                  text: "Please head over to our",
                ),
                RichTextItem(
                  style: theme.typography.h1.copyWith(
                    color: theme.colors.secondary,
                  ),
                  hoverColor: theme.colors.selection,
                  text: "Documentation",
                  onTap: () {
                    LegendRouter.of(context).pushPage(
                      settings: const RouteSettings(name: "/widgets"),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: verticalSpacing * 2,
            ),

            /* LegendWidgetLayout.dyn(
              children: [
                Container(
                  height: 400,
                  width: 400,
                  color: theme.colors.background[1],
                ),
              ],
              layouts: {
                400: LegendCustomColumn(
                  children: [
                    LegendCustomWidget(0),
                  ],
                ),
              },
              width: s.width,
            )*/
          ],
        );
      },
      appBarActions: [
        LegendAnimatedIcon(
          icon: Icons.color_lens,
          theme: LegendAnimtedIconTheme(
            enabled: theme.colors.selection,
            disabled: theme.colors.appBarPalette.foreground,
          ),
          iconSize: theme.appBarSizing.iconSize ?? 32,
          disableShadow: true,
          onPressed: () {
            LegendRouter.of(context)
                .pushPage(settings: RouteSettings(name: "/settings"));
          },
        )
      ],
      layoutType: LayoutType.FixedHeader,
      pageName: "Home",
      enableDefaultSettings: false,
    );
  }
}

class LegendHoverHighlight extends StatefulWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  late final Color disabledColor;
  late final Color selectedColor;

  LegendHoverHighlight({
    Key? key,
    required this.child,
    this.borderRadius,
    Color? disabledColor,
    required Color selectedColor,
  }) {
    this.disabledColor = disabledColor ?? Colors.black.withOpacity(0.1);
    this.selectedColor = selectedColor.withOpacity(0.4);
  }

  @override
  State<LegendHoverHighlight> createState() => _LegendHoverHighlightState();
}

class _LegendHoverHighlightState extends State<LegendHoverHighlight>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<Color?> animation;
  late Color color;

  @override
  void initState() {
    color = widget.disabledColor;
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    animation = ColorTween(
      begin: widget.disabledColor,
      end: widget.selectedColor,
    ).animate(animationController)
      ..addListener(() {
        if (animation.value != null)
          setState(() {
            color = animation.value!;
          });
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        animationController.forward();
      },
      onExit: (e) {
        animationController.reverse();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          child: widget.child,
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  final String name;
  final String version;
  final IconData icon;
  final String? url;
  final double? width;

  const PackageCard({
    Key? key,
    required this.name,
    required this.version,
    required this.icon,
    this.width,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();
    return LegendHoverHighlight(
      borderRadius: theme.sizing.borderRadius[1],
      selectedColor: theme.colors.selection,
      child: Container(
        height: 64,
        width: width,
        color: theme.colors.background[2],
        padding: EdgeInsets.symmetric(
          horizontal: theme.sizing.padding[1],
        ),
        child: Row(
          children: [
            Expanded(
              child: LegendText(
                text: name,
                textStyle: theme.typography.h4,
                dynamicSizing: true,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Container(
              width: 48,
              decoration: BoxDecoration(
                color: theme.colors.secondary,
                borderRadius: theme.sizing.borderRadius[1],
              ),
              alignment: Alignment.center,
              child: LegendText(
                text: version,
                textStyle: theme.typography.h0.copyWith(color: Colors.white),
              ),
              height: 20,
            ),
            const SizedBox(
              width: 24,
            ),
            LegendAnimatedIcon(
              icon: icon,
              iconSize: 32,
              theme: LegendAnimtedIconTheme(
                enabled: theme.colors.selection,
                disabled: theme.colors.foreground[3],
              ),
              onPressed: () {
                if (url != null) LegendUtils.launchInBrowser(url!);
              },
            )
          ],
        ),
      ),
    );
  }
}

class LegendListItem extends StatelessWidget {
  final Icon icon;
  final LegendText text;

  const LegendListItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = context.watch<LegendTheme>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(
            Icons.circle_outlined,
            color: theme.colors.foreground[2],
            size: 8,
          ),
          const SizedBox(
            width: 16,
          ),
          icon,
          const SizedBox(
            width: 8,
          ),
          Expanded(child: text)
        ],
      ),
    );
  }
}
