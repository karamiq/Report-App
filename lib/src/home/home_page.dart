import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app/common_lib.dart';
import 'package:app/data/providers/location_provider.dart';
import 'package:app/data/providers/user_provider.dart';
import 'package:app/src/home/components/check_your_location_dialog.dart';
import 'package:app/data/models/ViechleFee.dart';
import 'components/car_picture.dart';
import 'components/fee_from.dart';
import 'components/functions.dart';
import 'components/home_page_app_bar.dart';

File? picture;

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isLoading = useState(false);
    final user = ref.watch(userProvider);
    final loc = ref.watch(locationProvider);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(locationProvider.notifier).getCurrentLocation();
      });
      return null;
    }, []);
    void fetch() async {
      FeeFormState.feeNumberContorller.text = await lastNumber(ref);
    }

    return Scaffold(
      appBar: HomePageAppBar(
        fetch: fetch,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + Insets.medium,
            right: Insets.medium,
            left: Insets.medium,
          ),
          child: ColumnPadded(
            gap: Insets.medium,
            children: [
              const Gap(Insets.extraSmall),
              TakePicture(tokenPicture: (value) => picture = value),
              Form(
                key: formKey,
                child: const FeeForm(),
              ),
              ElevatedButton(
                onPressed: () async {
                  isLoading.value = true;
                  if (!await ref
                      .watch(locationProvider.notifier)
                      .getCurrentLocation()) {
                    checkYourLocation(context);
                    isLoading.value = false;
                    return;
                  }
                  if (picture == null) {
                    Utils.showErrorSnackBar('التقط صورة للسيارة المخالفة');
                    isLoading.value = false;
                    return;
                  }
                  if (formKey.currentState!.validate() && picture != null) {
                    try {
                      final imageUrl = await postImage(ref, picture!);

                      Map<String, dynamic> data = {
                        "number":
                            int.parse(FeeFormState.feeNumberContorller.text),
                        "plateNumber": FeeFormState
                            .plateNumberController.text, // Ensure it's a String
                        "plateCharacterId": FeeFormState.plateCharacterId.text,
                        "plateTypeId": FeeFormState.plateTypeId.text,
                        "feeFinesId": FeeFormState.feeFinesId.text,
                        "garageId": user!.garageId,
                        "creationDate": DateTime.now()
                            .toIso8601String(), // Convert DateTime to ISO8601 string
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
                          number:
                              int.parse(FeeFormState.feeNumberContorller.text),
                          plateNumber: FeeFormState.plateNumberController.text,
                          plateTypeId: FeeFormState.plateTypeId.text,
                          plateCharacter: FeeFormState.charController.text,
                          creationDate: DateTime.now(),
                          governorate: FeeFormState.governorateController.text,
                          images: [imageUrl!],
                          violationLocation:
                              '${loc.place!.locality}/${loc.place!.subLocality}');
                      print(data);
                      //400 error
                      //await ref.read(authClientProvider).postViolation(data);
                      context.pushNamed(RoutesDocument.feeIsSend,
                          extra: vehicleFee);
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    isLoading.value = false;
                    return;
                  }
                  isLoading.value = false;
                },
                child: isLoading.value
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
        ),
      ),
    );
  }
}
