import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _hasValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Status:'),
        Checkbox(
          value: _hasValue,
          onChanged: (value) => setState(() => _hasValue = value!),
        ),
      ],
    );
  }
}
