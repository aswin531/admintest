import 'package:admin_rent/controllers/providers/car/request_form_provider.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomTiles extends StatelessWidget {
  const CustomTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ExternalAppColors.primaryBg,
        ),
        child: Column(
          children: [
            _buildRequestListTile(context),
            _buildListTile(
              context,
              iconPath: "assets/icons/car-figma.svg",
              title: "Notifications",
              subtitle1: "New",
              subtitle2: "Seen",
            ),
            _buildListTile(
              context,
              iconPath: "assets/icons/credit-figma.svg",
              title: "Messages",
              subtitle1: "Unread",
              subtitle2: "Read",
            ),
            // Add more tiles as needed
          ],
        ),
      ),
    );
  }

  Widget _buildRequestListTile(BuildContext context) {
    return Consumer<RentalRequestProvider>(
      builder: (context, provider, child) {
        return Column(
          children: provider.requests.map((request) {
            return ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 15.0),
              visualDensity: VisualDensity.standard,
              leading: Container(
                width: 50.0,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: ExternalAppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SvgPicture.asset(
                  "assets/icons/mailq.svg",
                  width: 20.0,
                ),
              ),
              title: PrimaryText(
                text: request.carId,
                size: 14.0,
                fontWeight: FontWeight.w500,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(text: '',
                    size: 12.0,
                    color: ExternalAppColors.secondary,
                  ),
                  PrimaryText(
                    text: 'START DATE /*\}',
                    size: 12.0,
                    color: ExternalAppColors.secondary,
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.green),
                    onPressed: () {
                    //  provider.approveRequest(request);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                     // provider.rejectRequest(request);
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required String iconPath,
    required String title,
    required String subtitle1,
    required String subtitle2,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0, right: 15.0),
      visualDensity: VisualDensity.standard,
      leading: Container(
        width: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: ExternalAppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          iconPath,
          width: 20.0,
        ),
      ),
      title: PrimaryText(
        text: title,
        size: 14.0,
        fontWeight: FontWeight.w500,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: subtitle1,
            size: 12.0,
            color: ExternalAppColors.secondary,
          ),
          PrimaryText(
            text: subtitle2,
            size: 12.0,
            color: ExternalAppColors.secondary,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
