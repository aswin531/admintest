
//============>>Car Rental Choice Chip <<===================

import 'package:flutter/material.dart';

class RentalChoiceChip extends StatelessWidget {
  const RentalChoiceChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: ['Any', 'Per day', 'Per hour'].map((type) {
        return ChoiceChip(
          label: Text(type),
          selected: false, // Add rental type to your provider if needed
          onSelected: (bool selected) {
            // Update rental type in provider
          },
        );
      }).toList(),
    );
  }
}
