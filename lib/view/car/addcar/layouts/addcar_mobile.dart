import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/view/car/addcar/widgets/form_components/car_body.dart';
import 'package:admin_rent/view/car/addcar/widgets/form_components/car_color_chip.dart';
import 'package:admin_rent/view/car/addcar/widgets/form_components/car_filter_header.dart';
import 'package:admin_rent/view/car/addcar/widgets/form_components/car_price_slider.dart';
import 'package:admin_rent/view/car/addcar/widgets/form_components/car_status.dart';
import 'package:admin_rent/view/car/addcar/widgets/form_components/rental_choice_chip.dart';
import 'package:admin_rent/view/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:admin_rent/view/car/addcar/widgets/image_selection.dart';

class MobileLayout extends StatelessWidget {
  final CarProvider carProvider;

  const MobileLayout({super.key, required this.carProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: ExternalAppColors.secondaryBg,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: buildFormContent(carProvider),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                color: ExternalAppColors.secondaryBg,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: const ImageSelectionWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormContent(CarProvider carProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddFormHeader(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: FutureBuilder<List<String>>(
                  future: carProvider.getBrands(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    return _buildDropdown(
                      value: carProvider.selectedMake,
                      hint: 'Car brand',
                      onChanged: (value) => carProvider.updateMake(value),
                      items: snapshot.data!,
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FutureBuilder<List<String>>(
                  future: carProvider.getModels(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    return _buildDropdown(
                      value: carProvider.model,
                      hint: 'Car model',
                      onChanged: (value) => carProvider.updateModel(value),
                      items: snapshot.data!,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const PrimaryText(
            text: 'Price range per hour',
            size: 20,
            fontWeight: FontWeight.w800,
          ),
          PriceRangeSlider(carProvider: carProvider),
          const SizedBox(height: 16),
          const PrimaryText(
            text: "Categories",
            size: 20,
            fontWeight: FontWeight.w800,
          ),
          CarBodyType(carProvider: carProvider),
          const SizedBox(height: 16),
          const PrimaryText(
            text: 'Available Vehicle Colors',
            size: 20,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 16),
          CarColorWrap(carProvider: carProvider),
          const SizedBox(height: 16),
          const Divider(
            endIndent: 2,
            color: ExternalAppColors.white,
            thickness: 1,
          ),
          const CarStatus(),
          const SizedBox(height: 16),
          const PrimaryText(
            text: 'Rental type',
            size: 20,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 16),
          const RentalChoiceChip(),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomDropdown(
                value: carProvider.selectedYear?.toString(),
                hint: 'Year',
                onChanged: (value) => carProvider.updateYear(int.parse(value!)),
                items: List.generate(
                    30, (index) => (DateTime.now().year - index).toString()),
              ),
              const SizedBox(width: 16),
              CustomDropdown(
                value: carProvider.selectedEngine?.toString(),
                hint: 'Engine',
                onChanged: (value) => carProvider.updateEngine(value),
                items: const ['Petrol 1', 'Diesel 2', 'EV 3'],
              ),
              const SizedBox(width: 16),
              CustomDropdown(
                value: carProvider.seatCapacity?.toString(),
                hint: 'Seat ',
                onChanged: (value) =>
                    carProvider.updateSeatCapacity(int.parse(value!)),
                items: const ['4', '5', '7', '12'],
              ),
            ],
          ),
          const SizedBox(height: 16),
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
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
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
