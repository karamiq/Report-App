import 'dart:io';

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
  createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  @override
  void initState() {
    fetch();
    super.initState();
  }

  File? _picturePath;

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
          _picturePath = file;
        });
        print('Picture path: ${_picturePath?.path}');
        widget.tokenPicture(_picturePath);
        print('selected Picture: ${file}');
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
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
          child: _picturePath != null
              ? ClipRRect(
                  borderRadius: BorderSize.mediumRadius,
                  child: Image.file(
                    _picturePath!,
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
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
