import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/datadisplay/carousel/legendCarousel.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendRowValue.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTable.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTableCell.dart';
import 'package:webstore/customwidgets/datadisplay/tag/legendTag.dart';
import 'package:webstore/customwidgets/input/form/legendForm.dart';
import 'package:webstore/customwidgets/input/form/legendFormField.dart';
import 'package:webstore/customwidgets/input/selectBar/legendSelectBar.dart';
import 'package:webstore/customwidgets/input/selectBar/legendSelectOption.dart';
import 'package:webstore/customwidgets/input/selectBar/legendselectButton.dart';
import 'package:webstore/customwidgets/input/text/legendInputDecoration.dart';
import 'package:webstore/customwidgets/input/text/legendTextField.dart';
import 'package:webstore/customwidgets/layout/grid/legendGridSize.dart';
import 'package:webstore/customwidgets/layout/grid/legendGrid.dart';
import 'package:webstore/customwidgets/layout/sectionNavigation/sectionNavigation.dart';
import 'package:webstore/customwidgets/layout/sections/section.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/legendButton/legendButtonStyle.dart';
import 'package:webstore/customwidgets/modals/legendAlert.dart';
import 'package:webstore/customwidgets/modals/legendBottomSheet.dart';
import 'package:webstore/customwidgets/modals/legendPopups.dart';
import 'package:webstore/customwidgets/modals/modal.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/router/routes/sectionRouteInfo.dart';
import 'package:webstore/styles/theming/legendTheme.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import '../customwidgets/layout/legendScaffold.dart';
import '../styles/layoutType.dart';

class WidgetComponents extends StatelessWidget {
  const WidgetComponents();

