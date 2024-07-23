import 'package:app/data/providers/location_model.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';

Future<void> CheckYourLocation(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => CheckYourLocationDialog(),
  );
}

class CheckYourLocationDialog extends ConsumerStatefulWidget {
  @override
  createState() => _CheckYourLocationDialogState();
}

class _CheckYourLocationDialogState
    extends ConsumerState<CheckYourLocationDialog> {
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.read(locationProvider.notifier).getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('الموقع مجهول'),
      content: const SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('رجاء اسمح بالحصول علي موقعك الحالي'),
          ],
        ),
      ),
      actions: [
        SizedBox(
          height: 40,
          width: 150,
          child: ElevatedButton(
            onPressed: () async {
              setState(() {
                _isLoading = true;
              });
              // Simulate a network call or location fetch
              await ref.read(locationProvider.notifier).getCurrentLocation();
              context.pop();
              setState(() {
                _isLoading = false;
              });
            },
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Text('تحديد الموقع'),
          ),
        ),
      ],
    );
  }
}
