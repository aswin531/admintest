import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/utils/custom_text_forms_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddCarFormWidget extends StatelessWidget {
   AddCarFormWidget({super.key});
  final _formKey = GlobalKey<FormState>();

  final makeController = TextEditingController();
  final engineController = TextEditingController();
  final seatController = TextEditingController();
  final modelController = TextEditingController();
  final bodyController = TextEditingController();
  final yearController = TextEditingController();
  final colorController = TextEditingController();
  final priceController = TextEditingController();
  final statusController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          StyledTextFormField(
            labelText: "make",
            controller: makeController,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 5.h),
          StyledTextFormField(
            labelText: "engine",
            controller: engineController,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 5.h),
          StyledTextFormField(
            labelText: "seatCapacity",
            controller: seatController,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 5.h),
          StyledTextFormField(
            labelText: "model",
            controller: modelController,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 5.h),
          StyledTextFormField(
            labelText: "body",
            controller: bodyController,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 5.h),
          StyledTextFormField(
            labelText: "year",
            controller: yearController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 5.h),
          StyledTextFormField(
            labelText: "color",
            controller: colorController,
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 5.h),
          StyledTextFormField(
            labelText: "price",
            controller: priceController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 5.h),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final String make = makeController.text;
                final String model = modelController.text;
                final int year = int.parse(yearController.text);
                final String body = bodyController.text;
                final String color = colorController.text;
                final int seatCapacity = int.parse(seatController.text);
                final double rentalPriceDay =
                    double.parse(priceController.text);
                final String engine = engineController.text;
                const bool status = false;
                final CarProvider carProvider =
                    Provider.of<CarProvider>(context, listen: false);

                if (carProvider.mainImage != null &&
                    carProvider.images.isNotEmpty) {
                  carProvider.addCarVehicle(
                    context: context,
                    make: make,
                    engine: engine,
                    seatCapacity: seatCapacity,
                    model: model,
                    body: body,
                    year: year,
                    color: color,
                    rentalPriceDay: rentalPriceDay,
                    status: status,
                    mainImage: carProvider.mainImage!,
                    images: carProvider.images,
                  );
                }
              }
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
