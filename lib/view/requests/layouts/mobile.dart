import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:admin_rent/utils/status_enum.dart';
import 'package:admin_rent/view/requests/widgets/horizontal_summary_card.dart';
import 'package:admin_rent/view/requests/widgets/request_list.dart';
import 'package:flutter/material.dart';

class MobileLayoutRequestScreen extends StatelessWidget {
  final RentalRequestProvider rentalRequestProvider;

  const MobileLayoutRequestScreen({super.key, required this.rentalRequestProvider});

  @override
  Widget build(BuildContext context) {
          final selectedStatusNotifier = ValueNotifier<RentalRequestStatus>(RentalRequestStatus.pending);

    return Column(
      children: [
        HorizontalSummaryCards(rentalRequestProvider: rentalRequestProvider,selectedStatusNotifier: selectedStatusNotifier,),
        Expanded(
          child: ValueListenableBuilder<RentalRequestStatus>(
            valueListenable: selectedStatusNotifier,
            builder: (context, selectedStatus, child) {
              // Optionally update provider state if needed
              rentalRequestProvider.setStatus(selectedStatus);

              return RequestList(
                rentalRequestProvider: rentalRequestProvider,
                selectedStatusNotifier: selectedStatusNotifier,
              );
            },
          ),
          //child: RequestsList(rentalRequestProvider: rentalRequestProvider),
        ),
      ],
    );
  }
}
