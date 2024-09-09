import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:admin_rent/model/rental_request_model.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:admin_rent/utils/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopLayoutRequestScreen extends StatelessWidget {
  final RentalRequestProvider rentalRequestProvider;

  const DesktopLayoutRequestScreen(
      {super.key, required this.rentalRequestProvider});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
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
          _buildSummaryCard(
              'All', rentalRequestProvider.allRequests.length, Colors.blue),
          const SizedBox(height: 16),
          _buildSummaryCard('Pending',
              rentalRequestProvider.pendingRequests.length, Colors.orange),
          const SizedBox(height: 16),
          _buildSummaryCard('Accepted',
              rentalRequestProvider.acceptedRequests.length, Colors.green),
          const SizedBox(height: 16),
          _buildSummaryCard('Rejected',
              rentalRequestProvider.rejectedRequests.length, Colors.red),
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
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('$count',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsList() {
    return ListView.builder(
      itemCount: rentalRequestProvider.allRequests.length,
      itemBuilder: (context, index) {
        return _buildRentalRequestCard(
            context, rentalRequestProvider.allRequests[index]);
      },
    );
  }

  Widget _buildRentalRequestCard(BuildContext context, RentalRequest request) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(request.status),
          child: const Icon(Icons.car_rental, color: Colors.white),
        ),
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            request.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Request ID - ${request.userId}',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Duration: ${request.pickupDate}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Return: ${request.returnDate}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Address: ${request.address}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Phone: ${request.phone}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                // Text(
                //   'Pickup: ${request.isPickup ? "Yes" : "No"}',
                //   style: const TextStyle(fontSize: 16),
                // ),
                const SizedBox(height: 16),
                if (request.status == RentalRequestStatus.pending)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () => _acceptRequest(context, request),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const PrimaryText(
                            text: 'Accept',
                            color: ExternalAppColors.white,
                            size: 16,
                          )),
                      ElevatedButton(
                          onPressed: () => _rejectRequest(context, request),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const PrimaryText(
                            text: 'Reject',
                            color: ExternalAppColors.white,
                            size: 16,
                          )),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(RentalRequestStatus status) {
    switch (status) {
      case RentalRequestStatus.pending:
        return Colors.orange;
      case RentalRequestStatus.accepted:
        return Colors.green;
      case RentalRequestStatus.rejected:
        return Colors.red;
    }
  }

  void _acceptRequest(BuildContext context, RentalRequest request) {
    Provider.of<RentalRequestProvider>(context, listen: false)
        .approveRequest(request);
  }

  void _rejectRequest(BuildContext context, RentalRequest request) {
    Provider.of<RentalRequestProvider>(context, listen: false)
        .rejectRequest(request);
  }
}
