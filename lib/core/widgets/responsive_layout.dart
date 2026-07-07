import 'package:flutter/material.dart';
import '../theme/app_constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget? largeDesktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.largeDesktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= AppConstants.mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > AppConstants.mobileBreakpoint &&
      MediaQuery.of(context).size.width <= AppConstants.tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > AppConstants.tabletBreakpoint;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppConstants.desktopBreakpoint) {
          return largeDesktop ?? desktop;
        } else if (constraints.maxWidth > AppConstants.tabletBreakpoint) {
          return desktop;
        } else if (constraints.maxWidth > AppConstants.mobileBreakpoint) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

