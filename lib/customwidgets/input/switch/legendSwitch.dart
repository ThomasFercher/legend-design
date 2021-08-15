import 'package:flutter/material.dart';

class LegendSwitch extends StatefulWidget {
  final Function(bool value)? onChanged;
  late bool initalValue;

  LegendSwitch({
    this.onChanged,
    bool? initalValue,
  }) {
    this.initalValue = initalValue ?? false;
  }

  @override
  _LegendSwitchState createState() => _LegendSwitchState();
}

class _LegendSwitchState extends State<LegendSwitch> {
  late bool value;

  @override
  void initState() {
    value = widget.initalValue;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: value,
        onChanged: (val) {
          setState(() {
            value = val;
          });
          if (widget.onChanged != null) widget.onChanged!(value);
        },
      ),
    );
  }
}
