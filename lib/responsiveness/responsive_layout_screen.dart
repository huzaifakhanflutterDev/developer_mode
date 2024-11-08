import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  Widget mobile, tablet, desktop;

  ResponsiveLayoutScreen({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) => context.width < 385;

  static bool isTablet(BuildContext context) =>
      context.width > 385 && context.width <= 650;

  static bool isDesktop(BuildContext context) => context.width > 650;

  @override
  Widget build(BuildContext context) {
    if (context.width < 385) {
      return mobile;
    } else if (context.width > 385 && context.width <= 650) {
      return tablet;
    } else {
      return desktop;
    }
  }
}
