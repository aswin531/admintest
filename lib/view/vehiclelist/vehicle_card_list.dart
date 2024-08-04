import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/model/car_model.dart';
import 'package:admin_rent/view/vehiclelist/layouts/desktop_carlist.dart';
import 'package:admin_rent/view/vehiclelist/layouts/mobile_carlist.dart';
import 'package:admin_rent/view/vehiclelist/layouts/tablet_carlist.dart';
import 'package:admin_rent/view/vehiclelist/widgets/car_status.dart';
import 'package:admin_rent/view/widgets/delete_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        desktop: CarListDesktopLayout(),
        tablet: CarListTabletLayout(),
        mobile: CarListMobileLayout(),
        smallMobile: CarListMobileLayout(),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  // final VoidCallback onDelete;
  final CarVehicle car;
  const CarCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Main Image URL: ${car.mainImageUrl}');
    debugPrint('Additional Image URL: ${car.imageUrls.last}');

    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            car.imageUrls.last,
            fit: BoxFit.cover,
            // errorBuilder: (context, error, stackTrace) {
            //   return const Icon(Icons.error);
            // },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(car.model,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Chip(label: Text(car.model)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.person, size: 16),
                    const Text(' 4'),
                    const SizedBox(width: 8),
                    const Icon(Icons.local_gas_station, size: 16),
                    Text(car.engine),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Color: ${car.color}'),
                Text('Year: ${car.year}'),
                Text(
                    'Deposit: ${car.rentalPriceRange.start} - ${car.rentalPriceRange.end}'),
                const SizedBox(height: 8),
                //Text('Status: ${car.status ? 'Available' : 'Not Available'}'),
                CarStatusIndicator(isAvailable: car.status),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        '${car.rentalPriceRange.start} - ${car.rentalPriceRange.end} TL',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              DeleteAccountDialog(
                            onDelete: () async {
                              final carProvider = Provider.of<CarProvider>(
                                  context,
                                  listen: false);
                              await carProvider.deleteCarVehicle(
                                  context, car.carId);
                              debugPrint('Vehicle deleted');
                            },
                          ),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.filePen),
                      color: Colors.blue,
                    )
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
