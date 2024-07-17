import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _hasValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Status:'),
        Checkbox(
          value: _hasValue,
          onChanged: (value) => setState(() => _hasValue = value!),
        ),
      ],
    );
  }
}
