import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HeartRateData> chartData = [
      HeartRateData(DateTime(2023, 5, 19, 9, 0), 80),
      HeartRateData(DateTime(2023, 5, 19, 9, 5), 85),
      HeartRateData(DateTime(2023, 5, 19, 9, 10), 90),
      HeartRateData(DateTime(2023, 5, 19, 9, 15), 88),
      // Adicione mais dados aqui
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoramento de Batimentos'),
      ),
      body: SfCartesianChart(
        primaryXAxis: DateTimeAxis(),
        series: <ChartSeries>[
          LineSeries<HeartRateData, DateTime>(
            dataSource: chartData,
            xValueMapper: (HeartRateData data, _) => data.time,
            yValueMapper: (HeartRateData data, _) => data.heartRate,
          ),
        ],
      ),
    );
  }
}

class HeartRateData {
  final DateTime time;
  final int heartRate;

  HeartRateData(this.time, this.heartRate);
}
