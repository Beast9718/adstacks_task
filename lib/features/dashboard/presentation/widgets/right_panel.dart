import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.darkNavy,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radius24),
          bottomLeft: Radius.circular(AppConstants.radius24),
        ),
      ),
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        children: [
          Text(
            'GENERAL 10:00 AM TO 7:00 PM',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: AppConstants.spacing24),

          const CalendarCard(),
          const SizedBox(height: AppConstants.spacing24),

          const EventCard(
            title: 'Today Birthday',
            total: 2,
            buttonText: 'Birthday Wishing',
            icon: Icons.cake,
          ),
          const SizedBox(height: AppConstants.spacing24),

          const EventCard(
            title: 'Anniversary',
            total: 3,
            buttonText: 'Anniversary Wishing',
            icon: Icons.star,
          ),
        ],
      ),
    );
  }
}

class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  int _selectedDay = 27;
  String _selectedMonth = 'OCT';
  String _selectedYear = '2023';

  final List<String> _months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];
  final List<String> _years = ['2021', '2022', '2023', '2024', '2025'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppConstants.radius20),
      ),
      padding: const EdgeInsets.all(AppConstants.spacing20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMonthSelector(),
              const SizedBox(width: AppConstants.spacing16),
              _buildYearSelector(),
            ],
          ),
          const SizedBox(height: AppConstants.spacing16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
                .map(
                  (day) => Text(
                    day,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMain,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: AppConstants.spacing16),
          _buildDatesGrid(),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: _selectedMonth,
        icon: const Icon(Icons.keyboard_arrow_down, size: 16),
        isDense: true,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.black,
        ),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedMonth = newValue;
            });
          }
        },
        items: _months.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }

  Widget _buildYearSelector() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: _selectedYear,
        icon: const Icon(Icons.keyboard_arrow_down, size: 16),
        isDense: true,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Colors.black,
        ),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedYear = newValue;
            });
          }
        },
        items: _years.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
      ),
    );
  }

  Widget _buildDatesGrid() {
    List<Widget> rows = [];
    int startOffset = 2;
    int daysInMonth = 31;

    int currentDay = 1;
    for (int i = 0; i < 5; i++) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < 7; j++) {
        if (i == 0 && j < startOffset) {
          rowChildren.add(_buildDateCell((29 + j).toString(), isMuted: true));
        } else if (currentDay <= daysInMonth) {
          int dayToPass = currentDay;
          bool isSelected = dayToPass == _selectedDay;
          rowChildren.add(
            _buildDateCell(
              dayToPass.toString(),
              isSelected: isSelected,
              dayNumber: dayToPass,
            ),
          );
          currentDay++;
        } else {
          rowChildren.add(
            _buildDateCell(
              (currentDay - daysInMonth).toString(),
              isMuted: true,
            ),
          );
          currentDay++;
        }
      }
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rowChildren,
        ),
      );
      if (i < 4) rows.add(const SizedBox(height: 8));
    }
    return Column(children: rows);
  }

  Widget _buildDateCell(
    String date, {
    bool isSelected = false,
    bool isMuted = false,
    int? dayNumber,
  }) {
    return InkWell(
      onTap: () {
        if (!isMuted && dayNumber != null) {
          setState(() {
            _selectedDay = dayNumber;
          });
        }
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: isSelected
            ? const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              )
            : null,
        child: Text(
          date,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isSelected
                ? Colors.white
                : (isMuted
                      ? Colors.grey.withValues(alpha: 0.5)
                      : AppColors.textSub),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final int total;
  final String buttonText;
  final IconData icon;

  const EventCard({
    super.key,
    required this.title,
    required this.total,
    required this.buttonText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkNavy.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(AppConstants.radius20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      padding: const EdgeInsets.all(AppConstants.spacing20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome, color: Colors.amber, size: 16),
              const SizedBox(width: AppConstants.spacing8),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
              const SizedBox(width: AppConstants.spacing8),
              const Icon(Icons.auto_awesome, color: Colors.amber, size: 16),
            ],
          ),
          const SizedBox(height: AppConstants.spacing16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              total > 3 ? 3 : total,
              (index) => _buildAvatar(index),
            ),
          ),
          const SizedBox(height: AppConstants.spacing16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(width: AppConstants.spacing16),
              Container(
                width: 1,
                height: 16,
                color: Colors.white.withValues(alpha: 0.5),
              ),
              const SizedBox(width: AppConstants.spacing16),
              Text(
                total.toString(),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 800),
                      content: Text('$buttonText sent successfully!'),
                    ),
                  );
              },
              icon: const Icon(Icons.send, size: 16),
              label: Text(buttonText),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.spacing12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radius12),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(int index) {
    return Align(
      widthFactor: 0.7,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.darkNavy, width: 2),
        ),
        child: CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage(
            index % 2 == 0
                ? 'assets/avatars/avatar_1.png'
                : 'assets/avatars/avatar_2.png',
          ),
        ),
      ),
    );
  }
}

