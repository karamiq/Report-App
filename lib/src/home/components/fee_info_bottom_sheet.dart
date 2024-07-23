import 'dart:io';
import 'package:app/data/models/ViechleFee.dart';
import 'package:app/data/providers/location_model.dart';
import 'package:app/data/services/clients/auth_client.dart';
import 'package:flutter/material.dart';
import '../../../common_lib.dart';
import 'check_your_location_dialog.dart';
import 'fee_from.dart';
import 'functions.dart';

dynamic feeInfoBottomSheet(BuildContext context, File image) {
  return showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: _FeeInfoBottomSheet(path: image));
    },
  );
}

class _FeeInfoBottomSheet extends ConsumerStatefulWidget {
  final File path;

  const _FeeInfoBottomSheet({required this.path});

  @override
  ConsumerState<_FeeInfoBottomSheet> createState() =>
      _FeeInfoBottomSheetState();
}

class _FeeInfoBottomSheetState extends ConsumerState<_FeeInfoBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.read(locationProvider.notifier).getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(locationProvider);

    return Padding(
      padding: Insets.mediumAll,
      child: ColumnPadded(
        gap: Insets.small,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: SvgPicture.asset(Assets.assetsSvgArrowUp)),
          Form(
            key: _formKey,
            child: const FeeForm(),
          ),
          ElevatedButton(
            onPressed: () async {
              setState(() => isLoading = true);
              if (location == null) {
                CheckYourLocation(context);
                setState(() => isLoading = false);
                return;
              }
              if (_formKey.currentState!.validate()) {
                try {
                  final imageUrl = await postImage(ref, widget.path);
                  final loc = location.placemarks;
                  ViechleFee data = ViechleFee(
                      number: 2345,
                      vehicleId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                      feeFinesId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                      violationLocation: "${loc?.locality}",
                      images: [imageUrl!],
                      lat: location.latitude.toString(),
                      lng: location.longitude.toString(),
                      garageId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                      creationDate: DateTime.now(),
                      note: FeeFormState.notesController.text);

                  //400 error
                  // await ref.read(authClientProvider).postViolation(data);
                  context.pushNamed(RoutesDocument.feeIsSend, extra: data);
                } catch (e) {
                  null;
                }
              } else {
                setState(() => isLoading = false);
                return;
              }
              setState(() => isLoading = false);
            },
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'ارسال المخالفة',
                    style: TextStyle(
                      fontWeight: FontsTheme.mediumWeight,
                      fontSize: FontsTheme.mediumSize,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
