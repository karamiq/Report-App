import 'dart:io';

import 'package:app/src/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_lib.dart';

class TakePicture extends StatefulWidget {
  const TakePicture({
    super.key,
    required this.tokenPicture,
  });

  final void Function(File? image) tokenPicture;

  @override
  createState() => TakePictureState();
}

class TakePictureState extends State<TakePicture> {
  @override
  void initState() {
    fetch();
    super.initState();
  }

  static File? picturePath;

  Future<void> _takePicture() async {
    try {
      print('ask');
      final statues = await Permission.camera.request();
      if (statues.isPermanentlyDenied || statues.isDenied) {
        openAppSettings();
      }
    } catch (e) {}
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        setState(() {
          picturePath = file;
        });
        widget.tokenPicture(picturePath);
      } else {}
    } catch (e) {}
  }

  void fetch() async {
    PermissionStatus status = await Permission.camera.request();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _takePicture,
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
          child: picturePath != null
              ? ClipRRect(
                  borderRadius: BorderSize.mediumRadius,
                  child: Image.file(
                    picturePath!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              : const Text(
                  'آضافة صورة',
                  style: TextStyle(
                    fontSize: FontsTheme.bigSize,
                    fontWeight: FontsTheme.mediumBigWeight,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
