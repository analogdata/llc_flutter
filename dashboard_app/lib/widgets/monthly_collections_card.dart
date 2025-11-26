import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MonthlyCollectionsCard extends StatelessWidget {
  const MonthlyCollectionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Monthly Collections',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.lightPurple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Nov 2023/24',
                    style: TextStyle(
                      color: AppTheme.primaryPurple,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildCollectionRow(
              label: 'Current Month',
              value: '33,129,704,679',
              subValue: 'Min: 33,129,704,679',
              percentage: '8%',
              isPositive: true,
            ),
            const SizedBox(height: 16),
            _buildCollectionRow(
              label: '5-Month Cumulative',
              value: '103,692,550,562',
              subValue: 'Initial: 2023-07-01 - 163.7B',
              percentage: '20%',
              isPositive: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCollectionRow({
    required String label,
    required String value,
    required String subValue,
    required String percentage,
    required bool isPositive,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subValue,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isPositive
                  ? AppTheme.accentGreen.withValues(alpha: 0.1)
                  : AppTheme.accentRed.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: isPositive ? AppTheme.accentGreen : AppTheme.accentRed,
                  size: 16,
                ),
                Text(
                  percentage,
                  style: TextStyle(
                    color: isPositive
                        ? AppTheme.accentGreen
                        : AppTheme.accentRed,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
