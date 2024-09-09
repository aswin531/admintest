import 'package:flutter/material.dart';
import 'package:admin_rent/model/rental_request_model.dart';
import 'package:admin_rent/utils/status_enum.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:admin_rent/style/colors.dart';

class RentalRequestCard extends StatelessWidget {
  final RentalRequest request;

  const RentalRequestCard({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: ExpansionTile(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                  'Start Date: ${DateFormat('MMMM d, yyyy').format(request.pickupDate)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Return Date: ${DateFormat('MMMM d, yyyy').format(request.returnDate)}',
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
                PrimaryText(
                  text: "License : ${request.licenseNumber}",
                  size: 16,
                ),
                const SizedBox(height: 8),
                PrimaryText(
                  text: "Advance Fee : ₹${request.estimatedCost}",
                  color: ExternalAppColors.green,
                  size: 16,
                ),
                const SizedBox(height: 8),
                PrimaryText(
                  text:
                      "Pick-Up Location :  ${request.pickUpLocation.replaceAll('8Q6G+7PV, ', '')}",
                  color: ExternalAppColors.black,
                  size: 16,
                ),
                const SizedBox(height: 8),
                PrimaryText(
                  text:
                      "Dropp-Off Location : ${request.dropOffLocation.replaceAll('8Q6G+7PV, ', '')}",
                  color: ExternalAppColors.black,
                  size: 16,
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
