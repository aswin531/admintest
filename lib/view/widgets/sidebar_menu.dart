
// ignore_for_file: deprecated_member_use

import 'package:admin_rent/config/size_config.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideBarMenuWidget extends StatelessWidget {
  const SideBarMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        color: ExternalAppColors.secondaryBg,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: CachedNetworkImage(
                    imageUrl: "",
                    placeholder: (context, url) =>
                        Image.asset('assets/images/logo-dash.png'),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/dashboard.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/car.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/cate-layer.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/rental-hand.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/review.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/creditcard.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/person.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/settings.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/help.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/logout.svg",
                  color: ExternalAppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
