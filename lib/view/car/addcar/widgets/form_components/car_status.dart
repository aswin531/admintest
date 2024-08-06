//============>>Car Status <<===================

import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarStatus extends StatelessWidget {
  const CarStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const PrimaryText(
          text: 'Available',
          size: 17,
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(
          width: 10,
        ),
        Consumer<CarProvider>(
          builder: (context, carProvider, child) {
            return Switch(
              splashRadius: 10,
              activeColor: Colors.blue,
              value: carProvider.isAvailable,
              onChanged: (value) {
                carProvider.updateAvailability(value);
              },
            );
          },
        ),
      ],
    );
  }
}