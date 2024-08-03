import 'package:admin_rent/controllers/providers/sidebar/sidebar_controller.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SideBarMenuWidget extends StatelessWidget {
  const SideBarMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 50,
      decoration: BoxDecoration(
        color: ExternalAppColors.secondaryBg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildLogo(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem("assets/icons/dash-figma.svg", 0, 'Dashboard'),
                _buildMenuItem("assets/icons/car-figma.svg", 1, 'Vehicle'),
                _buildMenuItem(
                    "assets/icons/cat-layer-figma.svg", 2, 'Details'),
                _buildMenuItem("assets/icons/key.svg", 3, 'Reports'),
                _buildMenuItem("assets/icons/review-figma.svg", 4, 'Bookings'),
                _buildMenuItem("assets/icons/credit-figma.svg", 5, 'Payments'),
                _buildMenuItem("assets/icons/user-figma.svg", 6, 'Customers'),
                _buildMenuItem("assets/icons/setting-figma.svg", 7, 'Settings'),
                _buildMenuItem("assets/icons/help-figma.svg", 8, 'Help'),
              ],
            ),
          ),
          _buildExitButton(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Image.asset(
        "assets/images/logo-dash.png",
        width: double.infinity,
        height: 40,
      ),
    );
  }

  Widget _buildMenuItem(String assetName, int pageIndex, String name) {
    return Consumer<SidebarProvider>(
      builder: (context, pageState, child) {
        final isSelected = pageState.currentPage == pageIndex;
        return Tooltip(
          message: name,
          preferBelow: false,
          verticalOffset: 20,
          child: InkWell(
            onTap: () => pageState.setPage(pageIndex),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: isSelected
                        ? ExternalAppColors.primary
                        : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    assetName,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isSelected ? ExternalAppColors.primary : Colors.blueGrey,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExitButton() {
    return Tooltip(
      message: 'Exit',
      preferBelow: false,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/signout.svg",
                width: 24,
                height: 24,
                colorFilter:
                    const ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
