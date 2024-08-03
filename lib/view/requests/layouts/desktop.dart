import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:admin_rent/model/rental_request_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopLayoutRequestScreen extends StatelessWidget {
  final RentalRequestProvider rentalRequestProvider;

  const DesktopLayoutRequestScreen({super.key,required this.rentalRequestProvider});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildSummaryCards(),
        ),
        Expanded(
          flex: 3,
          child: _buildRequestsList(),
        ),
      ],
    );
  }

  Widget _buildSummaryCards() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSummaryCard('All', rentalRequestProvider.allRequests.length, Colors.blue),
          const SizedBox(height: 16),
          _buildSummaryCard('Pending', rentalRequestProvider.pendingRequests.length, Colors.orange),
          const SizedBox(height: 16),
          _buildSummaryCard('Accepted', rentalRequestProvider.acceptedRequests.length, Colors.green),
          const SizedBox(height: 16),
          _buildSummaryCard('Rejected', rentalRequestProvider.rejectedRequests.length, Colors.red),
        ],
      ),
    );
  }

    Widget _buildSummaryCard(String title, int count, Color color) {
    return Card(
      color: color,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('$count', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsList() {
    return ListView.builder(
      itemCount: rentalRequestProvider.allRequests.length,
      itemBuilder: (context, index) {
        return _buildRentalRequestCard(context, rentalRequestProvider.allRequests[index]);
      },
    );
  }


  Widget _buildRentalRequestCard(BuildContext context, RentalRequest request) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(request.status),
          child: const Icon(Icons.car_rental, color: Colors.white),
        ),
        title: Text('${request.name} - ${request.carId}'),
        subtitle: Text('Phone: ${request.phone}'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pickup: ${request.isPickup}'),
                Text('Return: ${request.endDate}'),
                Text('Duration: ${request.startDate}'),
                Text('Total Cost: \$${request.licenseNumber}'),
                const SizedBox(height: 16),
                if (request.status)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => _acceptRequest(context, request),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text('Accept'),
                      ),
                      ElevatedButton(
                        onPressed: () => _rejectRequest(context, request),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text('Reject'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    Color _getStatusColor(bool? status) {
    if (status == null) return Colors.orange;
    return status ? Colors.green : Colors.red;
  }

  void _acceptRequest(BuildContext context, RentalRequest request) {
Provider.of<RentalRequestProvider>(context, listen: false).approveRequest(request);  }

  void _rejectRequest(BuildContext context, RentalRequest request) {
    Provider.of<RentalRequestProvider>(context, listen: false).rejectRequest(request);
  }


  // ... _buildSummaryCard and _buildRentalRequestCard methods remain the same
}
