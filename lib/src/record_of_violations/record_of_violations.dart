import 'package:app/common_lib.dart';
import 'package:app/data/models/data_model.dart';
import 'package:app/data/services/clients/auth_client.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/violation_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/commission_analysis_model.dart';

class RecordOfViolationsPage extends ConsumerWidget {
  const RecordOfViolationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<DataModel?> fetchViolations() async {
      try {
        final response = await ref.read(authClientProvider).vichleFeeGet();
        return response;
      } catch (e) {
        return null;
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'سجل المخالفات'),
      body: FutureBuilder<DataModel?>(
        future: fetchViolations(),
        builder: (BuildContext context, AsyncSnapshot<DataModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
                child: Text('عذرًا، ليس لديك إذن للوصول إلى هذه الصفحة.'));
          } else if (snapshot.data!.data.isEmpty) {
            return const Center(child: Text('لم يتم العثور على مخالفات.'));
          } else {
            final violations = snapshot.data!;
            return ListView.separated(
              padding: Insets.mediumAll,
              itemBuilder: (context, index) {
                final dataList = violations.data as List<dynamic>;
                final data = dataList
                    .map((json) =>
                        LastViolation.fromJson(json as Map<String, dynamic>))
                    .toList();
                return ViolationCard(
                  recieptNumber: data[index].number.toString(),
                  violationType: data[index].feeFines.name,
                  price: data[index].feeFines.amount.toString(),
                );
              },
              separatorBuilder: (context, index) => const Gap(Insets.medium),
              itemCount: violations.data.length,
            );
          }
        },
      ),
    );
  }
}
