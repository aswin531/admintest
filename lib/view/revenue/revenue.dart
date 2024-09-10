import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:admin_rent/view/revenue/layouts/desktop_laypout.dart';
import 'package:admin_rent/view/revenue/layouts/mobile_layout.dart';
import 'package:admin_rent/view/revenue/layouts/tablet_layout.dart';
import 'package:flutter/material.dart';
import 'package:admin_rent/config/responsive.dart';
import 'package:provider/provider.dart';

class RentalRevenuePage extends StatelessWidget {
  const RentalRevenuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final rentalProvider = Provider.of<RentalRequestProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rental Revenue'),
      ),
      body: Responsive(
        desktop: DesktopLayout(rentalProvider: rentalProvider),
        tablet: TabletLayout(rentalProvider: rentalProvider),
        mobile: MobileLayout(rentalProvider: rentalProvider),
        smallMobile: MobileLayout(rentalProvider: rentalProvider),
      ),
    );
  }
}
