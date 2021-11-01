import 'package:flutter/material.dart';
import 'package:legend_design_core/typography/legend_text.dart';
import 'package:legend_design_core/typography/typography.dart';
import 'package:legend_design_widgets/input/form/legendFormField.dart';
import 'package:legend_design_widgets/input/switch/legendSwitch.dart';
import 'package:legend_design_widgets/legendButton/legendButton.dart';

class LegendForm extends StatefulWidget {
  final List<dynamic> children;
  late List<LegendFormField> fields;
  late List<Widget> layouts;
  final bool? autovalidate;
  final double? height;

  LegendForm({
    required this.children,
    this.autovalidate,
    this.height,
  }) {
    fields = children.whereType<LegendFormField>().toList();
    layouts = children.whereType<Widget>().toList();
  }

  @override
  _LegendFormState createState() => _LegendFormState();
}

class _LegendFormState extends State<LegendForm> {
  final _formKey = GlobalKey<FormState>();

  List<Widget> getFields(BuildContext context) {
    List<Widget> widgets = [];

    for (var i = 0; i < widget.children.length; i++) {
      dynamic item = widget.children[i];
      if (item is LegendFormField) {
        LegendFormField field = item;
        widgets.add(getFormfield(field, context, false));
      } else if (item is LegendFormRow) {
        LegendFormRow row = item;
        widgets.add(getFormRow(row, context));
      }
    }
    return widgets;
  }

  Widget getFormRow(LegendFormRow row, BuildContext context) {
    List<Widget> children =
        row.children.map((e) => getFormfield(e, context, true)).toList();
    return Row(
      children: children,
      mainAxisAlignment: row.alignment ?? MainAxisAlignment.start,
    );
  }

  Widget getFormfield(LegendFormField field, BuildContext context, bool isRow) {
    Widget formField = Container();
    double width = MediaQuery.of(context).size.width;

    switch (field.type) {
      case LegendFormFieldType.BOOL:
        formField = FormField<bool>(
          builder: (f) {
            return LegendSwitch(
              activeColor: f.hasError ? Colors.redAccent : Colors.tealAccent,
              onChanged: field.onChanged != null
                  ? (value) {
                      field.onChanged!(value);
                    }
                  : null,
            );
          },
          initialValue: field.initalValue,
          autovalidateMode: AutovalidateMode.disabled,
          onSaved: field.onSave != null
              ? (value) {
                  field.onSave!(value);
                }
              : null,
        );
        break;

      case LegendFormFieldType.TEXT:
        formField = TextFormField(
          validator: (value) {
            if (field.isRequired) {
              if (field.validator != null) {
                field.validator!(value);
              } else {
                if (value == null || value.length == 0) {
                  return 'Field required';
                }
              }
            } else if (field.validator != null) {
              field.validator!(value);
            }
          },
          decoration: field.textField?.decoration,
          initialValue: field.initalValue,
          //     autovalidateMode: AutovalidateMode.disabled,
          onChanged: field.onChanged != null
              ? (value) {
                  field.onChanged!(value);
                }
              : null,
          onSaved: field.onSave != null
              ? (value) {
                  field.onSave!(value);
                }
              : null,
          onFieldSubmitted: field.onSave != null
              ? (value) {
                  field.onSave!(value);
                }
              : null,
        );
        break;
      case LegendFormFieldType.NUMBER:
        break;
    }

    Widget w = Container(
      padding: EdgeInsets.only(bottom: 12),
      width: isRow ? null : width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (field.title != null)
            LegendText(
              text: field.title!,
              textStyle: LegendTextStyle.formHeader(),
            ),
          formField,
        ],
      ),
    );

    if (isRow) w = Expanded(child: w);

    return w;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Form(
        key: _formKey,
        child: Column(
          children: getFields(context) +
              [
                LegendButton(
                  text: LegendText(text: "Submit"),
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                )
              ],
        ),
        onChanged: () {
          print("test");
        },
      ),
    );
  }
}
