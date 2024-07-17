import 'package:admin_rent/controllers/providers/car/carform_provider.dart';
import 'package:admin_rent/utils/custom_text_forms_fields.dart';
import 'package:admin_rent/view/car/addcar/testcar/add_details.dart';
import 'package:admin_rent/view/car/addcar/testcar/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddCarFormWidgetTest extends StatelessWidget {
  AddCarFormWidgetTest({super.key});
  final _formKey = GlobalKey<FormState>();

  final List<int> years = List.generate(30, (index) => 2024 - index);

  @override
  Widget build(BuildContext context) {
    final carFormProvider = Provider.of<CarFormProvider>(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Filters",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          DropdownButtonFormField<String>(
            value: carFormProvider.selectedMake,
            decoration: const InputDecoration(
                labelText: 'Make', border: OutlineInputBorder()),
            items: makes.map((make) {
              return DropdownMenuItem<String>(
                value: make,
                child: Text(make),
              );
            }).toList(),
            onChanged: (value) {
              carFormProvider.updateMake(value);
            },
          ),
          SizedBox(height: 10.h),
          DropdownButtonFormField<String>(
            value: carFormProvider.selectedEngine,
            decoration: const InputDecoration(
                labelText: 'Engine', border: OutlineInputBorder()),
            items: engines.map((engine) {
              return DropdownMenuItem<String>(
                value: engine,
                child: Text(engine),
              );
            }).toList(),
            onChanged: (value) {
              carFormProvider.updateEngine(value);
            },
          ),
          SizedBox(height: 10.h),
          DropdownButtonFormField<int>(
            value: carFormProvider.selectedYear,
            decoration: const InputDecoration(
                labelText: 'Year', border: OutlineInputBorder()),
            items: years.map((year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(year.toString()),
              );
            }).toList(),
            onChanged: (value) {
              carFormProvider.updateYear(value);
            },
          ),
          SizedBox(height: 10.h),
          Text("Color", style: TextStyle(fontSize: 16.sp)),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () async {
              // ignore: unused_local_variable
              Color? selectedColor = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Pick a color"),
                  content: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor: Colors.white,
                      onColorChanged: (color) {
                        carFormProvider.updateColor(color);
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Text(
                  carFormProvider.selectedColor == null
                      ? "Pick a color"
                      : "Color: ${colorNames[carFormProvider.selectedColor] ?? carFormProvider.selectedColor.toString()}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          StyledTextFormField(
            labelText: "Model",
            controller: carFormProvider.modelController,
            onSaved: carFormProvider.updateModel,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 10.h),
          StyledTextFormField(
            labelText: "Body",
            controller: carFormProvider.bodyController,
            onSaved: carFormProvider.updateBody,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 10.h),
          StyledTextFormField(
            labelText: "Seat Capacity",
            controller: carFormProvider.seatCapacityController,
            onSaved: (value) =>
                carFormProvider.updateSeatCapacity(int.tryParse(value!)),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10.h),
          StyledTextFormField(
            labelText: "Rental Price Per Day",
            controller: carFormProvider.rentalPriceDayController,
            onSaved: (value) =>
                carFormProvider.updateRentalPriceDay(double.tryParse(value!)),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10.h),
          SubmitButtonWidget(
              formKey: _formKey, carFormProvider: carFormProvider),
        ],
      ),
    );
  }
}
