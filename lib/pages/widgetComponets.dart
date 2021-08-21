import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:provider/provider.dart';
import 'package:webstore/customwidgets/datadisplay/carousel/legendCarousel.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendRowValue.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTable.dart';
import 'package:webstore/customwidgets/datadisplay/table/legendTableCell.dart';
import 'package:webstore/customwidgets/input/form/legendForm.dart';
import 'package:webstore/customwidgets/input/form/legendFormField.dart';
import 'package:webstore/customwidgets/input/selectBar/legendSelectBar.dart';
import 'package:webstore/customwidgets/input/selectBar/legendSelectOption.dart';
import 'package:webstore/customwidgets/input/selectBar/legendselectButton.dart';
import 'package:webstore/customwidgets/input/text/legendInputDecoration.dart';
import 'package:webstore/customwidgets/input/text/legendTextField.dart';
import 'package:webstore/customwidgets/layout/grid/legendGridSize.dart';
import 'package:webstore/customwidgets/layout/grid/legendGrid.dart';
import 'package:webstore/customwidgets/layout/sections/section.dart';
import 'package:webstore/customwidgets/legendButton/legendButton.dart';
import 'package:webstore/customwidgets/legendButton/legendButtonStyle.dart';
import 'package:webstore/customwidgets/modals/legendAlert.dart';
import 'package:webstore/customwidgets/modals/legendBottomSheet.dart';
import 'package:webstore/customwidgets/modals/legendPopups.dart';
import 'package:webstore/customwidgets/modals/modal.dart';
import 'package:webstore/customwidgets/typography/legendText.dart';
import 'package:webstore/styles/legendTheme.dart';
import 'package:webstore/customwidgets/typography/typography.dart';
import '../customwidgets/layout/legendScaffold.dart';
import '../styles/layoutType.dart';

class WidgetComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LegendScaffold(
      siderBuilder: (context) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LegendSelectBar(
                isCard: true,
                margin: EdgeInsets.all(16),
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
                aligment: MainAxisAlignment.spaceAround,
                onSelected: (option) {
                  switch (option.name) {
                    case "dark":
                      Provider.of<LegendTheme>(context, listen: false)
                          .changeColorTheme(LegendColorThemeType.DARK);
                      break;
                    case "light":
                      Provider.of<LegendTheme>(context, listen: false)
                          .changeColorTheme(LegendColorThemeType.LIGHT);
                      break;
                    default:
                      break;
                  }
                },
                iconSize: 32,
              ),
            ],
          ),
        );
      },
      contentBuilder: (context) {
        return Container(
          child: Column(
            children: [
              Section(
                verticalSpacing: 8,
                header: "Buttons",
                children: [
                  LegendText(
                      text:
                          "Buttons sind sehr cool!. Im Legend Design Pack gibt es mehere Arten von Buttons. "),
                  LegendGrid(
                    sizes: LegendGridSize(
                      small: LegendGridSizeInfo(2, 64),
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
                        //  margin: EdgeInsets.all(16),
                        text: LegendText(text: "Gradient"),
                        onPressed: () => {},
                        style: LegendButtonStyle.gradient(
                          [
                            Colors.red[200]!,
                            Colors.redAccent,
                          ],
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 200,
                    child: SyntaxView(
                      code:
                          "LegendButton(\n margin: EdgeInsets.all(16),\n                        text: LegendText(text: \"Gradient\"),\n                        onPressed: () => {},\n                        style: LegendButtonStyle.gradient(\n                          [\n                            Colors.red[200]!,\n                            Colors.redAccent,\n                          ],\n                        ),\n                      ),",
                      syntax: Syntax.DART,
                      syntaxTheme: SyntaxTheme.standard(),
                      fontSize: 18.0,
                      withZoom: false,
                      withLinesCount: false,
                      expanded: false,
                    ),
                  ),
                ],
              ),
              Section(
                header: "Modals",
                verticalSpacing: 12,
                children: [
                  LegendText(
                    text:
                        "Buttons sind sehr cool!. Im Legend Design Pack gibt es mehere Arten von Buttons. ",
                  ),
                  LegendGrid(
                    sizes: LegendGridSize(
                      small: LegendGridSizeInfo(1, 48),
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
                              message:
                                  "Ja geschafft du verdammta Trottlwichsa!",
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
                                  text:
                                      "Bitte aktzeptieren Sie unsere Cookies! LIT",
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
                children: [
                  LegendGrid(
                    sizes: LegendGridSize(
                      small: LegendGridSizeInfo(1, 80),
                      large: LegendGridSizeInfo(3, 80),
                      layoutDirection: LegendGridSizeDirection.DOWN,
                    ),
                    children: [
                      LegendSelectBar(
                        options: [
                          LegendSelectOption(
                            color: Colors.redAccent,
                            icon: Icons.credit_card,
                            name: "1",
                          ),
                          LegendSelectOption(
                            color: Colors.purpleAccent,
                            icon: Icons.wallet_giftcard,
                            name: "2",
                          ),
                          LegendSelectOption(
                            color: Colors.cyanAccent,
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
                        options: [
                          LegendSelectOption(
                              color: Colors.redAccent,
                              icon: Icons.credit_card,
                              name: "1"),
                          LegendSelectOption(
                              color: Colors.purpleAccent,
                              icon: Icons.wallet_giftcard,
                              name: "2"),
                          LegendSelectOption(
                            color: Colors.cyanAccent,
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
                        options: [
                          LegendSelectOption(
                              color: Colors.redAccent,
                              icon: Icons.credit_card,
                              name: "1"),
                          LegendSelectOption(
                              color: Colors.purpleAccent,
                              icon: Icons.wallet_giftcard,
                              name: "2"),
                          LegendSelectOption(
                            color: Colors.cyanAccent,
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
              )
            ],
          ),
        );
      },
      pageName: "Widget Components",
      layoutType: LayoutType.FixedHeaderSider,
    );
  }
}
