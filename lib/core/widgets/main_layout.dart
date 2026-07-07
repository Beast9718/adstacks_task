import 'package:flutter/material.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/dashboard/presentation/widgets/sidebar.dart';
import '../../features/dashboard/presentation/widgets/right_panel.dart';
import '../../features/dashboard/presentation/widgets/top_app_bar.dart';
import 'responsive_layout.dart';
import '../theme/app_colors.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer:
          ResponsiveLayout.isDesktop(context) ||
              ResponsiveLayout.isLargeDesktop(context)
          ? null
          : const Drawer(child: Sidebar()),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ResponsiveLayout.isDesktop(context) ||
              ResponsiveLayout.isLargeDesktop(context))
            const Sidebar(),
          Expanded(
            child: Column(
              children: [
                const TopAppBar(),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: DashboardPage()),
                      if (ResponsiveLayout.isLargeDesktop(context))
                        const SizedBox(
                          width: 320,
                          child: SingleChildScrollView(child: RightPanel()),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