  @override
  Widget build(BuildContext context) {
    LegendTheme theme = Provider.of<LegendTheme>(context);
    return LegendScaffold(
      showSiderMenu: false,
      showAppBarMenu: true,
      appBarBuilder: (context) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: LegendSelectBar(
            margin: EdgeInsets.all(2),
            width: 100,
            height: 48,
            isCard: true,
            color: theme.colors.foreground[1],
            options: [
              LegendSelectOption(
                color: Colors.grey,
                icon: Icons.dark_mode,
                name: "dark",
              ),
              LegendSelectOption(
                color: Colors.purple[200],
                icon: Icons.light_mode,
                name: "light",
              ),
            ],
            aligment: MainAxisAlignment.spaceBetween,
            onSelected: (option) {
              switch (option.name) {
                case "dark":
                  Provider.of<LegendTheme>(context, listen: false)
                      .changeColorTheme(LegendColorThemeType.DARK, context);
                  break;
                case "light":
                  Provider.of<LegendTheme>(context, listen: false)
                      .changeColorTheme(LegendColorThemeType.LIGHT, context);
                  break;
                default:
                  break;
              }
            },
            iconSize: 26,
          ),
        );
      },
      children: [
        Section(
          name: "/buttons",
          verticalSpacing: 8,
          header: "Buttons",
          children: [
            LegendText(
                text:
                    "Buttons sind sehr cool!. Im Legend Design Pack gibt es mehere Arten von Buttons. "),
            LegendGrid(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              sizes: LegendGridSize(
                small: LegendGridSizeInfo(1, 64),
                medium: LegendGridSizeInfo(3, 64),
                large: LegendGridSizeInfo(4, 64),
                xxl: LegendGridSizeInfo(4, 64),
              ),
              children: [
                LegendButton(
                  margin: EdgeInsets.all(16),
                  text: LegendText(
                    text: "Alert",
                  ),
                  onPressed: () => {},
                  style: LegendButtonStyle.danger(),
                ),
                LegendButton(
                  margin: EdgeInsets.all(16),
                  text: LegendText(
                    text: "Sucess",
                  ),
                  onPressed: () => {},
                  style: LegendButtonStyle.confirm(),
                ),
                LegendButton(
                  margin: EdgeInsets.all(16),
                  text: LegendText(
                    text: "Info",
                  ),
                  onPressed: () => {},
                  style: LegendButtonStyle.normal(
                      // height: 48,
                      ),
                ),
                LegendButton(
                  margin: EdgeInsets.all(16),
                  text: LegendText(text: "Gradient"),
                  onPressed: () => {},
                  style: LegendButtonStyle.gradient(
                    [
                      Colors.red[200]!,
                      Colors.redAccent,
                    ],
                    height: 48,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.colors.foreground[1],
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 180,
                child: SyntaxView(
                  code:
                      "LegendButton(\n margin: EdgeInsets.all(16),\n text: LegendText(text: \"Gradient\"),\n onPressed: () => {},\n style: LegendButtonStyle.gradient(\n  [\n   Colors.red[200]!,\n   Colors.redAccent \n  ] \n);  ",
                  syntax: Syntax.DART,
                  syntaxTheme: SyntaxTheme(
                    backgroundColor: Colors.transparent,
                    baseStyle: LegendTextStyle.h5().copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  fontSize: 12.0,
                  withZoom: false,
                  withLinesCount: false,
                  expanded: true,
                ),
              ),
            ),
          ],
        ),
        Section(
          header: "Modals",
          name: "/modals",
          verticalSpacing: 12,
          children: [
            LegendText(
              text:
                  "Buttons sind sehr cool!. Im Legend Design Pack gibt es mehere Arten von Buttons. ",
            ),
            LegendGrid(
              sizes: LegendGridSize(
                small: LegendGridSizeInfo(1, 64),
                medium: LegendGridSizeInfo(3, 48),
                large: LegendGridSizeInfo(4, 48),
                xxl: LegendGridSizeInfo(4, 48),
              ),
              children: [
                LegendButton(
                  text: Text("Show Success Alert"),
                  margin: EdgeInsets.all(16.0),
                  onPressed: () {
                    LegendPopups.showAlert(
                      context: context,
                      alert: LegendAlert.success(
                        message: "Ja geschafft du verdammta Trottlwichsa!",
                      ),
                    );
                  },
                  style: LegendButtonStyle.normal(),
                ),
                LegendButton(
                  text: Text("Show Modal Bottom"),
                  onPressed: () => {
                    Scaffold.of(context).showBottomSheet(
                      (context) {
                        return LegendBottomSheet(
                          title: "Cookies",
                          onCancel: () {},
                          onConfirm: () {},
                          content: LegendText(
                            text: "Bitte aktzeptieren Sie unsere Cookies! LIT",
                            textStyle: LegendTextStyle.h5(),
                          ),
                        );
                      },
                      backgroundColor: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                    ),
                  },
                  style: LegendButtonStyle.normal(),
                ),
                LegendButton(
                  text: Text("Show Modal"),
                  onPressed: () => {
                    LegendPopups.showLegendModal(
                      context: context,
                      modal: Modal(
                        content: Text("test"),
                        onConfirm: () => {},
                        onCancle: () => {},
                        height: 400,
                        width: 400,
                      ),
                    ),
                  },
                  style: LegendButtonStyle.normal(),
                )
              ],
            ),
          ],
        ),
        Section(
          name: "/selectbar",
          children: [
            LegendGrid(
              sizes: LegendGridSize(
                small: LegendGridSizeInfo(1, 64),
                large: LegendGridSizeInfo(2, 80),
                layoutDirection: LegendGridSizeDirection.DOWN,
              ),
              children: [
                LegendSelectBar(
                  options: [
                    LegendSelectOption(
                        color: Colors.teal, icon: Icons.credit_card, name: "1"),
                    LegendSelectOption(
                        color: Colors.teal,
                        icon: Icons.wallet_giftcard,
                        name: "2"),
                    LegendSelectOption(
                      color: Colors.teal,
                      icon: Icons.money,
                      name: "3",
                    ),
                  ],
                  aligment: MainAxisAlignment.spaceAround,
                  onSelected: (a) {
                    print(a);
                  },
                  iconSize: 36,
                ),
                LegendSelectBar(
                  color: theme.colors.foreground[1],
                  options: [
                    LegendSelectOption(
                        color: Colors.purpleAccent,
                        icon: Icons.credit_card,
                        name: "1"),
                    LegendSelectOption(
                        color: Colors.purpleAccent,
                        icon: Icons.wallet_giftcard,
                        name: "2"),
                    LegendSelectOption(
                      color: Colors.purpleAccent,
                      icon: Icons.money,
                      name: "3",
                    ),
                  ],
                  aligment: MainAxisAlignment.spaceAround,
                  onSelected: (a) {
                    print(a);
                  },
                  isCard: true,
                  iconSize: 36,
                ),
              ],
            ),
          ],
          header: "Select Button Bar",
        ),
        Section(
          name: "/textfield",
          children: [
            LegendTextField(
              decoration: LegendInputDecoration.rounded(
                  focusColor: Colors.teal,
                  textColor: Colors.grey[800],
                  radius: BorderRadius.all(Radius.circular(2))),
            ),
          ],
          header: "Textfield",
        ),
        Section(
          name: "/carousel",
          children: [
            LegendCarousel(
              height: 200,
              items: [
                Container(),
                Container(),
                Container(
                  color: Colors.orange,
                ),
                Container(
                  color: Colors.green,
                ),
              ],
            ),
          ],
          header: "Carousel",
        ),
        Section(
          name: "/form",
          children: [
            LegendForm(
              children: [
                LegendFormField.text(
                  text: LegendTextField(
                    decoration: LegendInputDecoration.rounded(
                      focusColor: Colors.teal,
                      textColor: Colors.grey[800],
                      radius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  onSave: (value) {
                    print("save $value");
                  },
                ),
                LegendFormField.text(
                  isRequired: true,
                  text: LegendTextField(
                    decoration: LegendInputDecoration.rounded(
                      focusColor: Colors.teal,
                      textColor: Colors.grey[800],
                      radius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  onSave: (value) {
                    print("save $value");
                  },
                ),
                LegendFormRow(
                  children: [
                    LegendFormField.boolean(
                      title: "Test",
                      isRequired: true,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    LegendFormField.boolean(
                      isRequired: true,
                      title: "Test",
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
          header: "Form",
        ),
        Section(
          name: "/table",
          children: [
            LegendText(text: "loreasd"),
            LegendTable(
              header: "Test Table",
              rowHeight: 56,
              columnTypes: [
                LegendTableValueType.TEXT,
                LegendTableValueType.TAG,
                LegendTableValueType.ACTION,
              ],
              values: [
                LegendRowValue(
                  fields: [
                    "test",
                    [
                      ["Trottl", Colors.red],
                      ["Lappen", Colors.blue],
                    ],
                    "delete"
                  ],
                  actionFunction: () {
                    print("hello");
                  },
                ),
                LegendRowValue(
                  fields: [
                    "asd",
                    [
                      ["Developer", Colors.orange],
                      ["Coolman", Colors.green],
                    ],
                    "delete"
                  ],
                  actionFunction: () {
                    print("hello");
                  },
                ),
                LegendRowValue(
                  fields: [
                    "test",
                    [
                      ["Nice", Colors.brown],
                      ["Cool", Colors.purple],
                    ],
                    "delete"
                  ],
                  actionFunction: () {
                    print("hello");
                  },
                ),
              ],
            ),
          ],
          header: "Table",
        ),
        Section(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LegendTag(color: Colors.purpleAccent, text: "Test"),
                LegendTag(color: Colors.redAccent, text: "Test"),
                LegendTag(color: Colors.tealAccent, text: "Test"),
                LegendTag(color: Colors.blueAccent, text: "Test"),
                LegendTag(color: Colors.yellow, text: "Test"),
              ],
            )
          ],
          header: "Tags",
          name: "/tags",
        ),
      ],
      pageName: "Widget Components",
      layoutType: LayoutType.FixedHeaderSider,
    );
  }
}
