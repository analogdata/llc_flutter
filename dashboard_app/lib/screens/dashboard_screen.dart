import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/dashboard_app_bar.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/summary_cards_scroll.dart';
import '../widgets/collections_pie_chart.dart';
import '../widgets/trends_line_chart.dart';
import '../widgets/performance_gauge.dart';
import '../widgets/monthly_collections_card.dart';
import '../widgets/source_breakdown_table.dart';
import '../widgets/remaining_budget_bar_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGrey,
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            DashboardHeader(),
            SizedBox(height: 16),
            SummaryCardsScroll(),
            SizedBox(height: 16),
            CollectionsPieChart(),
            SizedBox(height: 16),
            TrendsLineChart(),
            SizedBox(height: 16),
            PerformanceGauge(),
            SizedBox(height: 16),
            MonthlyCollectionsCard(),
            SizedBox(height: 16),
            SourceBreakdownTable(),
            SizedBox(height: 16),
            RemainingBudgetBarChart(),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppTheme.primaryPurple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'NTR'),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
