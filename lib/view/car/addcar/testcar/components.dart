import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/controllers/providers/car/carform_provider.dart';
import 'package:admin_rent/utils/custom_error_text.dart';
import 'package:admin_rent/utils/custom_message_service.dart';
import 'package:admin_rent/view/car/addcar/testcar/add_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.carFormProvider,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final CarFormProvider carFormProvider;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<CarProvider>(
        builder: (context, carProvider, child) {
          return ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                carProvider.setLoading(true);
                try {
                  await carProvider.addCarVehicle(
                    context: context,
                    make: carFormProvider.selectedMake ?? 'Unknown',
                    engine: carFormProvider.selectedEngine ?? 'Unknown',
                    seatCapacity: carFormProvider.seatCapacity ?? 0,
                    model: carFormProvider.model ?? '',
                    body: carFormProvider.body ?? '',
                    year: carFormProvider.selectedYear ?? 0,
                    color: carFormProvider.selectedColor?.value
                            .toRadixString(16) ??
                        '',
                    rentalPriceDay: carFormProvider.rentalPriceDay ?? 0.0,
                    status: false,
                    mainImage: carProvider.mainImage!,
                    images: carProvider.images,
                  );
                  MessageService.showSnackBar(
                      // ignore: use_build_context_synchronously
                      context,
                      'Car details added successfully!');
                } catch (e) {
                  if (kDebugMode) {
                    print(e.toString());
                  }
                  throw UserFriendlyException(
                      message: 'Failed to fetch car details: ${e.toString()}');
                }
              }
            },
            child: carProvider.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text("Submit"),
          );
        },
      ),
    );
  }
}

class EngineDropDown extends StatelessWidget {
  const EngineDropDown({
    super.key,
    required this.carFormProvider,
  });

  final CarFormProvider carFormProvider;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
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
    );
  }
}
