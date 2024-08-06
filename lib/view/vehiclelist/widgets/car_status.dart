import 'package:flutter/material.dart';

class CarStatusIndicator extends StatelessWidget {
  final bool isAvailable;

  const CarStatusIndicator({super.key, required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        isAvailable ? 'Available' : 'Not Available',
        style: TextStyle(
            color: isAvailable ? Colors.green : Colors.red, fontSize: 15),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Icon(
          isAvailable ? Icons.check_circle : Icons.cancel,
          color: isAvailable ? Colors.green : Colors.red,
        ),
      ),
    ]);
  }
}
