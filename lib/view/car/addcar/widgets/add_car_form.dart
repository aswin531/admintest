import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/view/car/addcar/layouts/addcar_desktop.dart';
import 'package:admin_rent/view/car/addcar/layouts/addcar_mobile.dart';
import 'package:admin_rent/view/car/addcar/layouts/addcar_tablet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      body: Responsive(
        desktop: DesktopLayout(carProvider: carProvider),
        tablet: TabletLayout(carProvider: carProvider),
        mobile: MobileLayout(carProvider: carProvider),
        smallMobile: MobileLayout(carProvider: carProvider),
      ),
    );
  }
}
