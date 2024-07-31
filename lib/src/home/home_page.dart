import 'dart:io';
import 'package:app/common_lib.dart';
import 'package:app/data/providers/location_model.dart';
import 'package:app/data/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/ViechleFee.dart';
import '../../data/services/clients/auth_client.dart';
import 'components/fee_from.dart';
import 'components/functions.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useState<GlobalKey<FormState>>(GlobalKey<FormState>());
    final user = ref.read(userProvider);
    final isLoading = useState(false);
    File? picture;
    final loc = ref.read(locationProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: Insets.mediumAll,
          child: ColumnPadded(
            gap: Insets.medium,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      onPressed: () =>
                          context.pushNamed(RoutesDocument.profile),
                      icon: SvgPicture.asset(Assets.assetsSvgProfile),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: IconButton(
                      onPressed: () =>
                          context.pushNamed(RoutesDocument.categories),
                      icon: SvgPicture.asset(Assets.assetsSvgCategory),
                    ),
                  ),
                ],
              ),
              TakePicture(tokenPicture: (value) => picture = value),
              Form(
                key: formKey.value,
                child: const FeeForm(),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  isLoading.value = true;
                  if (formKey.value.currentState!.validate()) {
                    try {
                      final imageUrl = await postImage(ref, picture!);
                      // Assuming FeeFormState and user are already defined and initialized

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
                        "note": FeeFormState.notesController,
                        "lat": loc!.latitude,
                        "lng": loc.longitude,
                        "violationLocation":
                            '${loc.placemarks!.locality}/${loc.placemarks!.subLocality}',
                      };
                      VehicleFee vehicleFee = VehicleFee.fromJson(data);

                      //400 error
                      await ref
                          .read(authClientProvider)
                          .postViolation(vehicleFee);
                      context.pushNamed(RoutesDocument.feeIsSend,
                          extra: vehicleFee);
                    } catch (e) {
                      null;
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

class TakePicture extends HookWidget {
  const TakePicture({
    super.key,
    required this.tokenPicture,
  });
  final ValueChanged<File> tokenPicture;

  @override
  Widget build(BuildContext context) {
    final picturePath = useState<File?>(null);

    Future<void> takePicture() async {
      try {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.camera);
        if (pickedFile != null) {
          final path = File(pickedFile.path);
          picturePath.value = path;
          print(picturePath);
          tokenPicture(path);
        }
      } catch (e) {}
    }

    return GestureDetector(
      onTap: takePicture,
      child: Container(
        height: 140,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderSize.mediumRadius,
        ),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderSize.mediumRadius,
              color: Colors.black.withOpacity(.5),
            ),
            child: picturePath.value != null
                ? ClipRRect(
                    borderRadius: BorderSize.mediumRadius,
                    child: Image.file(
                      picturePath.value!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  )
                : const Text(
                    'آضافة صورة',
                    style: TextStyle(
                        fontSize: FontsTheme.bigSize,
                        fontWeight: FontsTheme.mediumBigWeight,
                        color: Colors.white),
                  )),
      ),
    );
  }
}



/*
Stack(
        children: [
          if (cameraState.cameraController != null)
            Positioned.fill(
              child: CameraPreview(cameraState.cameraController!),
            ),
          const CameraControls(),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              onPressed: () => context.pushNamed(RoutesDocument.profile),
              icon: SvgPicture.asset(Assets.assetsSvgProfile),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: () => context.pushNamed(RoutesDocument.categories),
              icon: SvgPicture.asset(Assets.assetsSvgCategory),
            ),
          ),
        ],
      ),
*/