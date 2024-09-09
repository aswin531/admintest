import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/config/size_config.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/view/car/addcar/add_car_form.dart';
import 'package:admin_rent/view/dashboard/widgets/dashboard_contents.dart';
import 'package:admin_rent/view/dashboard/calendar/calender.dart';
import 'package:admin_rent/view/dashboard/widgets/appbar_items.dart';
import 'package:admin_rent/view/dashboard/widgets/custom_tiles.dart';
import 'package:admin_rent/view/requests/rental_requests.dart';
import 'package:admin_rent/view/return/return_car_page.dart';
import 'package:admin_rent/view/vehiclelist/vehicle_card_list.dart';
import 'package:admin_rent/view/widgets/colored_container.dart';
import 'package:admin_rent/view/widgets/custom_interractive_container.dart';
import 'package:admin_rent/view/widgets/sidebar_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_rent/controllers/providers/sidebar/sidebar_controller.dart';

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
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SideBarMenuWidget(),
        ),
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
            )
          : const PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      backgroundColor: ExternalAppColors.secondaryBg,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SideBarMenuWidget(),
                  )),
            Expanded(
              flex: 10,
              child: Consumer<SidebarProvider>(
                builder: (context, sidebarProvider, child) {
                  return _getPage(sidebarProvider.currentPage);
                },
              ),
            ),
            if (Responsive.isDesktop(context) &&
                Provider.of<SidebarProvider>(context).currentPage == 0)
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
                            const TeamContainer()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _getPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const DashBoardContent();
      case 1:
        return const AddVehiclePage();
      case 2:
        return const YetAddVehiclePage();
      case 3:
        return const SomeOtherPage();
      case 4:
        return const AdminRentalRequestsScreen();
      case 5:
        return const AdminReturnDashboard();
      case 6:
        return const YetAddVehiclePage();
      case 7:
        return const YetAddVehiclePage();
      case 8:
        return const YetAddVehiclePage();
      case 9:
        return const AdminRentalRequestsScreen();
      default:
        return const DashBoardContent();
    }
  }
}

class SomeOtherPage extends StatelessWidget {
  const SomeOtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ExternalAppColors.secondaryBg,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: CarListPage()),
          ],
        ),
      ),
    );
  }
}

class YetAddVehiclePage extends StatelessWidget {
  const YetAddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Notification requested");
    // notificationService.isTokenRefresh();
    return ListView(
      shrinkWrap: true,
      children: const [
        InteractiveMessageContainer(
          icon: Icons.abc,
          iconColor: Colors.black,
          message: "HI Interactive",
        ),
        TeamContainer(),
      ],
    );
  }
}
