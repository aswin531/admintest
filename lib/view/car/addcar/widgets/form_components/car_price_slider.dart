
//============>>Car PriceRange <<===================

import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';

class PriceRangeSlider extends StatelessWidget {
  const PriceRangeSlider({
    super.key,
    required this.carProvider,
  });
  final CarProvider carProvider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RangeSlider(
          activeColor: Colors.blue,
          inactiveColor: ExternalAppColors.secondaryBg,
          values: carProvider.rentalPriceRange,
          min: 500,
          max: 10000,
          divisions: 100,
          labels: RangeLabels(
            '\$${carProvider.rentalPriceRange.start.round()}',
            '\$${carProvider.rentalPriceRange.end.round()}',
          ),
          onChanged: (RangeValues values) {
            carProvider.updaterentalPriceRange(values);
          },
        ),
        Positioned(
          top: 0,
          left: carProvider.rentalPriceRange.start /
                  100 *
                  MediaQuery.of(context).size.width -
              20,
          child: Text(
            '\$${carProvider.rentalPriceRange.start.round()}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: (1 - carProvider.rentalPriceRange.end / 100) *
                  MediaQuery.of(context).size.width -
              20,
          child: Text(
            '\$${carProvider.rentalPriceRange.end.round()}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
