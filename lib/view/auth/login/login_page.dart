import 'package:admin_rent/view/auth/login/layouts/desktop/desktop_login.dart';
import 'package:admin_rent/view/auth/login/layouts/mobile/mobile_login.dart';
import 'package:admin_rent/view/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: LayoutWidgetResponsive(
            mobileBody: MobileLoginLayout(),
            desktopBody: DesktopLoginLayout()));
  }
}
