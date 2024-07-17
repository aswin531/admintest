import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/config/size_config.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/view/car/addcar/addcar.dart';
import 'package:admin_rent/view/car/addcar/widgets/colorpicker_formfield.dart';
import 'package:admin_rent/view/dashboard/calendar/calender.dart';
import 'package:admin_rent/view/dashboard/widgets/appbar_items.dart';
import 'package:admin_rent/view/dashboard/widgets/car_container.dart';
import 'package:admin_rent/view/dashboard/widgets/custom_tiles.dart';
import 'package:admin_rent/view/dashboard/widgets/dash_header_search.dart';
import 'package:admin_rent/view/dashboard/widgets/customcard.dart';
import 'package:admin_rent/view/dashboard/widgets/table.dart';
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
                            const CustomTiles()
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
        return const AnotherPage();
      case 3:
        return const YetAnotherPage();
      case 4:
        return const YetAnotherPage();
      case 5:
        return const YetAnotherPage();
      case 6:
        return const YetAnotherPage();
      case 7:
        return const YetAnotherPage();
      case 8:
        return const YetAnotherPage();
      case 9:
        return const YetAnotherPage();
      default:
        return const DashBoardContent();
    }
  }
}

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

// Example other pages
class SomeOtherPage extends StatelessWidget {
  const SomeOtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: Text('Some Other Page')),
        ColorpickerFormfield()
      ],
    );
  }
}

class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: Text('Some Other Page')),
        ColorpickerFormfield()
      ],
    );
  }
}

class YetAnotherPage extends StatelessWidget {
  const YetAnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Yet Another Page'));
  }
}


//device_preview