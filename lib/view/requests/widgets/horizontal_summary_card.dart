import 'package:admin_rent/utils/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'summary_card.dart';

class HorizontalSummaryCards extends StatelessWidget {
  final RentalRequestProvider rentalRequestProvider;
  final ValueNotifier<RentalRequestStatus> selectedStatusNotifier;

  const HorizontalSummaryCards(
      {super.key,
      required this.rentalRequestProvider,
      required this.selectedStatusNotifier});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          SummaryCard(
              title: 'All',
              count: rentalRequestProvider.allRequests.length,
              onTap: () =>
                  selectedStatusNotifier.value = RentalRequestStatus.pending,
              color: Colors.blue),
          const SizedBox(width: 12),
          SummaryCard(
              title: 'Pending',
              count: rentalRequestProvider.pendingRequests.length,
              onTap: () =>
                  selectedStatusNotifier.value = RentalRequestStatus.pending,
              color: Colors.orange),
          const SizedBox(width: 12),
          SummaryCard(
              title: 'Accepted',
              count: rentalRequestProvider.acceptedRequests.length,
              onTap: () =>
                  selectedStatusNotifier.value = RentalRequestStatus.accepted,
              color: Colors.green),
          const SizedBox(width: 12),
          SummaryCard(
              title: 'Rejected',
              count: rentalRequestProvider.rejectedRequests.length,
              onTap: () =>
                  selectedStatusNotifier.value = RentalRequestStatus.rejected,
              color: Colors.red),
        ],
      ),
    );
  }
}
