import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

class ProjectsCard extends StatefulWidget {
  const ProjectsCard({super.key});

  @override
  State<ProjectsCard> createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {
  int _selectedIndex = 0;

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
            'All Projects',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: AppConstants.spacing16),
          _buildProjectTile(
            context,
            'Technology behind the Blockchain',
            'Project #1',
            index: 0,
          ),
          const SizedBox(height: AppConstants.spacing12),
          _buildProjectTile(
            context,
            'Technology behind the Blockchain',
            'Project #2',
            index: 1,
          ),
          const SizedBox(height: AppConstants.spacing12),
          _buildProjectTile(
            context,
            'Technology behind the Blockchain',
            'Project #3',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectTile(
    BuildContext context,
    String title,
    String subtitle, {
    required int index,
  }) {
    final isHighlighted = _selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Selected $subtitle')));
      },
      borderRadius: BorderRadius.circular(AppConstants.radius12),
      child: Container(
        padding: const EdgeInsets.all(AppConstants.spacing12),
        decoration: BoxDecoration(
          color: isHighlighted
              ? const Color(0xFFD24A5D)
              : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppConstants.radius12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isHighlighted
                    ? Colors.black.withValues(alpha: 0.15)
                    : Colors.blueAccent.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.code,
                color: isHighlighted ? Colors.white : Colors.blueAccent,
              ),
            ),
            const SizedBox(width: AppConstants.spacing12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '$subtitle • ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'See project details',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Colors.white.withValues(alpha: 0.5),
                size: 16,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit project clicked')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

