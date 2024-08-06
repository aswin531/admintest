// import 'package:admin_rent/utils/status_enum.dart';
// import 'package:flutter/material.dart';
// import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
// import 'summary_card.dart';

// class VerticalSummaryCards extends StatelessWidget {
//   final RentalRequestProvider rentalRequestProvider;
//   final ValueNotifier<RentalRequestStatus> selectedStatusNotifier;

//   const VerticalSummaryCards({super.key, required this.rentalRequestProvider, required this.selectedStatusNotifier});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           SummaryCard(
//               title: 'All',
//               count: rentalRequestProvider.allRequests.length,
//                           onTap: () => selectedStatusNotifier.value = RentalRequestStatus.pending,


//               color: Colors.blue),
//           const SizedBox(height: 16),
//           SummaryCard(
//               title: 'Pending',
//               count: rentalRequestProvider.pendingRequests.length,
//                           onTap: () => selectedStatusNotifier.value = RentalRequestStatus.pending,

//               color: Colors.orange),
//           const SizedBox(height: 16),
//           SummaryCard(
//               title: 'Accepted',
//               count: rentalRequestProvider.acceptedRequests.length,
//                           onTap: () => selectedStatusNotifier.value = RentalRequestStatus.accepted,

//               color: Colors.green),
//           const SizedBox(height: 16),
//           SummaryCard(
//               title: 'Rejected',
//               count: rentalRequestProvider.rejectedRequests.length,
//                           onTap: () => selectedStatusNotifier.value = RentalRequestStatus.rejected,

//               color: Colors.red),
//         ],
//       ),
//     );
//   }
// }
