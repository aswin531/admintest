import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTiles extends StatelessWidget {
  const CustomTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ExternalAppColors.primaryBg,
      ),
      child: Column(
        children: [
          _buildListTile(
            context,
            iconPath: "admin_rent/assets/icons/mailq.svg",
            title: "Requests",
            subtitle1: "Accepted",
            subtitle2: "Rejected",
          ),
          _buildListTile(
            context,
            iconPath: "admin_rent/assets/icons/another_icon.svg",
            title: "Notifications",
            subtitle1: "New",
            subtitle2: "Seen",
          ),
          _buildListTile(
            context,
            iconPath: "admin_rent/assets/icons/different_icon.svg",
            title: "Messages",
            subtitle1: "Unread",
            subtitle2: "Read",
          ),
          _buildListTile(
            context,
            iconPath: "admin_rent/assets/icons/some_icon.svg",
            title: "Updates",
            subtitle1: "Pending",
            subtitle2: "Completed",
          ),
        ],
      ),
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
