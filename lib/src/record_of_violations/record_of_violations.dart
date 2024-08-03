import 'package:app/common_lib.dart';
import 'package:app/data/services/clients/auth_client.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/violation_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/commission_analysis_model.dart';

class RecordOfViolationsPage extends HookConsumerWidget {
  const RecordOfViolationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final items = useState<List<LastViolation>>([]);
    final isLoading = useState<bool>(false);
    final currentPage = useState<int>(1);
    final totalPages = useState<int>(0);

    Future<void> fetchViolations() async {
      try {
        isLoading.value = true;
        final response =
            await ref.read(authClientProvider).vichleFeeGet(currentPage.value);
        totalPages.value = response.totalPages;
        final data = response.data;
        final real = data.map((char) => LastViolation.fromJson(char)).toList();
        if (real.isNotEmpty) {
          items.value = [...items.value, ...real];
          currentPage.value++;
        }
      } finally {
        isLoading.value = false;
      }
    }

    useEffect(() {
      fetchViolations();
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          if (!isLoading.value && currentPage.value <= totalPages.value) {
            fetchViolations();
          }
        }
      });
      return null;
    }, const []);

    return Scaffold(
      appBar: const CustomAppBar(title: 'سجل المخالفات'),
      body: isLoading.value && items.value.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : items.value.isEmpty
              ? const Center(child: Text('لم يتم العثور على مخالفات.'))
              : ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: items.value.length + 1,
                  itemBuilder: (context, index) {
                    if (index == items.value.length) {
                      // Show loading indicator at the bottom
                      return isLoading.value
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : const SizedBox.shrink();
                    }
                    final data = items.value[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ViolationCard(
                        violation: data,
                      ),
                    );
                  },
                ),
    );
  }
}
