import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/config/size_config.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/view/calendar/calender.dart';
import 'package:admin_rent/view/dashboard/widgets/appbar_items.dart';
import 'package:admin_rent/view/dashboard/widgets/car_container.dart';
import 'package:admin_rent/view/dashboard/widgets/custom_tiles.dart';
import 'package:admin_rent/view/dashboard/widgets/dash_header_search.dart';
import 'package:admin_rent/view/dashboard/widgets/customcard.dart';
import 'package:admin_rent/view/dashboard/widgets/table.dart';
import 'package:admin_rent/view/widgets/sidebar_menu.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(
        width: 100,
        child: SideBarMenuWidget(),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: ExternalAppColors.black,
                  )),
              //actions: [SliverAppBar.large()],
            )
          : const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      backgroundColor: ExternalAppColors.secondaryBg,
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(flex: 1, child: SideBarMenuWidget()),
          Expanded(
              flex: 10,
              child: SizedBox(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 26.0, horizontal: 26.0),
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
                ),
              )),
          if (Responsive.isDesktop(context))
            Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 38.0, horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const AppBarItems(),
                        Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 5,
                            ),
                            const CustomCalendar(),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const CustomTiles(),
                            const SizedBox(
                              height: 10.0,
                            ),
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
