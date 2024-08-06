import 'package:admin_rent/view/requests/widgets/rental_request_main_card.dart';
import 'package:flutter/material.dart';
import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';

class RequestsList extends StatelessWidget {
  final RentalRequestProvider rentalRequestProvider;

  const RequestsList({super.key, required this.rentalRequestProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rentalRequestProvider.allRequests.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: RentalRequestCard(
              request: rentalRequestProvider.allRequests[index]),
        );
      },
    );
  }
}
