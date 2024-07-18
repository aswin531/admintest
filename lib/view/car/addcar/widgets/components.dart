
import 'package:admin_rent/controllers/providers/car/carform_provider.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';


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
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () {},
          child: const Text('Reset',
              style: TextStyle(color: Colors.blue)),
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
    return Column(
      children: ['Sedan', 'SUV', 'Van', 'Pickup', 'Wagon', 'Minivan', 'Coupe']
          .map((type) {
        return CheckboxListTile(
          title: Text(type),
          value: carFormProvider.body == type,
          onChanged: (bool? value) {
            carFormProvider.updateBody(value == true ? type : null);
          },
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
        );
      }).toList(),
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
    return Wrap(
      spacing: 8,
      children: [
        Colors.black,
        Colors.white,
        ExternalAppColors.iconGray,
        Colors.grey,
        Colors.blue[900]!,
        Colors.brown
      ].map((color) {
        return FilterChip(
          label: const SizedBox.shrink(),
          selected: carFormProvider.selectedColor == color,
          backgroundColor: color,
          selectedColor: color,
          onSelected: (bool selected) {
            carFormProvider
                .updateColor(selected ? color : null);
          },
        );
      }).toList(),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Available now only'),
        Switch(
          value: false, // Add this to your provider if needed
          onChanged: (value) {},
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
          selected:
              false, // Add rental type to your provider if needed
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
      children: ['Collision Damage Waiver', 'Roadside Plus']
          .map((insurance) {
        return FilterChip(
          label: Text(insurance),
          selected:
              false, // Add insurance to your provider if needed
          onSelected: (bool selected) {
            // Update insurance in provider
          },
        );
      }).toList(),
    );
  }
}
