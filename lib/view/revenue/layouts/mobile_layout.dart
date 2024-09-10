import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  final RentalRequestProvider rentalProvider;

  const MobileLayout({super.key, required this.rentalProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildRevenueSummary(context, rentalProvider),
        ),
        Expanded(
          child: _buildRequestList(context, rentalProvider),
        ),
      ],
    );
  }
  Widget _buildRevenueSummary(BuildContext context, RentalRequestProvider rentalProvider) {
  return Card(
    margin: const EdgeInsets.all(16.0),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Revenue',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '\$${rentalProvider.totalRevenue}',
            style: const TextStyle(fontSize: 32, color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

Widget _buildRequestList(BuildContext context, RentalRequestProvider rentalProvider) {
  return ListView.builder(
    itemCount: rentalProvider.completedRequests.length,
    itemBuilder: (context, index) {
      final request = rentalProvider.completedRequests[index];
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        elevation: 2,
        child: ListTile(
          title: Text(
            request.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Paid: \$${request.estimatedCost}'),
          trailing: const Icon(Icons.check_circle, color: Colors.green),
        ),
      );
    },
  );
}

}
