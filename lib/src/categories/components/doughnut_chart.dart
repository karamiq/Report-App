import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final String category;
  final int value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}

class DonutChart extends StatelessWidget {
  final int numberOfVilations;
  final List<ChartData> data;

  const DonutChart({
    super.key,
    required this.data,
    required this.numberOfVilations,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfCircularChart(
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => '',
              yValueMapper: (ChartData data, _) => data.value,
              pointColorMapper: (ChartData data, _) => data.color,
              dataLabelSettings: const DataLabelSettings(isVisible: false),
              radius: '120%',
              innerRadius: '60%',
            ),
          ],
        ),
        Center(
          child: Text(
            '$numberOfVilations\nمخالفة',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: FontsTheme.mediumBigSize,
                fontWeight: FontsTheme.mediumWeight),
          ),
        )
      ],
    );
  }
}
