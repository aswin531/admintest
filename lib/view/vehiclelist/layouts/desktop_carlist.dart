import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/controllers/providers/car/carfilter_provider.dart';
import 'package:admin_rent/model/car_model.dart';
import 'package:admin_rent/view/car/display/widgets/filterchips.dart';
import 'package:admin_rent/view/vehiclelist/vehicle_card_list.dart';
import 'package:admin_rent/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarListDesktopLayout extends StatelessWidget {
  const CarListDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
              alignment: Alignment.topLeft, child: SearchAndFilterBar()),
          const FilterChips(),
          Expanded(
            child: Consumer<CarFilterChipProvider>(
              builder: (context, filterProvider, child) {
                return StreamBuilder<List<CarVehicle>>(
                  stream:
                      Provider.of<CarProvider>(context).getCarVehiclesStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No cars available'));
                    } else {
                      List<CarVehicle> cars = snapshot.data!;
                      List<CarVehicle> filteredCars = cars.where((car) {
                        if (filterProvider.selectedFilters.isEmpty) {
                          return true;
                        }
                        debugPrint('Filter: ${filterProvider.selectedFilters}');
                        return filterProvider.selectedFilters
                            .contains(car.make);
                      }).toList();
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (context, index) =>
                            CarCard(car: filteredCars[index]),
                        itemCount: filteredCars.length,
                      );
                    }
                  },
                );
              },
            ),
          ),
        ]);
  }
}
