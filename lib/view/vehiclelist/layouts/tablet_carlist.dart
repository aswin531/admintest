import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/model/car_model.dart';
import 'package:admin_rent/view/vehiclelist/widgets/filterchips.dart';
import 'package:admin_rent/view/vehiclelist/vehicle_card_list.dart';
import 'package:admin_rent/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarListTabletLayout extends StatelessWidget {
  const CarListTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchAndFilterBar(),
        const FilterChips(),
        Expanded(
          child: StreamBuilder<List<CarVehicle>>(
            stream: Provider.of<CarProvider>(context).getCarVehiclesStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No cars available'));
              } else {
                List<CarVehicle> cars = snapshot.data!;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => CarCard(car: cars[index]),
                  itemCount: cars.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
