import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphScreen extends StatelessWidget {
  final Map<String, int> graphData;

  const GraphScreen({super.key, required this.graphData});

  @override
  Widget build(BuildContext context) {
    final List<String> dates = graphData.keys.toList();
    final List<int> values = graphData.values.toList();

    final List<FlSpot> spots = values.asMap().entries.map(
      (entry) {
        final index = entry.key;
        final value = entry.value.toDouble();
        return FlSpot(index.toDouble(), value);
      },
    ).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Orders Graph')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: LineChart(
          LineChartData(
            minY: 0.5,
            maxY:
                (values.isEmpty ? 0 : values.reduce((a, b) => a > b ? a : b)) +
                    5.0,
            gridData: FlGridData(
              show: true,
              horizontalInterval: 5,
              getDrawingHorizontalLine: (value) =>
                  FlLine(color: Colors.grey.shade300, strokeWidth: 0.5),
              drawVerticalLine: false,
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                    );
                  },
                ),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: false,
                color: Colors.blue,
                barWidth: 3,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 3,
                    color: Colors.blue,
                    strokeWidth: 1,
                    strokeColor: Colors.white,
                  ),
                ),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipItems: (spots) {
                  return spots.map((spot) {
                    final date = dates[spot.x.toInt()];
                    final value = spot.y.toInt();
                    return LineTooltipItem(
                      '$date\n',
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: '$value orders',
                        ),
                      ],
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
