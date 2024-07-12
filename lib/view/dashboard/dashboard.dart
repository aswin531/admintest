import 'package:admin_rent/config/size_config.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/view/calendar/calender.dart';
import 'package:admin_rent/view/dashboard/widgets/appbar_items.dart';
import 'package:admin_rent/view/dashboard/widgets/custom_tiles.dart';
import 'package:admin_rent/view/widgets/sidebar_menu.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 1, child: SideBarMenuWidget()),
          Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                height: double.infinity,
              )),
          Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: ExternalAppColors.secondaryBg,
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AppBarItems(),
                      Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 5,
                          ),
                           CustomCalendar(),
                          const CustomTiles()
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ],
      )),
    );
  }
}
