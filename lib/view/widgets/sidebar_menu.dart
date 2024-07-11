import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideBarMenuWidget extends StatelessWidget {
  const SideBarMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ExternalAppColors.secondaryBg,
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
              _buildIconButton("assets/icons/dash-figma.svg"),
              _buildIconButton("assets/icons/car-figma.svg"),
              _buildIconButton("assets/icons/cat-layer-figma.svg"),
              _buildIconButton("assets/icons/cat-layer-figma.svg"),
              _buildIconButton("assets/icons/review-figma.svg"),
              _buildIconButton("assets/icons/credit-figma.svg"),
              _buildIconButton("assets/icons/user-figma.svg"),
              _buildIconButton("assets/icons/setting-figma.svg"),
              _buildIconButton("assets/icons/help-figma.svg"),
              _buildIconButton("assets/icons/signout.svg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetName) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        assetName,
        width: 24,
        height: 24,
        colorFilter:
            const ColorFilter.mode(ExternalAppColors.iconGray, BlendMode.srcIn),
      ),
      iconSize: 24,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
    );
  }
}
