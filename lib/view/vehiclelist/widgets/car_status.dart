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
            color: isAvailable ? Colors.green : Colors.red, fontSize: 12),
      ),
      Icon(
        isAvailable ? Icons.check_circle : Icons.cancel,
        color: isAvailable ? Colors.green : Colors.red,
      ),
    ]);
  }
}
