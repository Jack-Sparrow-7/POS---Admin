import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/styles/box_styles.dart';
import 'package:pos_admin/styles/text_styles.dart';
import 'package:pos_admin/theme/tokens.dart';

class OrdersTrendCard extends StatelessWidget {
  const OrdersTrendCard({super.key});

  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static const _spots = [
    FlSpot(0, 42),
    FlSpot(1, 55),
    FlSpot(2, 38),
    FlSpot(3, 66),
    FlSpot(4, 82),
    FlSpot(5, 95),
    FlSpot(6, 70),
  ];

  @override
  Widget build(BuildContext context) {
    final successColor = $success.resolve(context);
    final mutedColor = $mutedFg.resolve(context); // FIXED
    final borderColor = $border.resolve(context);

    return Box(
      style: card.height(338),
      child: ColumnBox(
        children: [
          Align(
            alignment: Alignment.centerLeft, // FIXED
            child: StyledText('Orders & Revenue Trend', style: headingMd),
          ),

          const Gap(16),

          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: _spots.length - 1,
                minY: 0,
                maxY: 100,

                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    fitInsideHorizontally: true,
                    fitInsideVertically: true,
                    tooltipBorder: BorderSide(color: borderColor),
                    tooltipPadding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
                    getTooltipColor: (_) => Colors.white,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        final index = spot.x.toInt();
                        final day = _days[index];
                        final orders = spot.y.toInt();

                        return LineTooltipItem(
                          '$day\n',
                          const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'orders : $orders',
                              style: TextStyle(
                                color: successColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        );
                      }).toList();
                    },
                  ),

                  getTouchedSpotIndicator: (barData, indexes) {
                    return indexes.map((_) {
                      return TouchedSpotIndicatorData(
                        FlLine(color: borderColor, strokeWidth: 1),
                        FlDotData(
                          getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                            radius: 6,
                            color: successColor,
                            strokeColor: Colors.white,
                            strokeWidth: 3,
                          ),
                        ),
                      );
                    }).toList();
                  },
                ),

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 25,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (_) => FlLine(
                    color: borderColor,
                    strokeWidth: 1,
                    dashArray: [3, 3],
                  ),
                  getDrawingVerticalLine: (_) => FlLine(
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
                      reservedSize: 28,
                      getTitlesWidget: (value, _) => StyledText(
                        value.toInt().toString(),
                        style: bodyText.fontSize(12).color(mutedColor),
                      ),
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 28,
                      getTitlesWidget: (value, _) {
                        final index = value.toInt();
                        if (index < 0 || index >= _days.length) {
                          return const SizedBox.shrink();
                        }

                        return StyledText(
                          _days[index],
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

                lineBarsData: [
                  LineChartBarData(
                    spots: _spots,
                    isCurved: true,
                    color: successColor,
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          successColor.withValues(alpha: 0.18), // FIXED
                          successColor.withValues(alpha: 0.03), // FIXED
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
