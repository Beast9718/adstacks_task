import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

class CreatorsCard extends StatelessWidget {
  const CreatorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkNavy,
        borderRadius: BorderRadius.circular(AppConstants.radius20),
      ),
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Creators',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppConstants.spacing24),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text('Name', style: _headerStyle(context)),
              ),
              Expanded(
                flex: 1,
                child: Text('Artworks', style: _headerStyle(context)),
              ),
              Expanded(
                flex: 1,
                child: Text('Rating', style: _headerStyle(context)),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing16),
          _buildCreatorRow(
            context,
            '@maddison_c21',
            '9821',
            0.8,
            'assets/avatars/avatar_1.png',
          ),
          const SizedBox(height: AppConstants.spacing16),
          _buildCreatorRow(
            context,
            '@karl.will02',
            '7032',
            0.6,
            'assets/avatars/avatar_2.png',
          ),
          const SizedBox(height: AppConstants.spacing16),
          _buildCreatorRow(
            context,
            '@maddison_c21',
            '9821',
            0.8,
            'assets/avatars/avatar_1.png',
          ),
          const SizedBox(height: AppConstants.spacing16),
          _buildCreatorRow(
            context,
            '@maddison_c21',
            '9821',
            0.8,
            'assets/avatars/avatar_2.png',
          ),
        ],
      ),
    );
  }

  TextStyle _headerStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
      color: Colors.white.withValues(alpha: 0.5),
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildCreatorRow(
    BuildContext context,
    String username,
    String artworks,
    double ratingValue,
    String avatarPath,
  ) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('View profile: $username')));
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage(avatarPath),
                  ),
                  const SizedBox(width: AppConstants.spacing8),
                  Text(
                    username,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                artworks,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: ratingValue,
                        backgroundColor: Colors.deepPurple.withValues(alpha: 0.3),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.deepPurpleAccent,
                        ),
                        minHeight: 6,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

