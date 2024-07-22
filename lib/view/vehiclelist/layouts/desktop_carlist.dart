import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/model/car_model.dart';
import 'package:admin_rent/view/vehiclelist/vehicle_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarListDesktopLayout extends StatelessWidget {
  const CarListDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CarVehicle>>(
      stream: Provider.of<CarProvider>(context).getCarVehiclesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No cars available'));
        } else {
          List<CarVehicle> cars = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) => CarCard(car: cars[index]),
            itemCount: cars.length,
          );
        }
      },
    );
  }
}
