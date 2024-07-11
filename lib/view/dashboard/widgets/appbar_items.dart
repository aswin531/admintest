import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarItems extends StatelessWidget {
  const AppBarItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/search-alt.svg")),
        const SizedBox(
          width: 10.0,
        ),
        // IconButton(
        //     onPressed: () {},
        //     icon: SvgPicture.asset("assets/icons/calendar-alt.svg")),
        const SizedBox(
          width: 10.0,
        ),
        const Row(
          children: [
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
