import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(Icons.layers_outlined, color: AppTheme.primaryPurple),
            SizedBox(width: 8),
            Text(
              'NTR Collections',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: const [
              Text('2023/24', style: TextStyle(fontWeight: FontWeight.w500)),
              Icon(Icons.keyboard_arrow_down, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
