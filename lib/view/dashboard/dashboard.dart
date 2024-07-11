import 'package:admin_rent/config/size_config.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/view/calendar/calender.dart';
import 'package:admin_rent/view/dashboard/widgets/appbar_items.dart';
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
          Expanded(flex: 1, child: SideBarMenuWidget()),
          Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                //color: ExternalAppColors.secondaryBg,
              )),
          Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: ExternalAppColors.secondaryBg,
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 30.0),
                child: Column(
                  children: [
                    AppBarItems(),
                    Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        //CalendarScreen()
                        Container(
                            width: double.infinity,
                            height: 500,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: const [
                                 
                                ]),
                            child: CustomCalendar())
                      ],
                    )
                  ],
                ),
              )),
        ],
      )),
    );
  }
}
