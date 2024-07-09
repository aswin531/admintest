import 'package:admin_rent/model/car_model.dart';
import 'package:flutter/material.dart';

class EditCarScreen extends StatelessWidget {
  final CarVehicle car;
  final TextEditingController makeController;
  final TextEditingController engineController;
  final TextEditingController seatCapacityController;
  final TextEditingController modelController;
  final TextEditingController bodyController;
  final TextEditingController yearController;
  final TextEditingController colorController;
  final TextEditingController rentalPriceController;

  EditCarScreen({Key? key, required this.car})
      : makeController = TextEditingController(text: car.make),
        engineController = TextEditingController(text: car.engine),
        seatCapacityController =
            TextEditingController(text: car.seatCapacity.toString()),
        modelController = TextEditingController(text: car.model),
        bodyController = TextEditingController(text: car.body),
        yearController = TextEditingController(text: car.year.toString()),
        colorController = TextEditingController(text: car.color),
        rentalPriceController =
            TextEditingController(text: car.rentalPriceDay.toString()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Car'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: makeController,
              onChanged: (value) {
                car.make = value;
              },
              decoration: const InputDecoration(
                labelText: 'Make',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(keyboardType: TextInputType.number,
              controller: engineController,
              onChanged: (value) {
                car.engine = value;
              },
              decoration: const InputDecoration(
                labelText: 'Engine',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: seatCapacityController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                car.seatCapacity = int.tryParse(value) ?? 0;
              },
              decoration: const InputDecoration(
                labelText: 'Seat Capacity',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: modelController,
              onChanged: (value) {
                car.model = value;
              },
              decoration: const InputDecoration(
                labelText: 'Model',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: bodyController,
              onChanged: (value) {
                car.body = value;
              },
              decoration: const InputDecoration(
                labelText: 'Body',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: yearController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                car.year = int.tryParse(value) ?? 0;
              },
              decoration: const InputDecoration(
                labelText: 'Year',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: colorController,
              onChanged: (value) {
                car.color = value;
              },
              decoration: const InputDecoration(
                labelText: 'Color',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: rentalPriceController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {
                car.rentalPriceDay = double.tryParse(value) ?? 0.0;
              },
              decoration: const InputDecoration(
                labelText: 'Rental Price per Day',
              ),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text('Status'),
              value: car.status,
              onChanged: (value) {
                car.status = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
