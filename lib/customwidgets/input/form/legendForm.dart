import 'package:flutter/material.dart';

class LegendForm extends StatefulWidget {
  const LegendForm({Key? key}) : super(key: key);

  @override
  _LegendFormState createState() => _LegendFormState();
}

class _LegendFormState extends State<LegendForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            FormField<String>(
              builder: (field) {
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
