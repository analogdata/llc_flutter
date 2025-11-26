import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CollectionsPieChart extends StatelessWidget {
  const CollectionsPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Collections by Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 60,
                  sections: [
                    PieChartSectionData(
                      color: AppTheme.primaryPurple,
                      value: 70,
                      radius: 25,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: Color(0xFF5C3B82),
                      value: 10,
                      radius: 25,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: Colors.grey,
                      value: 5,
                      radius: 25,
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: Color(0xFF8E44AD),
                      value: 15,
                      radius: 25,
                      showTitle: false,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(AppTheme.primaryPurple, 'DSSF'),
                const SizedBox(width: 16),
                _buildLegendItem(const Color(0xFF5C3B82), 'DMD'),
                const SizedBox(width: 16),
                _buildLegendItem(Colors.grey, 'SDR'),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(const Color(0xFF8E44AD), 'ILR'),
                const SizedBox(width: 16),
                _buildLegendItem(Colors.grey.shade400, 'TTMS'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
