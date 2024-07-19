import 'package:admin_rent/controllers/providers/car/carform_provider.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:admin_rent/view/car/addcar/widgets/color_map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//============>>Car Filter Header <<===================

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

//============>>Car Body <<===================

class CarBodyType extends StatelessWidget {
  const CarBodyType({
    super.key,
    required this.carFormProvider,
  });

  final CarFormProvider carFormProvider;

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
                      value: carFormProvider.body == type,
                      onChanged: (bool? value) {
                        carFormProvider.updateBody(value == true ? type : null);
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

//============>>Car PriceRange <<===================

class PriceRangeSlider extends StatelessWidget {
  const PriceRangeSlider({
    super.key,
    required this.carFormProvider,
  });
  final CarFormProvider carFormProvider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RangeSlider(
          activeColor: Colors.blue,
          inactiveColor: ExternalAppColors.secondaryBg,
          values: carFormProvider.rentalPriceRange!,
          min: 500,
          max: 10000,
          divisions: 100,
          labels: RangeLabels(
            '\$${carFormProvider.rentalPriceRange!.start.round()}',
            '\$${carFormProvider.rentalPriceRange!.end.round()}',
          ),
          onChanged: (RangeValues values) {
            carFormProvider.updaterentalPriceRange(values);
          },
        ),
        Positioned(
          top: 0,
          left: carFormProvider.rentalPriceRange!.start /
                  100 *
                  MediaQuery.of(context).size.width -
              20,
          child: Text(
            '\$${carFormProvider.rentalPriceRange!.start.round()}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: (1 - carFormProvider.rentalPriceRange!.end / 100) *
                  MediaQuery.of(context).size.width -
              20,
          child: Text(
            '\$${carFormProvider.rentalPriceRange!.end.round()}',
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

//============>>Car Color <<===================

class CarColorWrap extends StatelessWidget {
  const CarColorWrap({
    super.key,
    required this.carFormProvider,
  });

  final CarFormProvider carFormProvider;

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
          selected: carFormProvider.selectedColor == color,
          backgroundColor: color,
          selectedColor: color,
          onSelected: (bool selected) {
            carFormProvider.updateColor(selected ? color : null);
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
//============>>Car Status <<===================

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
        Consumer<CarFormProvider>(
          builder: (context, carFormProvider, child) {
            return Switch(
              splashRadius: 10,
              activeColor: Colors.blue,
              value: carFormProvider.isAvailable,
              onChanged: (value) {
                carFormProvider.updateAvailability(value);
              },
            );
          },
        ),
      ],
    );
  }
}

//============>>Car Rental Choice Chip <<===================

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

//============>>Car Insurance <<===================

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
