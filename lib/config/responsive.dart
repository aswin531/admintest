import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  final Widget smallMobile;

  const Responsive({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
    required this.smallMobile,
  });

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 480 &&
      MediaQuery.of(context).size.width < 768;

  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 480;

  @override
  Widget build(BuildContext context) {
    if (isDesktop(context)) {
      return desktop;
    } else if (isTablet(context)) {
      return tablet;
    } else if (isMobile(context)) {
      return mobile;
    } else {
      return smallMobile;
    }
  }
}