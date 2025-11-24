import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

/// Entry point of the app.
///
/// It simply runs [MyApp], which sets up the MaterialApp
/// and shows a page containing a simple line chart.
void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Line Chart Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LineChartPage(),
    );
  }
}

/// Simple data model that represents one point on the chart.
///
/// [x] and [y] are doubles so they map directly to [FlSpot]'s
/// x and y values.
class ChartPoint {
  final double x;
  final double y;

  const ChartPoint(this.x, this.y);
}

/// Example data that we will plot on the line chart.
///
/// In a real app this could come from an API, database, or be
/// computed at runtime. Keeping it in a separate constant list
/// makes it easy to reuse the same data in multiple charts.
const List<ChartPoint> demoChartData = <ChartPoint>[
  ChartPoint(0, 3),
  ChartPoint(1, 4.5),
  ChartPoint(2, 3.8),
  ChartPoint(3, 6),
  ChartPoint(4, 7.5),
  ChartPoint(5, 6.2),
  ChartPoint(6, 8.5),
];

/// Main page that displays a basic line chart using [fl_chart].
class LineChartPage extends StatelessWidget {
  const LineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Line Chart')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Card-like container to make the chart look more modern.
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  // Keeping a fixed aspect ratio ensures the chart
                  // looks good on different screen sizes.
                  aspectRatio: 1.6,
                  child: LineChart(
                    LineChartData(
                      // Define the visible range for X and Y axis.
                      // These should cover the min/max values in our data.
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 9,

                      // Turn off the grid for a cleaner look.
                      gridData: const FlGridData(show: false),

                      // Configure axis titles and tick labels.
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              // Show labels only at even values for clarity.
                              if (value % 2 != 0)
                                return const SizedBox.shrink();
                              return Text(
                                value.toInt().toString(),
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(color: Colors.grey[700]),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 32,
                            getTitlesWidget: (value, meta) {
                              // Show labels only for integer x values.
                              final int v = value.round();
                              if (v < 0 || v > 6) {
                                return const SizedBox.shrink();
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'P$v',
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(color: Colors.grey[700]),
                                ),
                              );
                            },
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),

                      // Draw a subtle border around the chart.
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                      ),

                      // [lineBarsData] controls how each line on the chart looks.
                      // Here we have only one line.
                      lineBarsData: [
                        LineChartBarData(
                          // Make the line curved instead of straight segments.
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF4F46E5), Color(0xFF22C55E)],
                          ),
                          barWidth: 3,

                          // Show a small dot for each data point.
                          dotData: const FlDotData(show: true),

                          // Fill the area below the line with a translucent color.
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF4F46E5).withOpacity(0.25),
                                const Color(0xFF22C55E).withOpacity(0.05),
                              ],
                            ),
                          ),

                          // Convert our reusable [demoChartData] into
                          // the [FlSpot] objects that fl_chart expects.
                          spots: demoChartData
                              .map((ChartPoint p) => FlSpot(p.x, p.y))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Axis labels below the chart for clarity.
              Text(
                'X axis: Data Points (P0 - P6)',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
              ),
              Text(
                'Y axis: Value',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
