import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';
import '../../../../core/widgets/responsive_layout.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({super.key});

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacing32),
      decoration: const BoxDecoration(color: AppColors.background),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (ResponsiveLayout.isMobile(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            )
          else
            Text(
              'Home',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.textMain,
                fontWeight: FontWeight.bold,
              ),
            ),

          if (ResponsiveLayout.isTablet(context) ||
              ResponsiveLayout.isDesktop(context) ||
              ResponsiveLayout.isLargeDesktop(context))
            Expanded(
              child: Row(
                children: [
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 350),
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.darkNavy,
                        borderRadius: BorderRadius.circular(
                          AppConstants.radius24,
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (val) => setState(() {}),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.spacing24,
                            vertical: 14,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _searchController.clear();
                                    });
                                  },
                                )
                              : const Icon(Icons.search, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

          Row(
            children: [
              _buildIconButton(
                context,
                Icons.insert_drive_file_outlined,
                'Documents',
              ),
              const SizedBox(width: AppConstants.spacing16),
              _buildIconButton(
                context,
                Icons.notifications_none_outlined,
                'Notifications',
                hasBadge: true,
              ),
              const SizedBox(width: AppConstants.spacing16),
              _buildIconButton(context, Icons.power_settings_new, 'Log Out'),
              const SizedBox(width: AppConstants.spacing24),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 800),
                        content: Text('Profile options clicked'),
                      ),
                    );
                },
                borderRadius: BorderRadius.circular(20),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatars/avatar_main.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context,
    IconData icon,
    String tooltip, {
    bool hasBadge = false,
  }) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 800),
                content: Text('$tooltip clicked'),
              ),
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Icon(icon, color: AppColors.textSub, size: 24),
          ),
        ),
        if (hasBadge)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

