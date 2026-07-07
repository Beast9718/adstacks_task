import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';
import '../../../../core/widgets/responsive_layout.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radius20),
        image: const DecorationImage(
          image: AssetImage('assets/images/banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          ResponsiveLayout.isMobile(context)
              ? AppConstants.spacing20
              : AppConstants.spacing32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ETHEREUM 2.0',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              'Top Rating\nProject',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(height: AppConstants.spacing12),
            SizedBox(
              width: ResponsiveLayout.isMobile(context) ? 200 : 300,
              child: Text(
                'Trending project and high rating\nProject Created by team.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.spacing24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ethereum 2.0 Details loaded!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkNavy,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing24,
                  vertical: AppConstants.spacing12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radius12),
                ),
                elevation: 0,
              ),
              child: const Text('Learn More.'),
            ),
          ],
        ),
      ),
    );
  }
}

