import 'package:admin_rent/utils/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:admin_rent/model/rental_request_model.dart';

class RequestList extends StatelessWidget {
  final RentalRequestProvider rentalRequestProvider;
  final ValueNotifier<RentalRequestStatus> selectedStatusNotifier;

  const RequestList({
    super.key,
    required this.rentalRequestProvider,
    required this.selectedStatusNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<RentalRequestStatus>(
      valueListenable: selectedStatusNotifier,
      builder: (context, selectedStatus, child) {
        final filteredRequests = rentalRequestProvider.filteredRequests;

        return ListView.builder(
          itemCount: filteredRequests.length,
          itemBuilder: (context, index) {
            final request = filteredRequests[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: _buildRentalRequestCard(context, request),
            );
          },
        );
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
                  'Duration: ${request.startDate}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Return: ${request.endDate}',
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
                Text(
                  'Pickup: ${request.isPickup ? "Yes" : "No"}',
                  style: const TextStyle(fontSize: 16),
                ),
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
                          child: const Text('Accept', style: TextStyle(color: Colors.white, fontSize: 16))),
                      ElevatedButton(
                          onPressed: () => _rejectRequest(context, request),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Reject', style: TextStyle(color: Colors.white, fontSize: 16))),
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
      default:
        return Colors.grey; // Default color
    }
  }

  void _acceptRequest(BuildContext context, RentalRequest request) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RentalRequestProvider>(context, listen: false).approveRequest(request);
    });
  }

  void _rejectRequest(BuildContext context, RentalRequest request) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RentalRequestProvider>(context, listen: false).rejectRequest(request);
    });
  }
}
