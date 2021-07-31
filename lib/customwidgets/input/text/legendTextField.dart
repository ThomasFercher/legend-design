import 'package:flutter/material.dart';

class LegendTextField extends StatefulWidget {
  LegendTextField({Key? key}) : super(key: key);

  @override
  _LegendTextFieldState createState() => _LegendTextFieldState();
}

class _LegendTextFieldState extends State<LegendTextField> {
  late TextEditingController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(),
      ),
    );
  }
}
