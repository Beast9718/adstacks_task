import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;
  bool _isWorkspacesExpanded = true;

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': Icons.home_filled, 'title': 'Home'},
    {'icon': Icons.people_outline, 'title': 'Employees'},
    {'icon': Icons.list_alt, 'title': 'Attendance'},
    {'icon': Icons.calendar_today, 'title': 'Summary'},
    {'icon': Icons.info_outline, 'title': 'Information'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.sidebarWhite,
      child: Column(
        children: [
          const SizedBox(height: AppConstants.spacing24),
          _buildLogo(),
          const SizedBox(height: AppConstants.spacing32),
          _buildUserProfile(),
          const SizedBox(height: AppConstants.spacing32),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacing16,
              ),
              children: [
                ...List.generate(_menuItems.length, (index) {
                  return _buildMenuItem(
                    icon: _menuItems[index]['icon'],
                    title: _menuItems[index]['title'],
                    isSelected: _selectedIndex == index,
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                }),
                const SizedBox(height: AppConstants.spacing16),
                _buildWorkspacesSection(),
              ],
            ),
          ),
          _buildBottomActions(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'AS',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: AppConstants.spacing4),
        Text(
          'AdStacks',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildUserProfile() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.orangeAccent, width: 2),
            image: const DecorationImage(
              image: AssetImage('assets/avatars/avatar_main.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: AppConstants.spacing12),
        Text('Pooja Mishra', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppConstants.spacing4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('Admin', style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.radius12),
      child: AnimatedContainer(
        duration: AppConstants.animationDuration,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacing16,
          vertical: AppConstants.spacing12,
        ),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppConstants.radius12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              )
            : null,
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : AppColors.textSub,
              size: 20,
            ),
            const SizedBox(width: AppConstants.spacing16),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected ? Colors.black : AppColors.textSub,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkspacesSection() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isWorkspacesExpanded = !_isWorkspacesExpanded;
            });
          },
          child: Container(
            color: AppColors.primary.withValues(alpha: 0.05),
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.spacing12,
              horizontal: AppConstants.spacing16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'WORKSPACES',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.black87,
                  ),
                ),
                const Icon(Icons.add, size: 16, color: Colors.black87),
              ],
            ),
          ),
        ),
        if (_isWorkspacesExpanded)
          Column(
            children: [
              _buildWorkspaceItem('Adstacks'),
              _buildWorkspaceItem('Finance'),
            ],
          ),
      ],
    );
  }

  Widget _buildWorkspaceItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.spacing8,
        horizontal: AppConstants.spacing12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 16,
            color: AppColors.textSub,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        children: [
          _buildActionItem(Icons.settings_outlined, 'Setting'),
          const SizedBox(height: AppConstants.spacing16),
          _buildActionItem(Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String title) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 800),
            content: Text('$title clicked'),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textSub, size: 20),
            const SizedBox(width: AppConstants.spacing16),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSub),
            ),
          ],
        ),
      ),
    );
  }
}

