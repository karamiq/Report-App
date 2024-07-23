import 'package:camera/camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/camera_model.dart';

class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier() : super(CameraState());

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      final controller = CameraController(firstCamera, ResolutionPreset.high);
      await controller.initialize();

      state = state.copyWith(
        cameraController: controller,
        isInitialized: true,
        cameras: cameras,
        selectedCameraIndex: 0,
      );
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> flipCamera() async {
    if (state.cameras == null || state.cameras!.length <= 1) return;

    final newIndex = (state.selectedCameraIndex! + 1) % state.cameras!.length;
    final newCamera = state.cameras![newIndex];

    final controller = CameraController(newCamera, ResolutionPreset.high);
    await controller.initialize();

    state = state.copyWith(
      cameraController: controller,
      isInitialized: true,
      selectedCameraIndex: newIndex,
    );
  }

  void disposeCamera() {
    state.cameraController?.dispose();
    state = state.copyWith(
      cameraController: null,
      isInitialized: false,
      cameras: null,
      selectedCameraIndex: null,
    );
  }
}

final cameraNotifierProvider =
    StateNotifierProvider<CameraNotifier, CameraState>((ref) {
  return CameraNotifier();
});