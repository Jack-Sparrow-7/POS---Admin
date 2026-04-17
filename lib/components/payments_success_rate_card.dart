import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/styles/box_styles.dart';
import 'package:pos_admin/styles/text_styles.dart';
import 'package:pos_admin/theme/tokens.dart';

class PaymentsSuccessRateCard extends StatelessWidget {
  const PaymentsSuccessRateCard({super.key});

  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static const _success = [40, 52, 35, 63, 58, 60, 66];
  static const _failed = [2, 3, 3, 4, 4, 5, 4];

  @override
  Widget build(BuildContext context) {
    final successColor = $success.resolve(context);
    final failedColor = $destructive.resolve(context);
    final mutedColor = $mutedFg.resolve(context);
    final borderColor = $border.resolve(context);

    return Box(
      style: card.height(338),
      child: ColumnBox(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: StyledText('Payment Success Rate', style: headingMd),
          ),

          const Gap(16),

          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 100,

                barGroups: List.generate(_days.length, (i) {
                  return BarChartGroupData(
                    x: i,
                    barsSpace: 6,
                    barRods: [
                      BarChartRodData(
                        toY: _success[i].toDouble(),
                        width: 14,
                        color: successColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      BarChartRodData(
                        toY: _failed[i].toDouble(),
                        width: 14,
                        color: failedColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  );
                }),

                gridData: FlGridData(
                  show: true,
                  horizontalInterval: 25,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: borderColor,
                    strokeWidth: 1,
                    dashArray: [3, 3],
                  ),
                ),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 25,
                      reservedSize: 32,
                      getTitlesWidget: (value, _) => StyledText(
                        value.toInt().toString(),
                        style: bodyText.fontSize(12).color(mutedColor),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, _) {
                        final i = value.toInt();
                        if (i < 0 || i >= _days.length) {
                          return const SizedBox.shrink();
                        }
                        return StyledText(
                          _days[i],
                          style: bodyText.fontSize(12).color(mutedColor),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                borderData: FlBorderData(show: false),

                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBorder: BorderSide(color: borderColor),
                    getTooltipColor: (group) => Colors.white,
                    tooltipPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final index = group.x.toInt();
                      final day = _days[index];

                      return BarTooltipItem(
                        '$day\n',
                        const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: 'success : ${_success[index]}\n',
                            style: TextStyle(
                              color: successColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'failed : ${_failed[index]}',
                            style: TextStyle(
                              color: failedColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          const Gap(12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legend(successColor, 'success'),
              const SizedBox(width: 16),
              _legend(failedColor, 'failed'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(color: color, fontSize: 14)),
      ],
    );
  }
}
