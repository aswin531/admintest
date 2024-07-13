import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:admin_rent/view/dashboard/widgets/car_container_tiles.dart';
import 'package:flutter/material.dart';

class CarModelContainerWidget extends StatelessWidget {
  const CarModelContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: ExternalAppColors.secondaryBg),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: ExternalAppColors.secondaryBg,
                          radius: 15,
                          backgroundImage: AssetImage(
                            "assets/images/logo-honda.jpg",
                          )),
                      PrimaryText(
                        text: "Honda Civic",
                        color: ExternalAppColors.black,
                        fontWeight: FontWeight.w800,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: 400,
                    height: 200,
                    child: Image.asset(
                      "assets/images/civic-bg.png",
                      fit: BoxFit.contain,
                    )),
                const SizedBox(
                  height: 10,
                ),
                const PrimaryText(
                  text: "Rental Price",
                  size: 16,
                  color: ExternalAppColors.secondary,
                ),
                const PrimaryText(
                  text: "38.70",
                  size: 40.0,
                  color: ExternalAppColors.black,
                  fontWeight: FontWeight.w800,
                )
              ],
            ),
            const CarContainerCards()
          ],
        ),
      ),
    );
  }
}
