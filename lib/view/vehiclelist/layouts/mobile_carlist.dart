import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/controllers/providers/searchfilter/search_filter_provider.dart';
import 'package:admin_rent/model/car_model.dart';
import 'package:admin_rent/view/car/display/widgets/filterchips.dart';
import 'package:admin_rent/view/vehiclelist/vehicle_card_list.dart';
import 'package:admin_rent/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarListMobileLayout extends StatelessWidget {
  const CarListMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchAndFilterBar(),
        const FilterChips(),
        Expanded(
          child: Consumer<SearchFilterProvider>(
            builder: (context, filterProvider, child) {
              return StreamBuilder<List<CarVehicle>>(
                stream:
                    Provider.of<CarProvider>(context).getCarVehiclesStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error : ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text("No Cars are available"),
                    );
                  } else {
                    List<CarVehicle> cars = snapshot.data!;

                    List<CarVehicle> filteredCars = cars.where((car) {
                      if (filterProvider.searchQuery.isEmpty &&
                          filterProvider.selectedColor == null &&
                          filterProvider.selectedMake == null &&
                          filterProvider.selectedBody == null &&
                          filterProvider.selectedModel == null &&
                          filterProvider.selectedYear == null &&
                          (filterProvider.priceRange.start == 0 &&
                              filterProvider.priceRange.end == 100000)) {
                        return true; // No filters applied, show all cars
                      }
                      bool matchesSearchQuery = car.make
                          .toLowerCase()
                          .contains(filterProvider.searchQuery.toLowerCase());

                      bool matchesColor =
                          filterProvider.selectedColor == null ||
                              car.color == filterProvider.selectedColor;

                      bool matchesMake = filterProvider.selectedMake == null ||
                          car.make == filterProvider.selectedMake;

                      bool matchesBody = filterProvider.selectedBody == null ||
                          car.body == filterProvider.selectedBody;

                      bool matchesModel =
                          filterProvider.selectedModel == null ||
                              car.model == filterProvider.selectedModel;

                      bool matchesYear = filterProvider.selectedYear == null ||
                          // ignore: unrelated_type_equality_checks
                          car.year == filterProvider.selectedYear;

                      // bool matchesPriceRange = car.rentalPriceRange >=
                      //         filterProvider.priceRange.start &&
                      //     car.rentalPriceRange <= filterProvider.priceRange.end;

                      return matchesSearchQuery &&
                          matchesColor &&
                          matchesMake &&
                          matchesBody &&
                          matchesModel &&
                          matchesYear;
                      // matchesPriceRange;
                    }).toList();
                    // List<CarVehicle> filteredCars = cars.where((car) {
                    //   if (filterProvider.selectedFilters.isEmpty) {
                    //     return true; // No filters applied, show all cars
                    //   }
                    //   debugPrint('Filter: ${filterProvider.selectedFilters}');
                    //   return filterProvider.selectedFilters.contains(car.make);
                    // }).toList();

                    return Responsive.isMobile(context)
                        ? ListView.builder(
                            itemBuilder: (context, index) =>
                                CarCard(car: filteredCars[index]),
                            itemCount: filteredCars.length,
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 0.8,
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
      ],
    );
  }
}
