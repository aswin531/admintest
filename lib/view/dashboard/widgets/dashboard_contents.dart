
import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/view/dashboard/widgets/car_container.dart';
import 'package:admin_rent/view/dashboard/widgets/custom_tiles.dart';
import 'package:admin_rent/view/dashboard/widgets/customcard.dart';
import 'package:admin_rent/view/dashboard/widgets/dash_header_search.dart';
import 'package:admin_rent/view/dashboard/widgets/table.dart';
import 'package:flutter/material.dart';

class DashBoardContent extends StatelessWidget {
  const DashBoardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashHeaderWidget(),
            const SizedBox(
              height: 10.0,
            ),
            const HorizontalCards(),
            const SizedBox(
              height: 10.0,
            ),
            const CarModelContainerWidget(),
            const SizedBox(
              height: 10.0,
            ),
            const TableDashWidget(),
            const SizedBox(
              height: 10.0,
            ),
            if (!Responsive.isDesktop(context)) const CustomTiles(),
            if (!Responsive.isDesktop(context)) const CustomTiles(),
          ],
        ),
      ),
    );
  }
}
