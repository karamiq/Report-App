import 'dart:io';

import 'package:app/data/services/clients/auth_client.dart';
import 'package:app/src/home/components/fee_from.dart';
import 'package:app/src/home/components/functions.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../data/models/ViechleFee.dart';
import '../../../data/providers/location_provider.dart';
import '../../../data/providers/user_provider.dart';
import 'car_picture.dart';
import 'check_your_location_dialog.dart';

void feePostDetails(BuildContext context, File image) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    builder: (context) => SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + Insets.medium,
        right: Insets.medium,
        left: Insets.medium,
      ),
      child: FeeSheet(image: image),
    ),
  );
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

class FeeSheet extends ConsumerWidget {
  const FeeSheet({
    super.key,
    required this.image,
  });

  final File? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final loc = ref.watch(locationProvider);

    return ColumnPadded(
      gap: Insets.medium,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: Insets.extraSmall),
        Form(
          key: formKey,
          child: const FeeForm(),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, value, child) {
            return ElevatedButton(
              onPressed: value
                  ? null
                  : () async {
                      isLoading.value = true;
                      try {
                        if (formKey.currentState!.validate()) {
                          if (!await ref
                              .watch(locationProvider.notifier)
                              .getCurrentLocation()) {
                            checkYourLocation(context);
                            return;
                          }
                          final imageUrl = await postImage(ref, image!);
                          Map<String, dynamic> data = {
                            "number": int.parse(
                                FeeFormState.feeNumberContorller.text),
                            "plateNumber":
                                FeeFormState.plateNumberController.text,
                            "plateCharacterId":
                                FeeFormState.plateCharacterId.text,
                            "plateTypeId": FeeFormState.plateTypeId.text,
                            "feeFinesId": FeeFormState.feeFinesId.text,
                            "garageId": user!.garageId,
                            "creationDate": DateTime.now().toIso8601String(),
                            "governorateId":
                                FeeFormState.governorateControllerId.text,
                            "images": [imageUrl],
                            "note": FeeFormState.notesController.text,
                            "lat": loc!.lat.toString(),
                            "lng": loc.lng.toString(),
                            "violationLocation":
                                '${loc.place!.locality}/${loc.place!.subLocality}',
                          };

                          VehicleFee vehicleFee = VehicleFee(
                            number: int.parse(
                                FeeFormState.feeNumberContorller.text),
                            plateNumber:
                                FeeFormState.plateNumberController.text,
                            plateTypeId: FeeFormState.plateTypeId.text,
                            plateCharacter: FeeFormState.charController.text,
                            creationDate: DateTime.now(),
                            governorate:
                                FeeFormState.governorateController.text,
                            images: [imageUrl!],
                            violationLocation:
                                '${loc.place!.locality}/${loc.place!.subLocality}',
                          );

                          // Clear fields
                          FeeFormState.feeNumberContorller.clear();
                          FeeFormState.plateNumberController.clear();
                          FeeFormState.plateTypeId.clear();
                          FeeFormState.charController.clear();
                          FeeFormState.governorateController.clear();
                          FeeFormState.notesController.clear();
                          FeeFormState.governorateControllerId.clear();
                          FeeFormState.plateCharacterId.clear();
                          FeeFormState.feeFinesId.clear();
                          FeeFormState.plateType.clear();
                          FeeFormState.feeFine.clear();
                          TakePictureState.picturePath = null;
                          image!.delete();
                          context.pop();

                          context.pushNamed(RoutesDocument.feeIsSend,
                              extra: vehicleFee);
                        }
                      } finally {
                        isLoading.value = false;
                      }
                    },
              child: value
                  ? const CircularProgressIndicator()
                  : const Text(
                      'ارسال المخالفة',
                      style: TextStyle(
                        fontWeight: FontsTheme.mediumWeight,
                        fontSize: FontsTheme.mediumSize,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}
