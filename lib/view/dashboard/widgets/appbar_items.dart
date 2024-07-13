import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';

class AppBarItems extends StatelessWidget {
  const AppBarItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: screenWidth < 600
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: [
        if (screenWidth < 600) ...[
          const Text('Dashboard'),
          const Spacer(),
        ],
        const SizedBox(
          width: 10.0,
        ),
        const Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: ExternalAppColors.black,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.message_outlined,
              color: ExternalAppColors.black,
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              Icons.notifications_active_outlined,
              color: ExternalAppColors.black,
            ),
            SizedBox(
              width: 10.0,
            ),
            CircleAvatar(
                backgroundColor: ExternalAppColors.secondaryBg,
                radius: 17,
                backgroundImage: AssetImage(
                  "assets/images/women.png",
                )),
          ],
        )
      ],
    );
  }
}
