import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartPanel extends StatelessWidget {
  final Map<String, dynamic> data;

  const ChartPanel({required this.data});

  @override
  Widget build(BuildContext context) {
    int cases = data['cases'];
    int deaths = data['deaths'];
    int recovered = data['recovered'];

    double total = (cases + deaths + recovered).toDouble();

    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: cases.toDouble(),
              color: Colors.orange,
              title: 'Cases',
            ),
            PieChartSectionData(
              value: deaths.toDouble(),
              color: Colors.red,
              title: 'Deaths',
            ),
            PieChartSectionData(
              value: recovered.toDouble(),
              color: Colors.green,
              title: 'Recovered',
            ),
          ],
          sectionsSpace: 4,
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}
