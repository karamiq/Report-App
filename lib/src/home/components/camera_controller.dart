import 'dart:io';
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
            TakePicture(
              takePicture: takePicture,
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

class TakePicture extends StatefulWidget {
  const TakePicture({
    super.key,
    required this.takePicture,
  });
  final void Function() takePicture;

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween(begin: 80.0, end: 50.0)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: 50.0, end: 200.0)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1)
    ]).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => InkWell(
        onLongPress: () => controller.forward(),
        child: IconButton(
          onPressed: () {
            controller.forward();
            widget.takePicture();
          },
          style: IconButton.styleFrom(
            padding: Insets.extraSmallAll,
            backgroundColor: Colors.transparent,
          ),
          icon: Container(
            alignment: Alignment.center,
            width: 80,
            height: 80,
            padding: Insets.extraSmallAll,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(.7), width: 3),
            ),
            child: Container(
              width: animation.value,
              height: animation.value,
              padding: Insets.smallAll,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.9),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
