//============>>Car Body <<===================

import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:flutter/material.dart';

class CarBodyType extends StatelessWidget {
  const CarBodyType({
    super.key,
    required this.carProvider,
  });

  final CarProvider carProvider;

  @override
  Widget build(BuildContext context) {
    final List<String> bodyTypes = [
      'Sedan',
      'SUV',
      'Van',
      'Pickup',
      'Wagon',
      //'Minivan',
      'Coupe'
    ];

    return Wrap(
      alignment: WrapAlignment.start,
      children: List.generate(
        (bodyTypes.length / 2).ceil(),
        (rowIndex) {
          return Row(
            children: List.generate(
              3,
              (columnIndex) {
                final index = rowIndex * 3 + columnIndex;
                if (index < bodyTypes.length) {
                  final type = bodyTypes[index];
                  return Expanded(
                    child: CheckboxListTile(
                      hoverColor: Colors.blue,
                      activeColor: Colors.blue,
                      title: Text(type),
                      value: carProvider.body == type,
                      onChanged: (bool? value) {
                        carProvider.updateBody(value == true ? type : null);
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                    ),
                  );
                } else {
                  return Expanded(child: Container());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
