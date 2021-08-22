import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webstore/customwidgets/input/text/legendTextField.dart';

enum LegendFormFieldType {
  TEXT,
  BOOL,
  NUMBER,
}

class LegendFormRow {
  final List<LegendFormField> children;
  final MainAxisAlignment? alignment;

  LegendFormRow({
    required this.children,
    this.alignment,
  });
}

class LegendFormField<T> {
  final LegendFormFieldType type;
  final LegendTextField? textField;
  final T? initalValue;
  final Function(T value)? onChanged;
  final Function(T value)? onSave;
  final String? title;
  final Function(T? val)? validator;
  late bool isRequired;

  LegendFormField({
    required this.type,
    this.textField,
    this.initalValue,
    this.onChanged,
    this.onSave,
    this.title,
    this.validator,
    bool? isRequired,
  }) {
    this.isRequired = isRequired ?? false;
  }
  factory LegendFormField.text({
    required LegendTextField text,
    Function(T value)? onChanged,
    Function(T value)? onSave,
    bool? isRequired,
  }) {
    return LegendFormField<T>(
      type: LegendFormFieldType.TEXT,
      textField: text,
      onChanged: onChanged,
      onSave: onSave,
      isRequired: isRequired,
    );
  }

  factory LegendFormField.boolean({
    Function(T value)? onChanged,
    Function(T value)? onSave,
    Function(T? value)? validator,
    required String title,
    bool? isRequired,
  }) {
    return LegendFormField<T>(
      type: LegendFormFieldType.BOOL,
      onChanged: onChanged,
      onSave: onSave,
      title: title,
      isRequired: isRequired,
      validator: validator,
    );
  }
}
