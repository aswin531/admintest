
import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:flutter/material.dart';

class MobileLayoutRequestScreen extends StatelessWidget {
  final RentalRequestProvider rentalRequestProvider;

  const MobileLayoutRequestScreen({super.key, required this.rentalRequestProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            children: [
             // _buildSummaryCard('All', rentalRequestProvider.allRequests.length, Colors.blue),
              // const SizedBox(width: 8),
              // _buildSummaryCard('Pending', rentalRequestProvider.pendingRequests.length, Colors.orange),
              // const SizedBox(width: 8),
              // _buildSummaryCard('Accepted', rentalRequestProvider.acceptedRequests.length, Colors.green),
              // const SizedBox(width: 8),
              // _buildSummaryCard('Rejected', rentalRequestProvider.rejectedRequests.length, Colors.red),
            ],
          ),
        ),
        // Expanded(
        //   child: _buildRequestsList(),
        // ),
      ],
    );
  }

  // ... _buildRequestsList, _buildSummaryCard, and _buildRentalRequestCard methods remain the same
}