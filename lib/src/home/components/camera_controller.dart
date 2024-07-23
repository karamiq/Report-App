import 'dart:io';

import 'package:app/data/services/clients/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/common_lib.dart';
import '../../../data/providers/camera_provider.dart';
import 'fee_info_bottom_sheet.dart';

class CameraControls extends StatelessWidget {
  const CameraControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ref = ProviderScope.containerOf(context).read;
    Future<void> takePicture() async {
      try {
        final cameraController =
            ref(cameraNotifierProvider.notifier).state.cameraController;
        if (cameraController != null) {
          final picture = await cameraController.takePicture();

          // final imageUrl = ref(authClientProvider).postFile(path);
          feeInfoBottomSheet(context, File(picture.path));
        }
      } catch (e) {
        print('Error capturing picture: $e');
      }
    }

    Future<void> chooseFromGallery() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final path = File(pickedFile.path);
        feeInfoBottomSheet(context, path);
      }
    }

    return Positioned(
      bottom: 20,
      right: 0,
      left: 0,
      child: Padding(
        padding: Insets.mediumAll,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                padding: Insets.mediumAll,
                foregroundColor: Colors.white,
                backgroundColor: Colors.black.withOpacity(.3),
              ),
              onPressed: () =>
                  ref(cameraNotifierProvider.notifier).flipCamera(),
              icon: const Icon(Icons.flip_camera_android_outlined),
            ),
            IconButton(
              onPressed: takePicture,
              style: IconButton.styleFrom(
                padding: Insets.extraSmallAll,
                backgroundColor: Colors.transparent,
              ),
              icon: Container(
                width: 80,
                height: 80,
                padding: Insets.extraSmallAll,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: Colors.white.withOpacity(.7), width: 3),
                ),
                child: Container(
                  padding: Insets.smallAll,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(.9),
                  ),
                ),
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                padding: Insets.mediumAll,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderSize.smallRadius,
                ),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black.withOpacity(.15),
              ),
              onPressed: chooseFromGallery,
              icon: const Icon(Icons.image_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
