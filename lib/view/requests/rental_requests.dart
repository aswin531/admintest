import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:admin_rent/view/requests/layouts/desktop.dart';
import 'package:admin_rent/view/requests/layouts/mobile.dart';
import 'package:admin_rent/view/requests/layouts/tablet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminRentalRequestsScreen extends StatelessWidget {
  const AdminRentalRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rentalRequestProvider = Provider.of<RentalRequestProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Rental Requests'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
             onPressed: () => rentalRequestProvider.refreshRequests(),
            ),
          ],
        ),
        body: Consumer<RentalRequestProvider>(
        builder: (context, rentalRequestProvider, child) {
          if (rentalRequestProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (rentalRequestProvider.hasError) {
            return Center(child: Text('Error: ${rentalRequestProvider.errorMessage}'));
          } else if (rentalRequestProvider.allRequests.isNotEmpty) {
            return Responsive(
              desktop: DesktopLayoutRequestScreen(rentalRequestProvider: rentalRequestProvider),
              tablet: TabletLayoutRequestScreen(rentalRequestProvider: rentalRequestProvider),
              mobile: MobileLayoutRequestScreen(rentalRequestProvider: rentalRequestProvider),
              smallMobile: MobileLayoutRequestScreen(rentalRequestProvider: rentalRequestProvider),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
