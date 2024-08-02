import 'package:app/common_lib.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/fees_info_card.dart';
import 'package:app/utils/components/viewed_item_title.dart';
import 'package:app/utils/components/violation_card.dart';
import 'package:flutter/material.dart';
import '../../data/models/commission_analysis_model.dart';
import '../../data/services/clients/auth_client.dart';
import 'components/chart_analysis.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<CommissionAnalysisModel?> fetchViolations() async {
      try {
        final response =
            await ref.read(authClientProvider).commissionAnalysis();
        final data = CommissionAnalysisModel.fromJson(response);
        return data;
      } catch (e) {}
      return null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'صفحة الاحصائيات'),
      body: FutureBuilder<CommissionAnalysisModel?>(
        future: fetchViolations(),
        builder: (BuildContext context,
            AsyncSnapshot<CommissionAnalysisModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Container(
                alignment: Alignment.center,
                child: const Center(
                    child: Text('عذرًا، ليس لديك إذن للوصول إلى هذه الصفحة.')));
          } else {
            final commissionAnalysis = snapshot.data;
            return SingleChildScrollView(
              padding: Insets.mediumAll,
              child: ColumnPadded(
                mainAxisAlignment: MainAxisAlignment.start,
                gap: Insets.large,
                children: [
                  ChartAnalysisSection(
                    commissionAnalysis: commissionAnalysis!,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FeesInfoCard(
                        title: ' عدد الغرامات المسجلة',
                        icon: Assets.assetsSvgTrafficSignal,
                        subTitle:
                            commissionAnalysis.numberOfViolations.toString(),
                        onIconPressed: () {},
                      ),
                      FeesInfoCard(
                        title: 'المبلغ الكلي للغرامات المسجلة',
                        icon: Assets.assetsSvgTrafficSignal,
                        subTitle: "${commissionAnalysis.totalPrice}IQD",
                        onIconPressed: () {},
                      ),
                    ],
                  ),
                  ViewedItemsTitle(
                    mainText: 'اخر المخالفات',
                    secontText: 'رؤية المزيد',
                    onTap: () =>
                        context.pushNamed(RoutesDocument.recordOfViolations),
                  ),
                  commissionAnalysis.lastViolations.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: commissionAnalysis.lastViolations.length,
                          separatorBuilder: (context, index) =>
                              const Gap(Insets.medium),
                          itemBuilder: (context, index) => ViolationCard(
                                recieptNumber: commissionAnalysis
                                    .lastViolations[index].number
                                    .toString(),
                                violationType: commissionAnalysis
                                    .lastViolations[index].feeFines.name
                                    .toString(),
                                price: commissionAnalysis
                                    .lastViolations[index].feeFines.amount
                                    .toString(),
                              ))
                      : const Center(
                          child: Text('لم يتم العثور على مخالفات.'),
                        ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
