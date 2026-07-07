import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_constants.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(AppConstants.radius20),
      ),
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Over All Performance',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'The Years',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  _buildLegendItem('Pending Done', AppColors.accentPink),
                  const SizedBox(width: AppConstants.spacing16),
                  _buildLegendItem('Project Done', AppColors.primary),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacing24),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          color: AppColors.textSub,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        );
                        String text = '';
                        switch (value.toInt()) {
                          case 0:
                            text = '2015';
                            break;
                          case 2:
                            text = '2016';
                            break;
                          case 4:
                            text = '2017';
                            break;
                          case 6:
                            text = '2018';
                            break;
                          case 8:
                            text = '2019';
                            break;
                          case 10:
                            text = '2020';
                            break;
                        }
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(text, style: style),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                            color: AppColors.textSub,
                            fontSize: 12,
                          ),
                        );
                      },
                      reservedSize: 28,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: const Border(
                    bottom: BorderSide(color: AppColors.border),
                    left: BorderSide(color: AppColors.border),
                  ),
                ),
                minX: 0,
                maxX: 10,
                minY: 0,
                maxY: 50,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 32),
                      FlSpot(1.5, 38),
                      FlSpot(3, 15),
                      FlSpot(4.5, 45),
                      FlSpot(6, 12),
                      FlSpot(8, 48),
                      FlSpot(10, 20),
                    ],
                    isCurved: true,
                    color: AppColors.accentPink,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 22),
                      FlSpot(1.5, 28),
                      FlSpot(3, 15),
                      FlSpot(4.5, 45),
                      FlSpot(6, 18),
                      FlSpot(8, 38),
                      FlSpot(10, 15),
                    ],
                    isCurved: true,
                    color: AppColors.primary,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      checkToShowDot: (spot, barData) {
                        return spot.x == 6 && spot.y == 18;
                      },
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String title, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: AppConstants.spacing8),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textSub,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

