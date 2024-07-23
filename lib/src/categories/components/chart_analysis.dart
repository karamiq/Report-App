import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../data/models/commission_analysis_model.dart';
import 'chart_info.dart';
import 'doughnut_chart.dart';

class ChartAnalysisSection extends StatelessWidget {
  const ChartAnalysisSection({
    super.key,
    required this.commissionAnalysis,
  });

  final CommissionAnalysisModel? commissionAnalysis;

  @override
  Widget build(BuildContext context) {
    final List<Color> colorList = List.generate(
      commissionAnalysis!.violationCardAnalysis.length,
      (index) {
        double hue = (index * 560 / 10) % 360;
        return HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor();
      },
    );

    List<ChartData> chartData = List.generate(
        commissionAnalysis!.violationCardAnalysis.length, (index) {
      return ChartData(
          commissionAnalysis!.violationCardAnalysis[index].name,
          commissionAnalysis!.violationCardAnalysis[index].amount,
          colorList[index]);
    });
    return Card(
      color: Theme.of(context).colorScheme.primary.withOpacity(.5),
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        padding: Insets.mediumAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(Insets.medium),
            SizedBox(
              height: 200,
              width: 200,
              child: DonutChart(
                  numberOfVilations: commissionAnalysis!.numberOfViolations,
                  data: chartData),
            ),
            const Gap(Insets.medium),
            const Spacer(),
            Padding(
              padding: Insets.mediumAll,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ChartInfo(
                              title: commissionAnalysis!
                                  .violationCardAnalysis[index].name,
                              data: commissionAnalysis!
                                  .violationCardAnalysis[index].amount,
                              color: colorList[index],
                            ),
                          ),
                          Expanded(
                            child: ChartInfo(
                              title: commissionAnalysis!
                                  .violationCardAnalysis[index + 1].name,
                              data: commissionAnalysis!
                                  .violationCardAnalysis[index + 1].amount,
                              color: colorList[index + 1],
                            ),
                          ),
                        ],
                      ),
                  itemCount:
                      commissionAnalysis!.violationCardAnalysis.length - 1),
            ),
          ],
        ),
      ),
    );
  }
}
