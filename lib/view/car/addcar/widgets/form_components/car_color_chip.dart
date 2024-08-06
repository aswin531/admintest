
//============>>Car Color <<===================

import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/view/car/addcar/widgets/color_map.dart';
import 'package:flutter/material.dart';

class CarColorWrap extends StatelessWidget {
  const CarColorWrap({
    super.key,
    required this.carProvider,
  });

  final CarProvider carProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          for (int i = 0; i < colorMap.length; i += 3)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int j = i; j < i + 3 && j < colorMap.length; j++)
                    Expanded(
                      child: _buildColorChip(
                        colorMap.keys.elementAt(j),
                        colorMap.values.elementAt(j),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildColorChip(Color color, String colorName) {
    return Row(
      children: [
        FilterChip(
          elevation: 5,
          shape: const CircleBorder(
              eccentricity: 0.2, side: BorderSide(color: Colors.transparent)),
          showCheckmark: true,
          checkmarkColor: Colors.white,
          label: const SizedBox(width: 8, height: 8),
          selected: carProvider.selectedColor == color,
          backgroundColor: color,
          selectedColor: color,
          onSelected: (bool selected) {
            carProvider.updateColor(selected ? color : null);
          },
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            colorName,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
