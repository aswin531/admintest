

//============>>Car Insurance <<===================

import 'package:flutter/material.dart';

class CarInsuranceWidget extends StatelessWidget {
  const CarInsuranceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: ['Collision Damage Waiver', 'Roadside Plus'].map((insurance) {
        return FilterChip(
          label: Text(insurance),
          selected: false, // Add insurance to your provider if needed
          onSelected: (bool selected) {
            // Update insurance in provider
          },
        );
      }).toList(),
    );
  }
}
