
import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:flutter/material.dart';

class TabletLayoutRequestScreen extends StatelessWidget {
  final RentalRequestProvider rentalRequestProvider;

  const TabletLayoutRequestScreen({super.key, required this.rentalRequestProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            children: [
              // _buildSummaryCard('All', rentalRequestProvider.allRequests.length, Colors.blue),
              // const SizedBox(width: 16),
              // _buildSummaryCard('Pending', rentalRequestProvider.pendingRequests.length, Colors.orange),
              // const SizedBox(width: 16),
              // _buildSummaryCard('Accepted', rentalRequestProvider.acceptedRequests.length, Colors.green),
              // const SizedBox(width: 16),
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
