import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_constants.dart';
import 'core/widgets/main_layout.dart';

void main() {
  runApp(const AdStacksApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainLayout();
      },
    ),
  ],
);

class AdStacksApp extends StatelessWidget {
  const AdStacksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AdStacks Dashboard',
      theme: AppTheme.lightTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(
            start: 0,
            end: AppConstants.mobileBreakpoint,
            name: MOBILE,
          ),
          const Breakpoint(
            start: AppConstants.mobileBreakpoint + 1,
            end: AppConstants.tabletBreakpoint,
            name: TABLET,
          ),
          const Breakpoint(
            start: AppConstants.tabletBreakpoint + 1,
            end: AppConstants.desktopBreakpoint - 1,
            name: DESKTOP,
          ),
          const Breakpoint(
            start: AppConstants.desktopBreakpoint,
            end: double.infinity,
            name: '4K',
          ),
        ],
      ),
    );
  }
}

