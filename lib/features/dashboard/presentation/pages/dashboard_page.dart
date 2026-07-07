import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/theme/app_constants.dart';
import '../../../../core/widgets/responsive_layout.dart';
import '../widgets/hero_card.dart';
import '../widgets/projects_card.dart';
import '../widgets/creators_card.dart';
import '../widgets/performance_chart.dart';
import '../widgets/right_panel.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeroCard(),
                const SizedBox(height: AppConstants.spacing24),
                IntrinsicHeight(
                  child: ResponsiveRowColumn(
                    layout:
                        ResponsiveLayout.isDesktop(context) ||
                            ResponsiveLayout.isLargeDesktop(context)
                        ? ResponsiveRowColumnType.ROW
                        : ResponsiveRowColumnType.COLUMN,
                    rowCrossAxisAlignment: CrossAxisAlignment.stretch,
                    rowSpacing: AppConstants.spacing24,
                    columnSpacing: AppConstants.spacing24,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: const ProjectsCard(),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: const CreatorsCard(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppConstants.spacing24),
                const PerformanceChart(),
                const SizedBox(height: AppConstants.spacing24),
                if (!ResponsiveLayout.isLargeDesktop(context))
                  const RightPanel(),
                const SizedBox(height: AppConstants.spacing24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

