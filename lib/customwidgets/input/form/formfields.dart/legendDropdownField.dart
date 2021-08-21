import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webstore/customwidgets/input/dropdown.dart/legendDropdown.dart';
import 'package:webstore/customwidgets/input/dropdown.dart/legendDropdownOption.dart';

class LegendDropDownField extends FormField<PopupMenuOption> {
  final List<PopupMenuOption> options;

  LegendDropDownField({
    required this.options,
  }) : super(
          validator: (value) {},
          builder: (field) {
            return LegendDropdown(
              options: options,
              onSelected: (selected) {
                print(selected);
              },
            );
          },
        );
}
