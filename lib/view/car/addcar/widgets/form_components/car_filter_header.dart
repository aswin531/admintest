//============>>Car Filter Header <<===================

import 'package:flutter/material.dart';

class AddFormHeader extends StatelessWidget {
  const AddFormHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Filters',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () {},
          child: const Text('Reset', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}

