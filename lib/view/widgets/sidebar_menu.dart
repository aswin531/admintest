import 'package:admin_rent/controllers/providers/sidebar/sidebar_controller.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SideBarMenuWidget extends StatelessWidget {
  const SideBarMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ExternalAppColors.secondaryBg,
      ),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 100,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset("assets/images/logo-dash.png"),
              ),
            ),
            _buildIconButton("assets/icons/dash-figma.svg", 0),
            _buildIconButton("assets/icons/car-figma.svg", 1),
            _buildIconButton("assets/icons/cat-layer-figma.svg", 2),
            _buildIconButton("assets/icons/key.svg", 3),
            _buildIconButton("assets/icons/review-figma.svg", 4),
            _buildIconButton("assets/icons/credit-figma.svg", 5),
            _buildIconButton("assets/icons/user-figma.svg", 6),
            _buildIconButton("assets/icons/setting-figma.svg", 7),
            _buildIconButton("assets/icons/help-figma.svg", 8),
            _buildIconButton("assets/icons/signout.svg", 9),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetName, int pageIndex) {
    return Consumer<SidebarProvider>(
      builder: (context, pageState, child) {
        return IconButton(
          onPressed: () {
            pageState.setPage(pageIndex);
          },
          icon: SvgPicture.asset(
            assetName,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          iconSize: 24,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
        );
      },
    );
  }
}
