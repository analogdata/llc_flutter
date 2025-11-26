import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SummaryCardsScroll extends StatelessWidget {
  const SummaryCardsScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCard(
            title: 'ANNUAL BUDGET (TZS)',
            value: '1.90 T',
            subtitle: '1,902,429,286,199.67',
            performance: '5.43%',
            color: AppTheme.primaryPurple,
            textColor: Colors.white,
          ),
          const SizedBox(width: 12),
          _buildCard(
            title: 'YTD COLLECTIONS (TZS)',
            value: '103.69 B',
            subtitle: '103,692,550,562',
            performance: '5.43%',
            color: Color(0xFF8E44AD), // Slightly different purple/mauve
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String value,
    required String subtitle,
    required String performance,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor.withValues(alpha: 0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'View',
                  style: TextStyle(
                    color: textColor.withValues(alpha: 0.7),
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: textColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: textColor.withValues(alpha: 0.7),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Performance',
                style: TextStyle(
                  color: textColor.withValues(alpha: 0.8),
                  fontSize: 12,
                ),
              ),
              Text(
                performance,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
