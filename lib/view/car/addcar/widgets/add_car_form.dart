import 'package:admin_rent/controllers/providers/car/carform_provider.dart';
import 'package:admin_rent/view/car/addcar/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carFormProvider = Provider.of<CarFormProvider>(context);

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300]!,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AddFormHeader(),
                      const SizedBox(height: 16),
                      _buildDropdown(
                        value: carFormProvider.selectedMake,
                        hint: 'Car brand',
                        onChanged: (value) => carFormProvider.updateMake(value),
                        items: ['Alfa Romeo', 'BMW', 'Mercedes', 'Audi'],
                      ),
                      _buildDropdown(
                        value: carFormProvider.model,
                        hint: 'Car model',
                        onChanged: (value) =>
                            carFormProvider.updateModel(value),
                        items: ['Model 1', 'Model 2', 'Model 3'],
                      ),
                      const SizedBox(height: 16),
                      const Text('Price range per hour'),
                      RangeSlider(
                        values: const RangeValues(22, 88),
                        //values: carFormProvider.rentalPriceDay.,
                        min: 0,
                        max: 100,
                        divisions: 100, onChanged: (value) {},
                        //labels: RangeLabels('${carFormProvider.rentalPriceDay}', '${{carFormProvider.rentalPriceDay}}'),
                        // onChanged: (RangeValues values) {
                        //   priceRange.value = values;
                        // },
                      ),
                      const SizedBox(height: 16),
                      const Text('Type'),
                      CarBodyType(carFormProvider: carFormProvider),
                      const SizedBox(height: 16),
                      const Text('Color'),
                      CarColorWrap(carFormProvider: carFormProvider),
                      const SizedBox(height: 16),
                      const CarStatus(),
                      const SizedBox(height: 16),
                      const Text('Rental type'),
                      const RentalChoiceChip(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Right side - Container
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text('Right side container content'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required Function(String?) onChanged,
    required List<String> items,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(hint),
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
